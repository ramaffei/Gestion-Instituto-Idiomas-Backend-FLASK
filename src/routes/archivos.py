from flask import Blueprint
from flask_restful import Api
from src.controllers.archivos import Upload, Download

archivos_bp = Blueprint('archivos_bp', __name__)
api = Api(archivos_bp)

api.add_resource(Upload, '/upload', endpoint='uploadFile')
api.add_resource(Download, '/download/<folder>/<filename>', endpoint='downloadFile')