pipeline {
  agent any

  environment {
    IMAGE = 'daifukusensei/flask-demo'
    USER = 'vagrant'
    HOST = '192.168.100.101'
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
  post {
    failure {
      mail to: 'skybird6622@gmail.com',
      subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
      body: "Something is wrong with ${env.BUILD_URL}"
    }
  }
}
