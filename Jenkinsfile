pipeline {
    agent { 
        docker {image 'jdw0069/auburndemo:latest'}
    }
    stages {
        stage('Build') {
            steps {
                echo 'Running terraform init'
                sh 'terraform init'
                echo 'Running terraform plan'
            }
        }
        stage('Test') {
            steps {
                echo 'Test terraform before launch'
                sh 'conftest test testFile.json'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Running terraform apply'
                sh 'terraform apply'
            
            }
        }
    }
}
