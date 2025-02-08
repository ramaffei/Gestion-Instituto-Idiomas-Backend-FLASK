from flask_jwt_extended import current_user, jwt_required
from flask_restful import Resource
from flask import request
from src.services.cursos import (
    actualizarCurso,
    actualizarHorario,
    actualizarOrdenCursos,
    agregarCurso,
    agregarHorario,
    borrarCurso,
    listarCursoMod,
    listarCursosInscripcion,
    mostrarCurso,
    mostrarCursos,
    vincularHorario,
)


class CursosTodos(Resource):
    def get(self):
        return mostrarCursos()

    def post(self):
        data = request.get_json()
        return agregarCurso(data), 201


class CursoInd(Resource):
    def get(self, id):
        return mostrarCurso(id), 200

    def put(self, id):
        data = request.get_json()
        return actualizarCurso(id, data), 200

    def delete(self, id):
        return borrarCurso(id), 200


class CursoTodosMod(Resource):
    def get(self):
        return listarCursosInscripcion(), 200

    def post(self):
        data = request.get_json()
        return actualizarOrdenCursos(data), 200

class CursoIndMod(Resource):
    @jwt_required()
    def get(self, id):
        return listarCursoMod(id, current_user), 200


class HorariosTodos(Resource):
    def post(self):
        data = request.get_json()
        return agregarHorario(data), 201


class HorariosInd(Resource):
    def put(self, id):
        data = request.get_json()
        return actualizarHorario(id, data), 200


class VincularCursoHorario(Resource):
    def post(self):
        data = request.get_json()
        return vincularHorario(data), 201
