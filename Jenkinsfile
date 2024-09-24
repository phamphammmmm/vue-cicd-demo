pipeline {
    agent any
    environment {
        DOCKER_CREDENTIALS_ID = 'docker-hub-login'
    }
    stages {
        stage('Check branch') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'master') {
                        echo 'I only execute on the master branch'
                    } else {
                        echo 'I execute elsewhere'
                    }
                }
                input 'Do you approve deployment?'
                echo 'Hello Prod'
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

