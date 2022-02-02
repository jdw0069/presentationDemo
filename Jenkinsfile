pipeline {
    agent any
    
     stages {
         stage('Clone repository') { 
            steps { 
                script{
                checkout scm
                def myContainer = docker.build("myContaier")
                }
            }
        }
         
    
         
  
        stage('Build') {
            steps {
                echo 'Running terraform init'
                myContainer.inside {
                sh 'terraform init'
                }
            
            }
        }
        stage('Test') {
            steps {
                echo 'Test terraform before launch'
                myContainer.inside {
                sh 'conftest test testFile.json'
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Running terraform apply'
                myContainer.inside {
                sh 'ls'
                }
            }
        }
    }
}
