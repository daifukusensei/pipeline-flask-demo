pipeline {
  agent any

  environment {
    PASS = credentials('DockerHub')
  }

  stages {
    stage('Test') {
      steps {
        sh 'python ./pipeline/test/test.py'
      }
      post {
        always {
          junit 'test-reports/*.xml'
        }
      }
    }
    stage('Build') {
      steps {
        sh './pipeline/build/build-image.sh'
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

