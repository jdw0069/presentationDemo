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
                script {
                echo 'Running terraform init'
                myContainer.inside {
                sh 'terraform init'
                }
                }
            
            }
        }
        stage('Test') {
            steps {
                script {
                echo 'Test terraform before launch'
                myContainer.inside {
                sh 'conftest test testFile.json'
                }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                echo 'Running terraform apply'
                myContainer.inside {
                sh 'ls'
                }
                }
            }
        }
    }
}
