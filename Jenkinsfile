pipeline {
    agent any
    environment {
        DOCKER_CREDENTIALS_ID = 'docker-hub-login'
    }

    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 'main', description: 'Git branch to build from')
    }

    stages {
        stage('Check branch') {
            steps {
                script {
                    def branchName = env.BRANCH_NAME ?: 'main' // fallback to 'main' if BRANCH_NAME is null
                    if (branchName == 'main') {
                        echo 'I only execute on the main branch'
                    } else {
                        echo "I execute on branch ${branchName}"
                    }
                }
                input 'Do you approve deployment?'
                echo 'Hello Prod'
            }
        }

        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/phamphammmmm/vue-cicd-demo.git'
                echo 'Repository cloned successfully.'
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
                    sh 'docker build -t phamdat2002/test-cdcd:latest .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                withDockerRegistry(credentialsId: 'docker-hub-login', url: 'https://index.docker.io/v1/') {
                    sh 'docker push phamdat2002/test-cdcd:latest'
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
