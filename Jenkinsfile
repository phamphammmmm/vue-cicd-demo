pipeline {
    agent any
    stages {
        stage('Debug Docker') {
            steps {
                sh 'docker --version'
            }
        }
        stage('Pull Hello-World Image') {
            steps {
                sh 'docker pull hello-world'
            }
        }
    }
}
