import unittest
from app import app
from redis import Redis

class TestHello(unittest.TestCase):
    def setUp(self):
        app.testing = True
        self.app = app.test_client()

    def test_status(self):
        rv = self.app.get('/')
        self.assertEqual(rv.status, '200 OK')

    def test_output(self):
        rv = self.app.get('/')
        redis = Redis(host='redis', port=6379)
        count = redis.get('hits').decode('utf-8')
        self.assertEqual(rv.data.decode('utf-8'), 'Hello wWorld! I have been seen {} times.\n'.format(count))

if __name__ == '__main__':
    unittest.main()
