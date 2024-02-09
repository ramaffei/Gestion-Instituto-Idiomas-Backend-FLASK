from marshmallow import EXCLUDE, fields, post_load, pre_load
from src.middlewares.db import db, BaseModelMixin
from src.middlewares.schema import BaseSchema

from sqlalchemy import Integer, Column, Date, ForeignKey, String
from sqlalchemy.ext.associationproxy import association_proxy
class Alumno(db.Model, BaseModelMixin):
    __tablename__ = 'alumnos'

    id = Column(Integer, primary_key=True)
    nombre = Column(String(255), nullable=True)
    apellido = Column(String(255), nullable=True)
    nombre_completo = Column(String(255), nullable=True)
    dni = Column(Integer, nullable=False, unique=True)
    fecha_nacimiento = Column(Date, nullable=True)
    email = Column(String(255), nullable=False)
    celular = Column(String(11), nullable=True)
    celular_alt = Column(String(11), nullable=True)

    observaciones = Column(String(255),  nullable=True)
    usuario_id = Column(Integer, ForeignKey("usuarios.id"), nullable=True)

    cursos = association_proxy("alumno_curso", "curso")
    idiomas = association_proxy("alumno_curso","curso.nivel.idioma") 
    
    @classmethod
    def get_by_dni(cls, dni):
        query = cls.query
        return cls.query.filter_by(dni=dni).first()
    
class AlumnosCursos(db.Model, BaseModelMixin):
    __tablename__ = 'alumnos_cursos'

    alumno_id = Column(Integer, ForeignKey('alumnos.id'), primary_key=True)
    curso_id = Column(Integer, ForeignKey('cursos.id'), primary_key=True)

    curso = db.relationship('Curso', backref = db.backref('alumnos'))
    
    alumno = db.relationship('Alumno', backref = db.backref('alumno_curso',  cascade="all, delete-orphan"))

class AlumnoSchema(BaseSchema):
    cursos = fields.Nested("CursoSchema", many=True)
    idiomas = fields.Nested("LenguajeSchema", many=True)
    class Meta:
        additional = ('id', 'nombre', 'apellido', 'nombre_completo', 'dni', 'fecha_nacimiento', 'email','celular','celular_alt','observaciones')
        unknown = EXCLUDE
        ordered = True
        dump_only = ('id', 'nombre_completo')
        allow_none = ('celular_alt','celular','nombre_completo', 'nombre', 'apellido', 'observaciones')
        required = ('dni', 'email')
    
    @post_load
    def process_alumno(self, data, **kwargs):
        nombre = data.get("nombre")
        apellido = data.get("apellido")
        alumno_nombre_completo = ''
        if nombre and apellido:
           alumno_nombre_completo  = f'{nombre} {apellido}'
        data['nombre_completo'] = alumno_nombre_completo
        return data 
class AlumnoCursoSchema(BaseSchema):

    class Meta:
        fieldas = ('curso_id', 'alumno_id', 'alumno')
        unknown = EXCLUDE
        ordered = True