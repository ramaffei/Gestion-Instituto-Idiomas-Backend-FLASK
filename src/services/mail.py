from src.middlewares.mail import EmailTemplateRenderer, send_email
from src.models.alumnos import Alumno
from src.models.cursos import Curso
from src.services.constans import INICIO_CLASES


class EmailService:
    """
    Servicio encargado de preparar y enviar correos de inscripción.
    Separa la responsabilidad de obtener los datos (dominio) y de
    renderizar el contenido (template) del envío asíncrono del correo.
    """

    def __init__(self, template_renderer: EmailTemplateRenderer):
        self.template_renderer = template_renderer

    def enviar_correo_inscripcion(self, curso: Curso, alumno: Alumno):
        """
        Prepara el contexto a partir de los datos recibidos, renderiza
        los templates (HTML y texto) y envía el correo de inscripción.
        """
        # Definir el contexto para los templates
        # Se pueden agregar más datos dinámicos (por ejemplo, fecha de inicio, horarios formateados, etc.)

        dias_de_clases: list[str] = [
            horario.diaSemana.upper() for horario in curso.horario
        ]
        inicio_clases = next(
            (
                f"{item['fecha']} ({item['descripcion']})"
                for item in INICIO_CLASES
                if all(dia in dias_de_clases for dia in item["dia_clases"])
            ),
            "fecha no definida",
        )
        context = {"alumno": alumno, "curso": curso, "inicio_clases": inicio_clases}

        # Renderizar los templates para HTML y texto.
        # Se asume que existen los archivos "inscripcion.html" y "inscripcion.txt" en la carpeta de templates.
        html_body = self.template_renderer.render("email_inscripcion.html", context)
        text_body = self.template_renderer.render("email_inscripcion.txt", context)

        # Enviar el correo utilizando la función asíncrona
        send_email(
            subject="Bienvenido a Oxford!",
            sender=("Oxford Alta Gracia", "noresponder@oxfordaltagracia.com.ar"),
            recipients=[alumno.email],
            text_body=text_body,
            html_body=html_body,
        )
