
from src.exceptions.errors import ObjectNotFound
import os
from flask import send_from_directory
from werkzeug.utils import secure_filename

DOMAIN_FOLDER =  os.getenv('DOMAIN_FOLDER')
DIR_BASE = 'archivos'
HOST = os.getenv('HOST')
ALLOWED_EXTENSIONS = {'doc', 'docx', 'pdf'}

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


def upload_file(file, name_folder = ''):
    if file.filename == '':
        raise ObjectNotFound('No se envio ningun archivo') 
    if file and allowed_file(file.filename):
        filename = secure_filename(file.filename)

        dir = os.path.join(DOMAIN_FOLDER, DIR_BASE, name_folder)

        os.makedirs(dir, exist_ok=True)
        
        file.save(os.path.join(dir, filename))
        
        return f'{HOST}/{DIR_BASE}/{name_folder}/{filename}'#url_for('archivos_bp.downloadFile',folder=UPLOAD_FOLDERS[folder], filename=filename)
    else:
        raise ObjectNotFound('Tipo de archivo no permitido')


def download_file(name, folder):
    return send_from_directory(os.path.join(DOMAIN_FOLDER, folder), name, as_attachment=True)