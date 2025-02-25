from flask_mail import Mail
from smtplib import SMTPException
from threading import Thread
from flask import current_app
from flask_mail import Message
import jinja2

mail = Mail()

def _send_async_email(app, msg):
    """
    Envía el correo de forma asíncrona usando un thread,
    evitando bloquear la ejecución de la API.
    """
    with app.app_context():
        try:
            mail.send(msg)
        except SMTPException as e:
            current_app.logger.error(f"Ocurrió un error al enviar el email: {e}")

def send_email(
    subject, sender, recipients, text_body, cc=None, bcc=None, html_body=None
):
    """
    Función genérica para enviar correos, que utiliza Flask-Mail y
    envía el mensaje de forma asíncrona.
    """
    msg = Message(subject, sender=sender, recipients=recipients, cc=cc, bcc=bcc)
    msg.body = text_body
    if html_body:
        msg.html = html_body
    Thread(
        target=_send_async_email, args=(current_app._get_current_object(), msg)
    ).start()

class EmailTemplateRenderer:
    """
    Encapsula la lógica para renderizar templates utilizando Jinja2.
    Se inyecta la carpeta de templates para facilitar su personalización.
    """

    def __init__(self, template_folder: str):
        self.env = jinja2.Environment(
            loader=jinja2.FileSystemLoader(template_folder),
            autoescape=jinja2.select_autoescape(["html", "xml"]),
        )

    def render(self, template_name: str, context: dict) -> str:
        """
        Renderiza el template indicado con el contexto dado.
        """
        template = self.env.get_template(template_name)
        return template.render(context)