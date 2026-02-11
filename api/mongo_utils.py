import certifi
from pymongo import MongoClient
from django.conf import settings
import logging

logger = logging.getLogger(__name__)
_client = None

def get_db_handle():
    global _client
    try:
        if _client is None:
            _client = MongoClient(settings.MONGO_URI, tlsCAFile=certifi.where(), serverSelectionTimeoutMS=5000)
        
        # Test connection
        _client.admin.command('ping')
        
        db = _client[settings.MONGO_DB_NAME]
        return db
    except Exception as e:
        logger.error(f"Error connecting to MongoDB: {e}")
        print(f"Error connecting to MongoDB: {e}")
        raise Exception(f"MongoDB connection failed: {str(e)}")
