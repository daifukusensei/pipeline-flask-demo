import unittest
from app import app
from redis import Redis

class TestHello(unittest.TestCase):
    def setUp(self):
        app.testing = True
        self.app = app.test_client()
        redis = Redis(host='redis', port=6379, socket_connect_timeout=1)
    def test_hello(self):
        rv = self.app.get('/')
        self.assertEqual(rv.status, '200 OK')
        self.assertIn(b'Hello World! I have been seen', rv.data)

if __name__ == '__main__':
    unittest.main()
