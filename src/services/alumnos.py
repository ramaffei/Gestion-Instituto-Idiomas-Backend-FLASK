from src.exceptions.errors import ObjectNotFound, UnAuthorize
from src.models.alumnos import Alumno, AlumnoCursoSchema, AlumnoSchema, AlumnosCursos
import pandas as pd

def agregarAlumno(args):
    alumnoSchema = AlumnoSchema().load(args)
    alumno = Alumno(**alumnoSchema)
    alumno.save()
    print(args)
    if args.get('curso_id'):
        cursos_alumnos = AlumnosCursos(curso_id = args.get('curso_id'), alumno_id = alumno.id)
        cursos_alumnos.save()
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
    
    return AlumnoSchema().dump(alumno)

def consultarAlumnosPorCurso(curso_id):
    alumnos = Alumno.query.filter(Alumno.cursos.any(id = curso_id) ).all()
    return AlumnoSchema( exclude=['cursos',]).dump(alumnos, many=True)

def exportAlumnosPorCurso(curso_id):
    alumnos = consultarAlumnosPorCurso(curso_id)
    df_json = pd.DataFrame(alumnos)
    df_json.to_excel('curso.xlsx', index=False, header=True)
    return {'result': 'ok'}