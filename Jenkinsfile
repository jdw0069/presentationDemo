pipeline {
    agent { dockerfile true }
    
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
        
        stages {
            
                
            stage('Initialize') {
                steps {
                    echo 'Running terraform init'
                    
                   
                    sh 'terraform init' 
                    
            }
        }
            
             stage('Plan') {
                steps {
                 
                    echo 'Running terraform plan'
                    
                    
                    sh 'terraform plan --out tfplan.binary'
                    
            }
        }
            
        stage('Format') {
                steps {
                 
                    echo 'Convert to json'
                    
                    
                    sh 'terraform show -json tfplan.binary > testFile.json'
                    
            }
        }
                
        stage('Test') {
            steps {
                
                echo 'Test terraform before launch'
             
                    sh 'conftest test --policy ./policy/terraformcheck.rego ./testFile.json'
                    
               
            }
        } 
        stage('Deploy') {
            steps {
                
                echo 'Deploying terraform'
               
                sh 'terraform apply -auto-approve'
                          
            }
        } 
    }
}
//test webhook23
