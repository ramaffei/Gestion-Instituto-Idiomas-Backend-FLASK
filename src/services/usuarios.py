
from flask import request
from src.exceptions.errors import ObjectNotFound
from src.models.usuarios import UsuarioSchema, Usuario

def crearUsuario():
    data = request.get_json()
    data = UsuarioSchema().load(data)
    user = Usuario(**data)
    user.save()

    return UsuarioSchema().dump(user)

def actualizarUsuario(id, args):
    usuario = Usuario.get_by_external_id(id)
    if usuario is None:
        raise ObjectNotFound('El usuario no existe')
    usuarioSchema = UsuarioSchema(exclude=('password',)).load(args)
    usuario.update(usuarioSchema)
    return UsuarioSchema().dump(usuario)

def eliminarUsuario(id):
    usuario = Usuario.get_by_external_id(id)
    if usuario is None:
        raise ObjectNotFound('El usuario no existe')
    usuario.delete()
    return UsuarioSchema().dump(usuario)

def mostrarUsuario(id):
    usuario = Usuario.get_by_external_id(id)
    if usuario is None:
        raise ObjectNotFound('El usuario no existe')
    return UsuarioSchema().dump(usuario)