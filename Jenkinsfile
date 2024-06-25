pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/phamphammmmm/vue-cicd-demo.git'
            }
        }
        // stage('Build') {
        //     steps {
        //         // Các bước để build ứng dụng của bạn
        //         echo 'Building...'
        //     }
        // }
        // stage('Test') {
        //     steps {
        //         // Các bước để chạy test
        //         echo 'Testing...'
        //     }
        // }
        // stage('Deploy') {
        //     steps {
        //         // Các bước để deploy ứng dụng của bạn
        //         echo 'Deploying...'
        //     }
        // }
    }
}
