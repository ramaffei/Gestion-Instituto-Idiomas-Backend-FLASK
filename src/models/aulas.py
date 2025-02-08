from marshmallow import EXCLUDE
from src.middlewares.schema import BaseSchema
from src.middlewares.db import db, BaseModelMixin
from sqlalchemy import Integer, Column, String


class Aula(db.Model, BaseModelMixin):
    __tablename__ = "aulas"

    id = Column(Integer, primary_key=True)
    cant_ideal = Column(Integer)
    cant_max = Column(Integer)
    nombre = Column(String(45))
    representacion = Column(String(255))


class AulaSchema(BaseSchema):
    class Meta:
        fields = ("id", "cant_ideal", "cant_max", "nombre", "representacion")
        unknown = EXCLUDE
        ordered = (True,)
        dump_only = ("id",)
        allow_none = ("cant_ideal", "cant_max", "representacion")
