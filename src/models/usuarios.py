from datetime import datetime
import uuid
from marshmallow import EXCLUDE, fields
from sqlalchemy import BOOLEAN, Integer, Column, ForeignKey, String, Text
from werkzeug.security import generate_password_hash, check_password_hash
from src.middlewares.schema import BaseSchema
from src.middlewares.db import db, BaseModelMixin

class Usuario(db.Model, BaseModelMixin):
    __tablename__ = "usuarios"

    id = Column(Integer, primary_key=True)
    
    external_id = Column(
        String(255), default=lambda: str(uuid.uuid4()), nullable=False, unique=True
    )

    activo = Column(BOOLEAN, default=False, nullable=False)

    _password = Column(String(255))

    nombre = Column(String(255), nullable=False, unique=True)
    email = Column(String(255), nullable=True, unique=True)
    celular = Column(Integer, nullable=True)
    picture = Column(String(255), nullable=True)

    created_at = Column(db.DateTime, default=lambda: datetime.now(), nullable=True)
    last_login = Column(db.DateTime, nullable=True)
    last_token = Column(Text, nullable=True)

    @property
    def password(self):
        raise AttributeError("Can't read password")

    @password.setter
    def password(self, password):
        self._password = generate_password_hash(password)

    def verify_password(self, password):
        return check_password_hash(self._password, password)
    
    @classmethod
    def find_by_email(cls, email):
        return cls.query.filter_by(email=email).first()
    
    @classmethod
    def get_by_external_id(cls, id):
        return cls.query.filter_by(external_id=id).first()
    
class Rol(db.Model, BaseModelMixin):
    __tablename__ = 'roles'

    id = Column(Integer, primary_key=True)
    nombre = Column(String(45))

class RolPorUsuario(db.Model, BaseModelMixin):
    __tablename__ = 'roles_usuarios'

    usuario_id = Column(Integer, ForeignKey('usuarios.id'), primary_key=True)
    rol_id = Column(Integer, ForeignKey('roles.id'), primary_key=True)

class UsuarioSchema(BaseSchema):

    nombre = fields.Str()
    email = fields.Email(required=True)
    picture = fields.Str()
    celular = fields.Integer()

    external_id = fields.Str(data_key='id', dump_only=True)    
    created_at = fields.DateTime(dump_only=True)
    last_login = fields.DateTime(dump_only=True)

    last_token = fields.Str()

    id = fields.Str(load_only=True)
    activo = fields.Str(load_only=True)
    password = fields.Str(load_only=True, required=True)

    class Meta:
        unknown = EXCLUDE
        ordered = True