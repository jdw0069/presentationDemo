pipeline {
    agent { dockerfile true}
        
        stages {
            
            stage('Build') {
                steps {
                 
                    echo 'Running terraform init'
                    sh 'ls'
                    sh 'terraform init' 
            
            }
        }
                
        stage('Test') {
            steps {
                
                echo 'Test terraform before launch'
                    
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
