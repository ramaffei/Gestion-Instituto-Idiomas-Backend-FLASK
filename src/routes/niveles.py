from flask import Blueprint
from flask_restful import Api
from src.controllers.niveles import LenguajeInd, LenguajesTodos, NivelInd, NivelesPorId, NivelesTodos

niveles_bp = Blueprint('niveles_bp', __name__)
api = Api(niveles_bp)

api.add_resource(NivelesTodos, '/', endpoint='niveles')
api.add_resource(NivelInd, '/<int:id>', endpoint='nivel')

api.add_resource(LenguajesTodos, '/idiomas', endpoint='idiomas')
api.add_resource(LenguajeInd, '/idiomas/<int:id>', endpoint='idioma')

api.add_resource(NivelesPorId, '/filtro/idioma/<int:lenguaje_id>', endpoint='filtro_idioma')