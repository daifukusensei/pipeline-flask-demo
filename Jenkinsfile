pipeline {
  agent any

  environment {
    IMAGE = 'daifukusensei/flask-demo'
    USER = 'ec2-user'
    HOST = 'ec2-184-72-143-252.compute-1.amazonaws.com'
    DOCKERHUB = credentials('DockerHub')
  }

  stages {
    stage('Build') {
      steps {
        sh './pipeline/build/build-image.sh'
      }
    }
    stage('Test') {
      steps {
        sh './pipeline/test/test.sh'
      }
      post {
        always {
          junit 'pipeline/test/test-reports/*.xml'
        }
      }
    }
    stage('Push') {
      steps {
        sh './pipeline/push/push-image.sh'
      }
    }
    stage('Deploy') {
      steps {
        sh './pipeline/deploy/deploy.sh'
      }
    }
  }
}
