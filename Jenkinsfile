pipeline {
  agent any

  environment {
    IMAGE = daifukusensei/flask-demo
    USER = ec2-user
    HOST = 192.168.100.101
    PASS = credentials('DockerHub')
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
