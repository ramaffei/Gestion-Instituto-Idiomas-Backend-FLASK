from datetime import datetime

from marshmallow import EXCLUDE, fields
from src.middlewares.schema import BaseSchema
from src.middlewares.db import db, BaseModelMixin
from sqlalchemy import Integer, Column, Date, ForeignKey, String
from sqlalchemy.ext.associationproxy import association_proxy


class Curso(db.Model, BaseModelMixin):
    __tablename__ = "cursos"
    id = Column(Integer, primary_key=True)

    nivel_id = Column(
        Integer, ForeignKey("niveles.id", ondelete="SET NULL"), nullable=True
    )
    aula_id = Column(
        Integer, ForeignKey("aulas.id", ondelete="SET NULL"), nullable=True
    )
    inscripcion_id = Column(Integer, ForeignKey("inscripciones.id"))
    creador_id = Column(Integer, ForeignKey("usuarios.id"))

    orden_id = Column(Integer)
    max_alumnos = Column(Integer)
    representacion = Column(String(255))
    nombre = Column(String(45))
    estado_inscripcion_id = Column(Integer, ForeignKey("estados_inscripcion.id"))
    descripcion = Column(String(255))

    created_at = Column(db.DateTime, default=lambda: datetime.now(), nullable=True)

    nivel = db.relationship("Nivel", lazy="joined", passive_deletes=True)
    aula = db.relationship("Aula", lazy="joined", passive_deletes=True)
    inscripcion = db.relationship("Inscripcion", lazy="joined")
    estado_inscripcion = db.relationship("EstadoInscripcion", lazy="joined")

    horario = association_proxy("horario_curso", "horario")


class CursoHorario(db.Model, BaseModelMixin):
    __tablename__ = "curso_horario"

    curso_id = Column(Integer, ForeignKey("cursos.id"), primary_key=True)
    horario_id = Column(Integer, ForeignKey("horarios.id"), primary_key=True)

    curso = db.relationship(
        "Curso",
        lazy="joined",
        backref=db.backref(
            "horario_curso",
            cascade="save-update, merge, delete, delete-orphan",
            lazy="joined",
        ),
    )
    horario = db.relationship("Horario", lazy="joined")


class Horario(db.Model, BaseModelMixin):
    __tablename__ = "horarios"

    id = Column(Integer, primary_key=True)

    diaSemana = Column(String(45))
    horaInicio = Column(String(50))
    horaFin = Column(String(50))


class Inscripcion(db.Model, BaseModelMixin):
    __tablename__ = "inscripciones"

    id = Column(Integer, primary_key=True)
    titulo = Column(String(45))
    fechaInicio = Column(Date)
    fechaFin = Column(Date)
    estado_id = Column(Integer, ForeignKey("estados_inscripcion.id"))

    estado = db.relationship("EstadoInscripcion")


class EstadoInscripcion(db.Model, BaseModelMixin):
    __tablename__ = "estados_inscripcion"

    id = Column(Integer, primary_key=True)
    titulo = Column(String(20))


class CursoProfesor(db.Model, BaseModelMixin):
    __tablename__ = "curso_profesor"

    curso_id = Column(Integer, ForeignKey("cursos.id"), primary_key=True)
    usuario_profesor_id = Column(Integer, ForeignKey("usuarios.id"), primary_key=True)


class InscripcionSchema(BaseSchema):
    estado = fields.Nested("EstadoInscripcionSchema")

    class Meta:
        additional = ("id", "titulo", "fechaInicio", "fechaFin")
        unknown = EXCLUDE
        ordered = True
        dump_only = ("id", "estado")
        required = ("titulo", "fechaInicio")


class EstadoInscripcionSchema(BaseSchema):
    class Meta:
        fields = ("id", "titulo")
        unknown = EXCLUDE
        ordered = True
        dump_only = ("id",)
        required = ("titulo",)


class HorarioSchema(BaseSchema):
    class Meta:
        fields = ("id", "diaSemana", "horaInicio", "horaFin")
        unknown = EXCLUDE
        ordered = True
        dump_only = ("id",)
        required = ("diaSemana", "horaInicio", "horaFin")


class CursoSchema(BaseSchema):
    nivel = fields.Nested("NivelSchema")
    aula = fields.Nested("AulaSchema")
    inscripcion = fields.Nested("InscripcionSchema")
    estado_inscripcion = fields.Nested("EstadoInscripcionSchema")
    horario = fields.Nested("HorarioSchema", many=True)

    class Meta:
        additional = (
            "id",
            "nivel_id",
            "aula_id",
            "inscripcion_id",
            "creador_id",
            "orden_id",
            "max_alumnos",
            "representacion",
            "nombre",
            "estado_inscripcion",
            "descripcion",
            "created_at",
        )
        unknown = EXCLUDE
        ordered = True
        dump_only = ("id",)
        allow_none = (
            "nivel_id",
            "aula_id",
            "inscripcion_id",
            "creador_id",
            "max_alumnos",
            "representacion",
            "nombre",
            "estado_inscripcion",
        )
        required = ("nombre", "descripcion")


class CursoModSchema(BaseSchema):
    horario = fields.Nested("HorarioSchema", many=True)
    idioma = fields.Nested("LenguajeSchema")

    class Meta:
        fields = (
            "id",
            "nombre",
            "horario",
            "cupo",
            "descripcion",
            "representacion",
            "estado_inscripcion",
            "nivel",
            "idioma",
            "programa",
            "material",
        )
        unknown = EXCLUDE
        ordered = True
