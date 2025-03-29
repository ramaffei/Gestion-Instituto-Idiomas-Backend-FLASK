from app import app
from src.models.alumnos import AlumnosCursos
from src.services.mail import EmailService
from src.middlewares.mail import EmailTemplateRenderer


def enviar_correos_a_todos():
    # Obtener todos los registros de la tabla alumnos_cursos
    with app.app_context():
        alumnos_cursos = AlumnosCursos.get_all()[0]
        if not alumnos_cursos:
            print("No hay registros en la tabla alumnos_cursos.")
            return

        # Inicializar el servicio de correo
        template_renderer = EmailTemplateRenderer(template_folder="src/templates")
        email_service = EmailService(template_renderer=template_renderer)
        i = 0
        total = len(alumnos_cursos)
        print(f"Total de registros a procesar: {total}")
        for registro in alumnos_cursos:
            try:
                curso = registro.curso
                alumno = registro.alumno
                i += 1
                email_service.enviar_correo_inscripcion(curso, alumno)
                print(f"{i}. Correo enviado a {alumno.email} para el curso {curso.id}.")
            except Exception as e:
                print(
                    f"Error al procesar el registro {i}, alumno_id={registro.alumno_id}, curso_id={registro.curso_id}: {e}"
                )


if __name__ == "__main__":
    enviar_correos_a_todos()
