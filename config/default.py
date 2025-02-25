import os
from os.path import abspath, dirname

# Define the application directory
BASE_DIR = dirname(dirname(abspath(__file__)))
PROPAGATE_EXCEPTIONS = True
ERROR_404_HELP = False

# Database configuration
SQLALCHEMY_TRACK_MODIFICATIONS = False
SHOW_SQLALCHEMY_LOG_MESSAGES = False

# Configuración de la base de datos
BD_PASSWORD_ROOT = os.getenv("BD_PASSWORD_ROOT")
BD_USER = os.getenv("BD_USER")
BD_NAME = os.getenv("BD_NAME")
BD_PASSWORD = os.getenv("BD_PASSWORD")
BD_HOST = os.getenv("BD_HOST", "localhost")
SQLALCHEMY_DATABASE_URI = os.getenv(
    "SQLALCHEMY_DATABASE_URI",
    f"mysql+pymysql://{BD_USER}:{BD_PASSWORD}@{BD_HOST}/{BD_NAME}",
)

# App environments
APP_ENV = os.getenv("FLASK_ENV", "production")
FLASK_DEBUG = bool(os.getenv("DEBUG", False))

# Configuración del email
MAIL_SERVER = "mail.oxfordaltagracia.com.ar"
MAIL_PORT = 25
MAIL_USERNAME = os.getenv("MAIL_USERNAME")
MAIL_PASSWORD = os.getenv("MAIL_PASSWORD")
MAIL_USE_TLS = False
DONT_REPLY_FROM_EMAIL = "(Oxford Alta Gracia, noresponder@oxfordaltagracia.com.ar)"

# Configuracion secret key
SECRET_KEY = os.getenv("SECRET_KEY")
JWT_SECRET_KEY = SECRET_KEY

# Configuración de la URL del frontend
FRONTEND_HOST = os.getenv("FRONTEND_HOST")
HOST = os.getenv("HOST")
DOMAIN_FOLDER = os.getenv("DOMAIN_FOLDER")
