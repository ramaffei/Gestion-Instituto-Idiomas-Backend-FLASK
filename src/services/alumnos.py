from datetime import datetime
from flask import jsonify
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
            raise ObjectNotFound('Ocurrio un error al inscribirte a este curso')
        
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
        return agregarAlumno({'dni': dni, 'email': email})
    
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
    print(data)
    send_email('Bienvenido a Oxford!', 'noresponder@oxfordaltagracia.com.ar', ['rodrigoa.maffei@gmail.com'], 'Hola, tu inscripcion se realizo correctamente al curso: ')

def comprobarCursoAlumno(curso_id, alumno):
    if any(c.id == curso_id for c in alumno.cursos):
        raise ObjectNotFound("Ya te encuentras inscripto a este curso")
        
def comprobarIdiomaAlumno(curso_id, alumno):
    curso = Curso.get_by_id(curso_id)
    if curso and any(i.id == curso.nivel.idioma.id for i in alumno.idiomas):
        raise ObjectNotFound('Ya te encuentras inscripto a un curso de este idioma')