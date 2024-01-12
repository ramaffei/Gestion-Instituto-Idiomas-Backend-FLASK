from src.exceptions.errors import ObjectNotFound
from src.models.aulas import Aula, AulaSchema

def agregarAula(args):
    aula = Aula(**args)
    aula.save()
    return AulaSchema().dump(aula)

def mostrarAula(id):
    aula = Aula.get_by_id(id)
    if aula is None:
        raise ObjectNotFound('El aula no existe')
    return AulaSchema().dump(aula)

def mostrarAulas():
    aulas = Aula.get_all()
    return AulaSchema().dump(aulas[0], many=True), aulas[1], aulas[2]

def actualizarAula(id, args):
    aula = Aula.get_by_id(id)
    if aula is None:
        raise ObjectNotFound('El aula no existe')
    aulaSchema = AulaSchema().load(args)
    aula.update(aulaSchema)
    return AulaSchema().dump(aula)

def borrarAula(id):
    aula = Aula.get_by_id(id)
    if aula is None:
        raise ObjectNotFound('El aula no existe')
    aula.delete()
    return AulaSchema().dump(aula)