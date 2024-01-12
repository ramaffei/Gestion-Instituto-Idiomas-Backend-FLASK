from src.exceptions.errors import ObjectNotFound
from src.models.niveles import Lenguaje, LenguajeSchema, Nivel, NivelSchema

def agregarNivel(args):
    nivel = Nivel(**args)
    nivel.save()
    return NivelSchema().dump(nivel)

def mostrarNivel(id):
    nivel = Nivel.get_by_id(id)
    if nivel is None:
        raise ObjectNotFound('El nivel no existe')
    return NivelSchema().dump(nivel)

def listarNivelesPorIdioma(idioma_id):
    niveles = Nivel.simple_filter_all(lenguaje_id= idioma_id)
    return NivelSchema().dump(niveles, many=True)

def mostrarNiveles():
    niveles = Nivel.get_all()
    return NivelSchema().dump(niveles[0], many=True), niveles[1], niveles[2]

def actualizarNivel(id, args):
    nivel = Nivel.get_by_id(id)
    if nivel is None:
        raise ObjectNotFound('El nivel no existe')
    nivelSchema = NivelSchema().load(args)
    nivel.update(nivelSchema)
    return NivelSchema().dump(nivel)

def borrarNivel(id):
    nivel = Nivel.get_by_id(id)
    if nivel is None:
        raise ObjectNotFound('El nivel no existe')
    nivel.delete()
    return NivelSchema().dump(nivel)

def agregarLenguaje(args):
    lenguaje = Lenguaje(**args)
    lenguaje.save()
    return LenguajeSchema().dump(lenguaje)

def mostrarLenguaje(id):
    lenguaje = Lenguaje.get_by_id(id)
    if lenguaje is None:
        raise ObjectNotFound('El lenguaje no existe')
    return LenguajeSchema().dump(lenguaje)

def mostrarLenguajes():
    lenguajes = Lenguaje.get_all()
    return LenguajeSchema().dump(lenguajes[0], many=True), lenguajes[1], lenguajes[2]

def actualizarLenguaje(id, args):
    lenguaje = Lenguaje.get_by_id(id)
    if lenguaje is None:
        raise ObjectNotFound('El lenguaje no existe')
    lenguajeSchema = LenguajeSchema().load(args)
    lenguaje.update(lenguajeSchema)
    return LenguajeSchema().dump(lenguaje)

def borrarLenguaje(id):
    lenguaje = Lenguaje.get_by_id(id)
    if lenguaje is None:
        raise ObjectNotFound('El lenguaje no existe')
    lenguaje.delete()
    return LenguajeSchema().dump(lenguaje)