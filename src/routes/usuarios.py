from flask import Blueprint
from flask_restful import Api
from src.controllers.usuarios import UsuarioInd, UsuariosTodos

usuarios_bp = Blueprint('usuarios_bp', __name__)
api = Api(usuarios_bp)

api.add_resource(UsuariosTodos, '/', endpoint='usuarios')
api.add_resource(UsuarioInd, '/<string:id>', endpoint='usuario')