from flask import Blueprint
from flask_restful import Api
from src.controllers.alumnos import AlumnoCurso, AlumnoInd, AlumnosPorCursoExport, AlumnosTodos, AlumnosPorCurso, AlumnosLogin

alumnos_bp = Blueprint('alumnos_bp', __name__)
api = Api(alumnos_bp)

api.add_resource(AlumnosTodos, '/', endpoint='alumnos')
api.add_resource(AlumnoInd, '/<int:id>', endpoint='alumno')
api.add_resource(AlumnosPorCurso, '/curso/<int:curso_id>', endpoint='alumnosPorCurso')
api.add_resource(AlumnoCurso, '/inscripcion', endpoint='inscripcionAlumnoCurso')
api.add_resource(AlumnosPorCursoExport, '/curso/<int:curso_id>/export', endpoint='alumnosPorCursoExport')
api.add_resource(AlumnosLogin, '/login', endpoint='AlumnosLogin')