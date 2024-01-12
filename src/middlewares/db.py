from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()
migrate = Migrate()
class BaseModelMixin:
    def save(self):
        db.session.add(self)
        db.session.commit()
    
    def update(self, data: dict):
        for k, v in data.items():
            setattr(self, k, v)
        db.session.commit()

    def delete(self):
        db.session.delete(self)
        db.session.commit()

    def transformData(self, data):
        data_transform = {}
        for k, v in data.items():
            if type(v) is dict and v.get('id') is not None:
                    data_transform[f'{k}_id'] = v['id']
            else:
                    data_transform[k] = v
        return data_transform                    

    @classmethod
    def get_all(cls, limit = None, page = None):
        query = cls.query
        headers = {
            'x-count': query.count(),
        }
        if limit is not None:
            query = query.limit(limit)
            headers['x-limit'] = limit
        if page is not None:
            query = query.offset(int(page)*int(limit))
            headers['x-page'] = page
            headers['x-total-pages'] = (int(headers['x-count']) // int(limit))+1

        return query.all(), 200, headers

    @classmethod
    def get_by_id(cls, id):
        return cls.query.get(id)
        
    @classmethod
    def simple_filter_all(cls, **kwargs):
        return cls.query.filter_by(**kwargs).all()

    @classmethod
    def simple_filter(cls, **kwargs):
        return cls.query.filter_by(**kwargs).first()
