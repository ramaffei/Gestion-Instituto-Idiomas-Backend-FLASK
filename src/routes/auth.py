from flask import Blueprint
from flask_restful import Api
from src.controllers.auth import Login, Logout

auth_bp = Blueprint('auth_bp', __name__)
api = Api(auth_bp)

api.add_resource(Login, '/login', endpoint='login')
api.add_resource(Logout, '/logout', endpoint='logout')