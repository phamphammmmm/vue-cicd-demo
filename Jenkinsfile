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
        stage('Set Permissions') {
            steps {
                sh 'chmod +x deploy.sh'
                sh 'sudo usermod -aG docker jenkins'
            }
        }
        stage('Build Docker Image') {
            steps {
                withDockerRegistry(credentialsId: 'docker-hub-login', url: 'https://index.docker.io/v1/') {
                    sh 'docker build -t phamdat2002/test-cicd-v1:latest .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                withDockerRegistry(credentialsId: 'docker-hub-login', url: 'https://index.docker.io/v1/') {
                    sh 'docker push phamdat2002/test-cicd-v1:latest'
                }
            }
        }
        stage('Deploy Docker Image') {
            steps {
                script {
                    sh './deploy.sh'
                }
            }
        }
    }
}
