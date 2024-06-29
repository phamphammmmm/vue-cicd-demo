pipeline {
    agent any
    environment {
        DOCKER_HOST = 'tcp://docker:2376'
        DOCKER_CERT_PATH = '/certs/client'
        DOCKER_TLS_VERIFY = '1'
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
                withDockerRegistry(credentialsId: 'docker-login', url: 'https://index.docker.io/v1/') {
                    sh 'docker build -t phamdat2002/test-cicd:latest .'                
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                withDockerRegistry(credentialsId: 'docker-login', url: 'https://index.docker.io/v1/') {
                    sh 'docker push phamdat2002/test-cicd:latest'
                }
            }
        }
    }
}
