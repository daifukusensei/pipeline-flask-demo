import unittest
import xmlrunner
from app import app
from redis import Redis

class TestFlaskDemo(unittest.TestCase):
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
        self.assertEqual(rv.data.decode('utf-8'), 'Hello again, World! I have been seen {} times.\n'.format(count))

if __name__ == '__main__':
    runner = xmlrunner.XMLTestRunner(output='test-reports')
    unittest.main(testRunner=runner)
