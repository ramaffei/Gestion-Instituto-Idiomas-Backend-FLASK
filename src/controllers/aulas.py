from flask import request
from flask_restful import Resource

from src.services.aulas import actualizarAula, agregarAula, borrarAula, mostrarAula, mostrarAulas

class AulasTodos(Resource):
    def get(self):
        return mostrarAulas()

    def post(self):
        data = request.get_json()
        return agregarAula(data)

class AulaInd(Resource):
    def get(self, id):
        return mostrarAula(id)

    def put(self, id):
        data = request.get_json()
        return actualizarAula(id, data)
    
    def delete(self, id):
        return borrarAula(id)