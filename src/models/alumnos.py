from marshmallow import EXCLUDE, fields
from src.middlewares.db import db, BaseModelMixin
from src.middlewares.schema import BaseSchema

from sqlalchemy import Integer, Column, Date, ForeignKey, String
from sqlalchemy.ext.associationproxy import association_proxy
class Alumno(db.Model, BaseModelMixin):
    __tablename__ = 'alumnos'

    id = Column(Integer, primary_key=True)
    nombre_completo = Column(String(45), nullable=True)
    dni = Column(Integer, nullable=False, unique=True)
    fecha_nacimiento = Column(Date, nullable=True)
    email = Column(String(255), nullable=False)
    celular = Column(String(11), nullable=True)
    celular_alt = Column(String(11), nullable=True)

    observaciones = Column(String(255),  nullable=True)
    usuario_id = Column(Integer, ForeignKey("usuarios.id"), nullable=True)

    cursos = association_proxy("alumno_curso", "curso") 
    
    @classmethod
    def get_by_dni(cls, dni):
        query = cls.query
        return cls.query.filter_by(dni=dni).first()
    
class AlumnosCursos(db.Model, BaseModelMixin):
    __tablename__ = 'alumnos_cursos'

    alumno_id = Column(Integer, ForeignKey('alumnos.id'), primary_key=True)
    curso_id = Column(Integer, ForeignKey('cursos.id'), primary_key=True)

    curso = db.relationship('Curso', backref = db.backref('alumnos',  cascade="save-update, merge"))
    
    alumno = db.relationship('Alumno', backref = db.backref('alumno_curso',  cascade="save-update, merge, "
                                                "delete, delete-orphan"))

class AlumnoSchema(BaseSchema):
    cursos = fields.Nested("CursoSchema", many=True)
    class Meta:
        additional = ('id', 'nombre_completo', 'dni', 'fecha_nacimiento', 'email','celular','celular_alt','observaciones')
        unknown = EXCLUDE
        ordered = True
        dump_only = ('id',)
        allow_none = ('celular_alt','celular','nombre_completo',  )
        required = ('dni', 'email')

class AlumnoCursoSchema(BaseSchema):

    class Meta:
        fieldas = ('curso_id', 'alumno_id', 'alumno')
        unknown = EXCLUDE
        ordered = True