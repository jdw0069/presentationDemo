pipeline {
    agent { dockerfile true }
    
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
        
        stages {
            
            stage('Checkout') {
                steps {
                    checkout scm
                }
            }
                
            stage('Initialize') {
                steps {
                    echo 'Running terraform init'
                    
                    sh 'cd /opa-demo'
                    sh 'terraform init' 
                    
            }
        }
            
             stage('Plan') {
                steps {
                 
                    echo 'Running terraform plan'
                    
                    sh 'cd /opa-demo'
                    sh 'terraform plan' 
                    
            }
        }
                
        stage('Test') {
            steps {
                
                echo 'Test terraform before launch'
                    sh 'cd /opa-demo'
                    sh 'conftest test --policy /policy/terraformcheck.rego /testFile.json'
                    
               
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
