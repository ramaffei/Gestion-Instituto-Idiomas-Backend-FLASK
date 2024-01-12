from flask import Blueprint, request
from flask_restful import Api, Resource

from src.services.usuarios import actualizarUsuario, crearUsuario, eliminarUsuario

usuarios_bp = Blueprint('usuarios_bp', __name__)
api = Api(usuarios_bp)

class UsuariosTodos(Resource):
    def get(self):
        pass

    def post(self):
        return crearUsuario()

class UsuarioInd(Resource):
    def get(self, id):
        pass

    def put(self, id):
        data = request.get_json()
        return actualizarUsuario(id, data)

    def delete(self, id):
        return eliminarUsuario(id)