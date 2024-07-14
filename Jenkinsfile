pipeline {
    agent any
    environment {
        DOCKER_CREDENTIALS_ID = 'docker-hub-login'
    }
    stages {
        stage('Debug Docker') {
            steps {
                sh 'docker --version'
            }
        }
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/phamphammmmm/vue-cicd-demo.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                withDockerRegistry(credentialsId: 'docker-hub-login', url: 'https://index.docker.io/v1/') {
                    sh 'docker build -t phamdat2002/test-cicd:latest .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                withDockerRegistry(credentialsId: 'docker-hub-login', url: 'https://index.docker.io/v1/') {
                    sh 'docker push phamdat2002/test-cicd:latest'
                }
            }
        }
        stage('Deploy Docker Image') {
            steps {
                sh 'docker pull phamdat2002/test-cicd:latest'
                sh 'docker run -d -p 8000:80 phamdat2002/test-cicd:latest'
            }
        }
    }
}
