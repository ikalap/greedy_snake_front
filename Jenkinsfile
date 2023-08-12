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
                sh 'sh ./jenkins/scripts/deliver.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh 'sh ./jenkins/scripts/kill.sh'
            }
        }
    }
}
