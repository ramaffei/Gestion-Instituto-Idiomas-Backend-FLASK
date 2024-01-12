from flask import Blueprint, request
from flask_restful import Api, Resource

from src.services.auth import logIn

auth_bp = Blueprint('auth_bp', __name__)
api = Api(auth_bp)

class LogIn(Resource):
    def post(self):
        pass
