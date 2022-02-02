pipeline {
    agent { 
        dockerfile true
    }
    stages {
        stage('Build') {
            steps {
                echo 'Running terraform init'
                sh 'conftest --version'
            }
        }
        stage('Test') {
            steps {
                echo 'Running terraform plan'
                sh 'terraform --version'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Running terraform apply'
                sh 'ls'
            
            }
        }
    }
}
