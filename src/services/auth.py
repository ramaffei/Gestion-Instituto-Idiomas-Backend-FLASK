from datetime import datetime

from flask import jsonify
from src.exceptions.errors import UnAuthorize
from flask_jwt_extended import create_access_token, set_access_cookies, unset_access_cookies
from src.models.usuarios import Usuario, UsuarioSchema

def logIn(args):
    usuario = Usuario.find_by_email(args['email'])
    
    if usuario is None:
        raise UnAuthorize('El usuario no existe')
    if not usuario.verify_password(args['password']):
        raise UnAuthorize('La contraseña es incorrecta')
    usuario_json = UsuarioSchema().dump(usuario)

    access_token = create_access_token(identity=usuario.external_id, additional_claims={'usuario': True})
    usuario.last_login = datetime.now()
    usuario.last_token = access_token
    usuario.save()
    response = jsonify({'usuario': usuario_json})

    set_access_cookies(response, access_token)
    return response

def logOut():
    response = jsonify({'msg': 'logout exitoso'})
    unset_access_cookies(response)
    return response