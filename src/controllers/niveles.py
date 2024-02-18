from flask_restful import Resource
from flask import request
from src.services.niveles import actualizarLenguaje, actualizarNivel, agregarLenguaje, agregarNivel, borrarLenguaje, borrarNivel, listarNivelesPorIdioma, mostrarLenguaje, mostrarLenguajes, mostrarNivel, mostrarNiveles

class NivelesTodos(Resource):
    def get(self):
        return mostrarNiveles()

    def post(self):
        data = request.get_json()
        return agregarNivel(data), 201

class NivelInd(Resource):
    def get(self, id):
        return mostrarNivel(id), 200

    def put(self, id):
        data = request.get_json()
        return actualizarNivel(id, data), 200

    def delete(self, id):
        return borrarNivel(id), 200
    
class LenguajesTodos(Resource):
    def get(self):
        return mostrarLenguajes()

    def post(self):
        data = request.get_json()
        return agregarLenguaje(data), 201

class LenguajeInd(Resource):
    def get(self, id):
        return mostrarLenguaje(id), 200

    def put(self, id):
        data = request.get_json()
        return actualizarLenguaje(id, data), 200

    def delete(self, id):
        return borrarLenguaje(id), 200
    
class NivelesPorId(Resource):
    def get(self, lenguaje_id):
        return listarNivelesPorIdioma(lenguaje_id)