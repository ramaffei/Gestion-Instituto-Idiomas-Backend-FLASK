import os
from os.path import abspath, dirname

# Define the application directory
BASE_DIR = dirname(dirname(abspath(__file__)))

SECRET_KEY = "default_key"
PROPAGATE_EXCEPTIONS = True
ERROR_404_HELP = False

# Database configuration
SQLALCHEMY_TRACK_MODIFICATIONS = False
SHOW_SQLALCHEMY_LOG_MESSAGES = False

# App environments
APP_ENV_LOCAL = 'local'
APP_ENV_DEVELOPMENT = 'development'
APP_ENV_PRODUCTION = 'production'
APP_ENV = ''

# Configuración del email

MAIL_SERVER = 'mail.oxfordaltagracia.com.ar'
MAIL_PORT = 587
MAIL_USERNAME = os.getenv('MAIL_USERNAME')
MAIL_PASSWORD = os.getenv('MAIL_PASSWORD')
MAIL_USE_TLS = True
DONT_REPLY_FROM_EMAIL = f"(Oxford Alta Gracia, noresponder@oxfordaltagracia.com.ar)"
""" ADMINS = ('juanjo@j2logo.com', ) """