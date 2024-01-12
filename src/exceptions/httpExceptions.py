from flask import jsonify

from src.exceptions.errors import AppErrorBaseClass, ObjectNotFound, UnAuthorize

def register_error_handlers(app):
   @app.errorhandler(Exception)
   def handle_500_error(e):
      return jsonify({'msg': f'Error: {e}'}), 500

   @app.errorhandler(405)
   def handle_405_error(e):
      return jsonify({'msg': 'Metodo no permitido'}), 405

   @app.errorhandler(403)
   def handle_403_error(e):
      return jsonify({'msg': 'Forbidden error'}), 403

   @app.errorhandler(404)
   def handle_404_error(e):
      return jsonify({'msg': 'URL no encontrada'}), 404

   @app.errorhandler(AppErrorBaseClass)
   def handle_app_base_error(e):
      return jsonify({'msg': str(e)}), 500
      
   @app.errorhandler(ObjectNotFound)
   def handle_object_not_found_error(e):
      return jsonify({'msg': str(e)}), 404
   
   @app.errorhandler(UnAuthorize)
   def handle_object_not_found_error(e):
      return jsonify({'msg': str(e)}), 401