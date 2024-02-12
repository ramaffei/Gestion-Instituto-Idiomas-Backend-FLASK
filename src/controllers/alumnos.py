import json
from flask_jwt_extended import current_user, jwt_required
from flask_restful import Resource
from flask import request
from src.services.alumnos import actualizarAlumno, agregarAlumno, borrarAlumno, desasociarAlumnoCurso, enviarCorreoInscripcion, mostrarAlumno, mostrarAlumnos,consultarAlumnosPorCurso, exportAlumnosPorCurso, registrarAlumno

class AlumnosTodos(Resource):
    def get(self):
        return mostrarAlumnos()

    def post(self):
        data = request.get_json()
        return agregarAlumno(data), 201

class AlumnoInd(Resource):
    def get(self, id):
        return mostrarAlumno(id), 200

    def put(self, id):
        data = request.get_json()
        return actualizarAlumno(id, data), 200

    def delete(self, id):
        return borrarAlumno(id), 200
    
class AlumnosLogin(Resource):
    @jwt_required()
    def get(self):
        print(current_user)
        return current_user, 200

    def post(self):
        data = request.get_json()
        return registrarAlumno(data['dni'], data['email'])

class AlumnoCurso(Resource):
    @jwt_required()
    def delete(self):
        data = request.get_json()
        return desasociarAlumnoCurso(data), 200
    
class AlumnoMail(Resource):
    @jwt_required()
    def post(self):
        data = request.get_json()
        return enviarCorreoInscripcion(data), 200
class AlumnosPorCurso(Resource):
    def get(self, curso_id):
        return consultarAlumnosPorCurso (curso_id), 200
    
class AlumnosPorCursoExport(Resource):
    def get(self, curso_id):
        return exportAlumnosPorCurso(curso_id), 200