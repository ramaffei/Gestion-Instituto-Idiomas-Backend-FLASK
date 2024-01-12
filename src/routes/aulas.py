from flask import Blueprint
from flask_restful import Api
from src.controllers.aulas import AulaInd, AulasTodos

aulas_bp = Blueprint('aulas_bp', __name__)
api = Api(aulas_bp)

api.add_resource(AulasTodos, '/', endpoint='aulas')
api.add_resource(AulaInd, '/<int:id>', endpoint='aula')