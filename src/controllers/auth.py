from flask import request
from flask_jwt_extended import get_current_user, get_jwt, jwt_required
from flask_restful import Resource
from src.exceptions.errors import UnAuthorize
from src.services.auth import logIn, logOut

class Login(Resource):
    @jwt_required()
    def get(self):
        user = get_jwt().get('usuario')
        if not user:
            raise UnAuthorize('Sesión no iniciada')
        return get_current_user()
    
    def post(self):
        args = request.get_json()
        return logIn(args)
        
class Logout(Resource):
    @jwt_required()
    def post(self):
        return logOut()