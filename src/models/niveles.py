from marshmallow import EXCLUDE, fields
from src.middlewares.schema import BaseSchema
from src.middlewares.db import db, BaseModelMixin
from sqlalchemy import Integer, Column, ForeignKey, String


class Nivel(db.Model, BaseModelMixin):
    __tablename__ = "niveles"

    id = Column(Integer, primary_key=True)
    nombre = Column(String(255))
    programa = Column(String(255))
    material = Column(String(255))
    representacion = Column(String(255))

    lenguaje_id = Column(Integer, ForeignKey("lenguajes.id", ondelete="CASCADE"))


class Lenguaje(db.Model, BaseModelMixin):
    __tablename__ = "lenguajes"

    id = Column(Integer, primary_key=True)
    nombre = Column(String(45))
    color = Column(String(255))

    # Se configura el cascade a nivel ORM para que, al eliminar un Lenguaje, se borren sus Niveles asociados.
    niveles = db.relationship(
        "Nivel", backref="idioma", cascade="all, delete-orphan", passive_deletes=True
    )


class LenguajeSchema(BaseSchema):
    class Meta:
        fields = ("id", "nombre", "color")
        unknown = EXCLUDE
        ordered = True
        dump_only = ("id",)
        allow_none = ("color",)
        required = ("nombre",)


class NivelSchema(BaseSchema):
    idioma = fields.Nested(LenguajeSchema)

    class Meta:
        fields = ("id", "nombre", "programa", "material", "lenguaje_id", "idioma")
        unknown = EXCLUDE
        ordered = True
        dump_only = ("id", "idioma")
        allow_none = ("programa", "material")
