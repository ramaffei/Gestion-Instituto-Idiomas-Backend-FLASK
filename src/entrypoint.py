from datetime import datetime, timedelta, timezone
from flask import Flask, got_request_exception

from flask_cors import CORS
from flask_jwt_extended import JWTManager, create_access_token, get_jwt, get_jwt_identity, set_access_cookies
from src.services.alumnos import mostrarAlumno
from src.exceptions.errors import custom_api_error_handler
from src.exceptions.httpExceptions import register_error_handlers

from src.middlewares.db import db, migrate
from src.middlewares.schema import marshmallow
from src.middlewares.mail import mail

from src.routes.alumnos import alumnos_bp
from src.routes.aulas import aulas_bp
from src.routes.cursos import cursos_bp
from src.routes.niveles import niveles_bp
from src.routes.usuarios import usuarios_bp
from src.routes.auth import auth_bp
from src.routes.archivos import archivos_bp

def create_app(settings_module):

   app = Flask(__name__)
   app.config.from_object(settings_module)
   
   app.config["JWT_TOKEN_LOCATION"] = ['cookies']
   app.config["JWT_COOKIE_CSRF_PROTECT"] = True
   app.config['MAX_CONTENT_LENGTH'] = 16 * 1000 * 1000
   app.config["JWT_ACCESS_TOKEN_EXPIRES"] = timedelta(minutes=30)
   
   # Inicializa las extensiones
   db.init_app(app)
   marshmallow.init_app(app)
   migrate.init_app(app, db)
   mail.init_app(app)

   cors = CORS(app, supports_credentials=True, resources={r'/*': {'origins': app.config['FRONTEND_HOST']}})
   jwt = JWTManager(app)

   @jwt.user_identity_loader
   def user_identity_lookup(alumno):
      return alumno

   @jwt.user_lookup_loader
   def user_lookup_callback(_jwt_header, jwt_data):
      identity = jwt_data["sub"]
      return mostrarAlumno(identity)
   
   @app.after_request
   def refresh_expiring_jwts(response):
      try:
         exp_timestamp = get_jwt()["exp"]
         now = datetime.now(timezone.utc)
         target_timestamp = datetime.timestamp(now + timedelta(minutes=5))
         if target_timestamp > exp_timestamp:
               print('update token')
               access_token = create_access_token(identity=get_jwt_identity())
               set_access_cookies(response, access_token)
         return response
      except (RuntimeError, KeyError):
         # Case where there is not a valid JWT. Just return the original response
         return response
   
   # Deshabilita el modo estricto de acabado de una URL con /
   app.url_map.strict_slashes = False

   # Registra los blueprints
   app.register_blueprint(alumnos_bp, url_prefix='/alumnos')
   app.register_blueprint(aulas_bp, url_prefix='/aulas')
   app.register_blueprint(cursos_bp, url_prefix='/cursos')
   app.register_blueprint(niveles_bp, url_prefix='/niveles')
   app.register_blueprint(usuarios_bp, url_prefix='/usuarios')
   app.register_blueprint(auth_bp, url_prefix='/auth')
   app.register_blueprint(archivos_bp, url_prefix='/archivos')
   
   # Registra manejadores de errores personalizados
   if settings_module != 'config.local':
      got_request_exception.connect(custom_api_error_handler, app)
      register_error_handlers(app)
   
   return app

