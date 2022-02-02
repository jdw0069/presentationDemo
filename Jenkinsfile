pipeline {
    agent { 
        docker { image 'auburndemo:latest' }

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
                sh 'terraform --vesion'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Running terraform apply'
            
            }
        }
    }
}
