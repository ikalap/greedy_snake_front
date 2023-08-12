pipeline {
    agent {
        docker {
            image 'node:18.15.0-alpine'
            args '-p 5173:5173'
        }
    }
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Deliver') {
            steps {
                sh 'npm run dev'
            }
        }
    }
}
