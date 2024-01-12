from flask import Blueprint
from flask_restful import Api
from src.controllers.cursos import CursoInd, CursoIndMod, CursoTodosMod, CursosTodos, HorariosInd, HorariosTodos, VincularCursoHorario

cursos_bp = Blueprint('cursos_bp', __name__)
api = Api(cursos_bp)

api.add_resource(CursosTodos, '/', endpoint='cursos')
api.add_resource(CursoInd, '/<int:id>', endpoint='curso')

api.add_resource(HorariosTodos, '/horarios', endpoint='horarios')
api.add_resource(HorariosInd, '/horarios/<int:id>', endpoint='horariosInd')
api.add_resource(VincularCursoHorario, '/horarios/vincular', endpoint='vincular')

api.add_resource(CursoTodosMod, '/inscripciones/disponibles', endpoint='disponibles')
api.add_resource(CursoIndMod, '/inscripciones/disponibles/<id>', endpoint='disponiblesUno')