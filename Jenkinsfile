pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/phamphammmmm/vue-cicd-demo.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                withDockerRegistry(credentialsId: 'docker-hub', url: 'https://index.docker.io/v1/') {
                    sh label: '', script: 'docker build -t phamdat2002/jenkins-cicd:latest .'
                    sh label: '', script: 'docker push phamdat2002/jenkins-cicd:latest'
                }
            }
        }
    }
}
