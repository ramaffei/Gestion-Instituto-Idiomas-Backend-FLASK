from flask_restful import Resource
from flask import request
from src.services.archivos import upload_file, download_file

class Upload(Resource):
    def post(self):
        if 'file' not in request.files:
            return {'error': 'No se encuentra el archivo'}
        file = request.files['file']
        folder = request.form['folder']

        url_file = upload_file(file, folder)
        return {'url': url_file}

class Download(Resource):
    def get(self, filename):
        return download_file(filename)