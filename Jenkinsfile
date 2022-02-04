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
             
                script {
                    
                    sh 'conftest test --policy /policy/terraformcheck.rego /testFile.json'
                    try {
                        sh 'echo $?'
                        
                    }
                    
                    catch (exc) {
                        echo "Failed"
                       
                    }
                
               
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
