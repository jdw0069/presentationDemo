pipeline {
    agent none
        
        stages {
        stage('Build') {
            agent {
        dockerfile {
            dir '.'
            filename 'Dockerfile'
        }
    }
            steps {
                script {
                echo 'Running terraform init'
                sh 'ls'
                sh 'terraform init'
                }
            
            }
        }
        stage('Test') {
            agent {
        dockerfile {
            dir '.'
            filename 'Dockerfile'
        }
    }
            steps {
                script {
                echo 'Test terraform before launch'
                
                sh 'conftest test testFile.json'
                
                }
            }
        }
        stage('Deploy') {
            agent {
        dockerfile {
            dir '.'
            filename 'Dockerfile'
        }
    }
            steps {
                script {
                echo 'Running terraform apply'
               
                sh 'ls'
                
                }
            }
        }
    }
}
