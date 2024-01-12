import os
from src.entrypoint import create_app

settings_module = os.getenv('APP_SETTINGS_MODULE')
app = create_app(settings_module)

if __name__ == '__main__':
   app.run()