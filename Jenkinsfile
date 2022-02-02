pipeline {
    
    agent {
        dockerfile {
            dir '.'
            filename 'Dockerfile'
        }
    }
        
        stages {
        stage('Build') {
            steps {
                script {
                echo 'Running terraform init'
                sh 'ls'
                sh 'terraform init'
                }
            
            }
        }
        stage('Test') {
            steps {
                script {
                echo 'Test terraform before launch'
                
                sh 'conftest test testFile.json'
                
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                echo 'Running terraform apply'
               
                sh 'ls'
                
                }
            }
        }
    }
}
