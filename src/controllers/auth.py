from flask import jsonify, request
from flask_jwt_extended import jwt_required, unset_jwt_cookies
from flask_restful import Resource

from src.services.auth import logIn, logOut

class Login(Resource):
    def post(self):
        args = request.get_json()
        return logIn(args)
        
class Logout(Resource):
    @jwt_required()
    def post(self):
        """         response = jsonify({"msg": "logout successful"})
        unset_jwt_cookies(response) """
        print('aca estoy')
        return logOut()