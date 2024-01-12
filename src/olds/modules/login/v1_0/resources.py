from flask import request, Blueprint
from flask_restful import Api, Resource

from src.common.error_handling import ObjectNotFound
from .schemas import FilmSchema
