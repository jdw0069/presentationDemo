pipeline {
    agent none
    
    stages {
        stage('Build') {
            agent { docker {image 'jdw0069/auburndemo:latest'} }
            steps {
                echo 'Running terraform init'
                sh 'terraform init'
                echo 'Running terraform plan'
            }
        }
        stage('Test') {
            steps {
                agent { docker {image 'jdw0069/auburndemo:latest'} }
                echo 'Test terraform before launch'
                sh 'conftest test testFile.json'
            }
        }
        stage('Deploy') {
            steps {
                agent { docker {image 'jdw0069/auburndemo:latest'} }
                echo 'Running terraform apply'
                sh 'terraform apply'
            
            }
        }
    }
}
