from marshmallow import EXCLUDE, fields, post_load
from src.middlewares.db import db, BaseModelMixin
from src.middlewares.schema import BaseSchema

from sqlalchemy import Integer, Column, Date, ForeignKey, String
from sqlalchemy.ext.associationproxy import association_proxy,AmbiguousAssociationProxyInstance


def safe_get(obj, value: AmbiguousAssociationProxyInstance):
    def getter(obj):    
        try:
            for attr in value.value_attr.split("."):
                obj = getattr(obj, attr, None)
                if obj is None:  # Si en cualquier paso obtenemos el default, terminamos
                    return None
            return obj
        except AttributeError:
            return None
    def setter(obj, value):
        pass
    return getter, setter


class Alumno(db.Model, BaseModelMixin):
    __tablename__ = "alumnos"

    id = Column(Integer, primary_key=True)
    nombre = Column(String(255), nullable=True)
    apellido = Column(String(255), nullable=True)
    nombre_completo = Column(String(255), nullable=True)
    dni = Column(Integer, nullable=False, unique=True)
    fecha_nacimiento = Column(Date, nullable=True)
    email = Column(String(255), nullable=False)
    celular = Column(String(11), nullable=True)
    celular_alt = Column(String(11), nullable=True)

    observaciones = Column(String(255), nullable=True)
    usuario_id = Column(Integer, ForeignKey("usuarios.id"), nullable=True)

    cursos = association_proxy("alumno_curso", "curso")
    idiomas = association_proxy(
        "alumno_curso", "curso.nivel.idioma", getset_factory=safe_get
    )

    @classmethod
    def get_by_dni(cls, dni):
        return cls.query.filter_by(dni=dni).first()


class AlumnosCursos(db.Model, BaseModelMixin):
    __tablename__ = "alumnos_cursos"

    alumno_id = Column(
        Integer, ForeignKey("alumnos.id", ondelete="CASCADE"), primary_key=True
    )
    curso_id = Column(
        Integer, ForeignKey("cursos.id", ondelete="CASCADE"), primary_key=True
    )

    curso = db.relationship(
        "Curso",
        backref=db.backref(
            "alumnos", cascade="all, delete-orphan", passive_deletes=True
        ),
    )

    alumno = db.relationship(
        "Alumno", backref=db.backref("alumno_curso", cascade="all, delete-orphan")
    )


class AlumnoSchema(BaseSchema):
    cursos = fields.Nested("CursoSchema", many=True)
    idiomas = fields.Nested("LenguajeSchema", many=True)

    class Meta:
        additional = (
            "id",
            "nombre",
            "apellido",
            "nombre_completo",
            "dni",
            "fecha_nacimiento",
            "email",
            "celular",
            "celular_alt",
            "observaciones",
        )
        unknown = EXCLUDE
        ordered = True
        dump_only = ("id", "nombre_completo")
        allow_none = (
            "idiomas",
            "cursos",
            "celular_alt",
            "celular",
            "nombre_completo",
            "nombre",
            "apellido",
            "observaciones",
        )
        required = ("dni", "email")

    @post_load
    def process_alumno(self, data, **kwargs):
        nombre = data.get("nombre")
        apellido = data.get("apellido")
        alumno_nombre_completo = ""
        if nombre and apellido:
            alumno_nombre_completo = f"{nombre} {apellido}"
        data["nombre_completo"] = alumno_nombre_completo
        return data


class AlumnoCursoSchema(BaseSchema):
    class Meta:
        fieldas = ("curso_id", "alumno_id", "alumno")
        unknown = EXCLUDE
        ordered = True
