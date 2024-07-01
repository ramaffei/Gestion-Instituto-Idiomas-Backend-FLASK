from src.models.alumnos import Alumno, AlumnoSchema
from src.services.alumnos import comprobarCursoAlumno, comprobarIdiomaAlumno, consultarAlumnosPorCurso
from src.exceptions.errors import ObjectNotFound
from src.models.cursos import Curso, CursoHorario, CursoModSchema, CursoSchema, Horario, HorarioSchema

def agregarCurso(args):
    curso = CursoSchema().load(args)
    curso.save()
    return CursoSchema().dump(curso)

def mostrarCurso(id):
    curso = Curso.get_by_id(id)
    if curso is None:
        raise ObjectNotFound('El curso no existe')
    return CursoSchema().dump(curso)

def mostrarCursos():
    cursos = Curso.get_all()
    return CursoSchema().dump(cursos[0], many=True), cursos[1], cursos[2]

def actualizarCurso(id, args):
    curso = Curso.get_by_id(id)
    if curso is None:
        raise ObjectNotFound('El curso no existe')
    cursoSchema = CursoSchema().load(args)
    curso.update(cursoSchema)
    return CursoSchema().dump(curso)

def borrarCurso(id):
    curso = Curso.get_by_id(id)
    if curso is None:
        raise ObjectNotFound('El curso no existe')
    curso.delete()
    return CursoSchema().dump(curso)

def agregarHorario(args):
    horario = Horario(**args)
    horario.save()
    return HorarioSchema().dump(horario)

def actualizarHorario(id, args):
    horario = Horario.get_by_id(id)
    if horario is None:
        raise ObjectNotFound('El horario no existe')
    horarioSchema = HorarioSchema().load(args)
    horario.update(horarioSchema)
    return HorarioSchema().dump(horario)

def vincularHorario(args):
    cursoHorario = CursoHorario(**args)
    cursoHorario.save()
    return {"estado": True}

def listarCursosInscripcion():
    cursos = Curso.get_all()
    cursosMod = []
    for curso in cursos[0]:
        alumnos = consultarAlumnosPorCurso(curso.id)
        cursosMod.append( {
            'id': curso.id,
            'nombre': curso.nombre,
            'horario': curso.horario,
            'descripcion': curso.descripcion,
            'cupo': calcularCupo(curso, alumnos),
            'estado_inscripcion': verificarInscripcion(curso, alumnos),
            'aula': curso.aula.nombre,

        })
        try:
            if curso.nivel:
                cursosMod[-1]['nivel'] = curso.nivel.nombre
                cursosMod[-1]['idioma'] = curso.nivel.idioma
                cursosMod[-1]['programa'] = curso.nivel.programa
                cursosMod[-1]['material'] = curso.nivel.material
        except IndexError:
            pass
        
    
    return CursoModSchema().dump(cursosMod, many=True)

def listarCursoMod(id, user=None):
    curso = Curso.get_by_id(id)

    if curso is None:
        raise ObjectNotFound('El curso no existe')
    
    if user is not None:
        alumno = Alumno.get_by_id(user['id'])
        comprobarCursoAlumno(id, alumno)
        comprobarIdiomaAlumno(id, alumno)

    alumnos = consultarAlumnosPorCurso(id)
    cursoMod = {
            'id': curso.id,
            'nombre': curso.nombre,
            'horario': curso.horario,
            'descripcion': curso.descripcion,
            'cupo': calcularCupo(curso, alumnos),
            'estado_inscripcion': verificarInscripcion(curso, alumnos),
            'representacion': curso.aula.representacion,
        }
    
    if curso.nivel:
        cursoMod['nivel'] = curso.nivel.nombre
        cursoMod['idioma'] = curso.nivel.idioma
        cursoMod['programa'] = curso.nivel.programa
        cursoMod['material'] = curso.nivel.material

    return CursoModSchema().dump(cursoMod)

def calcularCupo(curso, alumnos):
    cant_alumnos = len(alumnos)
    cant_maxima = curso.max_alumnos if curso.max_alumnos else curso.aula.cant_ideal
    return f'{cant_alumnos}/{cant_maxima}'
    
def verificarInscripcion(curso, alumnos):
    cant_alumnos = len(alumnos)
    cant_maxima = curso.max_alumnos if curso.max_alumnos else curso.aula.cant_ideal
    if cant_alumnos < cant_maxima:
        return True
    return False
