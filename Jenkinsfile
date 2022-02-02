pipeline {
    agent none
    
    stages {
        stage('Build') {
            agent { docker { image 'jdw0069/auburndemo:latest' } }
            steps {
                echo 'Running terraform init'
                sh 'terraform init'
                echo 'Running terraform plan'
            }
        }
        stage('Test') {
            agent { docker { image 'jdw0069/auburndemo:latest' } }
            steps {
                echo 'Test terraform before launch'
                sh 'conftest test testFile.json'
            }
        }
        stage('Deploy') {
            agent { docker { image 'jdw0069/auburndemo:latest' } }
            steps {
                echo 'Running terraform apply'
                sh 'terraform apply'
            
            }
        }
    }
}
