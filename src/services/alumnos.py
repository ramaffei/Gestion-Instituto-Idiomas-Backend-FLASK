from datetime import datetime
from flask import current_app, jsonify
from flask_jwt_extended import create_access_token, set_access_cookies
from sqlalchemy import and_
from src.middlewares.mail import send_email
from src.models.cursos import Curso, CursoSchema
from src.exceptions.errors import ObjectNotFound, UnAuthorize
from src.models.alumnos import Alumno, AlumnoCursoSchema, AlumnoSchema, AlumnosCursos
import pandas as pd

def agregarAlumno(args):
    alumnoSchema = AlumnoSchema().load(args)
    alumno = Alumno(**alumnoSchema)

    curso_id = args.get('curso_id')
    if curso_id:
        try:
            comprobarCursoAlumno(curso_id, alumno)
            comprobarIdiomaAlumno(curso_id, alumno)
            cursos_alumnos = AlumnosCursos(curso_id = curso_id, alumno_id = alumno.id)
            cursos_alumnos.save()
        except:
            raise ObjectNotFound('Ocurrió un error al inscribirte a este curso')
        
    alumno.save()
    return AlumnoSchema().dump(alumno)

def mostrarAlumno(id):
    alumno = Alumno.get_by_id(id)
    if alumno is None:
        raise ObjectNotFound('El alumno no existe')
    return AlumnoSchema().dump(alumno)

def mostrarAlumnos():
    alumnos = Alumno.get_all()
    return AlumnoSchema().dump(alumnos[0], many=True), alumnos[1], alumnos[2]

def actualizarAlumno(id, args):
    alumno = Alumno.get_by_id(id)
    if alumno is None:
        raise ObjectNotFound('El alumno no existe')
    alumnoSchema = AlumnoSchema().load(args)
    
    curso_id = args.get('curso_id')
    if curso_id:
        try:
            comprobarCursoAlumno(curso_id, alumno)
            comprobarIdiomaAlumno(curso_id, alumno)
            cursos_alumnos = AlumnosCursos(curso_id = curso_id, alumno_id = alumno.id)
            cursos_alumnos.save()
        except:
            raise ObjectNotFound('Ocurrio un error al inscribirte a este curso')
        
    alumno.update(alumnoSchema)
    return AlumnoSchema().dump(alumno)

def borrarAlumno(id):
    alumno = Alumno.get_by_id(id)
    if alumno is None:
        raise ObjectNotFound('El alumno no existe')
    alumno.delete()
    return AlumnoSchema(exclude=['cursos',]).dump(alumno)

def registrarAlumno(dni, email):
    alumno = Alumno.get_by_dni(dni)

    if alumno is None:
        alumnoSchema = AlumnoSchema().load({'dni': dni, 'email': email})
        alumno = Alumno(**alumnoSchema)
        alumno.save()

    if not alumno.email == email:
        parts_email = alumno.email.rsplit("@")
        decode_email = parts_email[0][-3:]
        decode_email = decode_email.zfill(len(parts_email[0])).replace('0', '*')
        decode_email = f'{decode_email}@{parts_email[1]}'
        raise UnAuthorize(f'El correo registrado para el dni ingresado es: {decode_email}') 
    
    alumno_json = AlumnoSchema().dump(alumno)

    access_token = create_access_token(identity=alumno.id)
    response = jsonify({'alumno': alumno_json})

    set_access_cookies(response, access_token)
    return response

def desasociarAlumnoCurso(data):
    curso_alumno = AlumnosCursos.query.filter(and_(AlumnosCursos.curso_id == data.get('curso_id'), AlumnosCursos.alumno_id == data.get('alumno_id'))).first()
    if curso_alumno is None:
        raise ObjectNotFound('Ocurrio un problema al desincribirte del curso')
    curso_alumno.delete()
    return {'msg': 'Te desincribiste al curso'}

def consultarAlumnosPorCurso(curso_id):
    alumnos = Alumno.query.filter(Alumno.cursos.any(id = curso_id) ).all()
    return AlumnoSchema( exclude=['cursos',]).dump(alumnos, many=True)

def exportAlumnosPorCurso(curso_id):
    alumnos = consultarAlumnosPorCurso(curso_id)
    df_json = pd.DataFrame(alumnos)
    df_json.to_excel('curso.xlsx', index=False, header=True)
    return {'result': 'ok'}

def enviarCorreoInscripcion(data):
    curso_id = data.get('curso_id')
    curso = Curso.get_by_id(curso_id)
    if curso is None:
        raise ObjectNotFound('No se encontró el curso')
    
    alumno_id = data.get('alumno_id')
    alumno = Alumno.get_by_id(alumno_id)
    if alumno is None:
        raise ObjectNotFound('No se encontró el alumno')
    
    html = f"""<body style='color: black; font-weigh: 600;'><h2>Bienvenido {alumno.nombre} a Oxford!</h2>
    <p>Te encuentras Inscripto en el siguiente curso:</p>
    <h3 style="margin-bottom:6px;">{curso.nombre}</h3>"""

    for horario in curso.horario:
        horario_text = f'<p style="color: blue; margin-bottom: 0px; margin-top:0px;">{horario.diaSemana} de {horario.horaInicio} a {horario.horaFin}</p>'
        html = html+horario_text
    
    inicio_clases = """<h3 style="margin-bottom:3px;">INICIO DE CLASES:</h3> 
    <p style="margin-bottom:0px; margin-top:1px;">📌 <b>MIÉRCOLES 3 DE ABRIL <i>(para grupos de lunes y miércoles)</i></b></p>    
    <p style="margin-bottom:0px; margin-top:1px;">📌 <b>JUEVES 4 DE ABRIL <i>(para grupos de martes y jueves)</i></b></p>
    <p style="margin-bottom:0px; margin-top:1px;">📌 <b>SÁBADO 6 DE ABRIL <i>(para los super acelerados principiantes)</i></b></p>"""
    
    html = html+inicio_clases

    html = html+'<h3 style="margin-bottom: 3px;">ARCHIVOS ÚTILES:</h3>'
    programa = f'<p style="margin-top:1px; margin-bottom:0px;"><a href="{curso.nivel.programa}">Descargar Programa</a></p>'
    material = f'<p style="margin-top:1px; margin-bottom:0px;"><a href="{curso.nivel.material}">Descargar Guia de Materiales</a></p>'

    html = html+programa if curso and curso.nivel.programa else html
    html = html+material if curso and curso.nivel.material else html

    html = html + '<h3 style="margin-bottom: 3px;">TUS DATOS:</h3>'
    
    alumno_datos = f"""<p style="margin-bottom:0px; margin-top:1px;"><b>DNI:</b> { alumno.dni }</p>
    <p style="margin-bottom:0px; margin-top:1px;"><b>FECHA DE NACIMIENTO:</b> { alumno.fecha_nacimiento }</p>
    <p style="margin-bottom:0px; margin-top:1px;"><b>NOMBRE COMPLETO:</b> { alumno.nombre_completo }</p>
    <p><i>Si alguno de estos datos es incorrecto por favor comunícate con el instituto para rectificarlos.</i></p>
    """

    html = html+alumno_datos
    
    html = html+'<h3>Nos vemos pronto!</h3></body>'

    text_body = f"""Bienvenido Rodrigo a Oxford!
Te encuentras Inscripto en el siguiente curso:
{curso.nombre}
Estos son los datos que tenemos en nuestro sistema:
DNI: {alumno.dni}
Fecha de Nacimiento: {alumno.fecha_nacimiento}
Nombre Completo: {alumno.nombre_completo}
Si alguno de estos datos es incorrecto por favor comunícate con el instituto para rectificarlos.
INICIO DE CLASES: MIÉRCOLES 3 DE ABRIL (para grupos de lunes y miércoles) 
JUEVES 4 (para grupos de martes y jueves) y SÁBADO 6 (para los super acelerados principiantes)
Nos vemos pronto!"""
    send_email('Bienvenido a Oxford!', ('Oxford Alta Gracia', 'noresponder@oxfordaltagracia.com.ar'), [alumno.email], text_body, html_body=html)

def comprobarCursoAlumno(curso_id, alumno):
    if any(c.id == curso_id for c in alumno.cursos):
        raise UnAuthorize("Ya te encuentras inscripto a este curso")
        
def comprobarIdiomaAlumno(curso_id, alumno):
    curso = Curso.get_by_id(curso_id)
    if curso and any(i.id == curso.nivel.idioma.id for i in alumno.idiomas):
        raise UnAuthorize('Ya te encuentras inscripto a un curso de este idioma')