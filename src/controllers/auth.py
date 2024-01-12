from flask import jsonify, request
from flask_jwt_extended import unset_jwt_cookies
from flask_restful import Resource

from src.services.auth import logIn

class Login(Resource):
    def post(self):
        args = request.get_json()
        return logIn(args)
        
class Logout(Resource):
    def post(self):
        response = jsonify({"message": "logout successful"})
        unset_jwt_cookies(response)
        return response, 200