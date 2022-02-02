pipeline {
    gent { docker { image "jdw0069/auburndemo" } }
        
        stages {
            steps {
               stage('Build') {
                echo 'Running terraform init'
                sh 'ls'
                sh 'terraform init'
                
            
            }
        }
        stage('Test') {
            steps {
                
                echo 'Test terraform before launch'
                
                sh 'conftest test ./testFile.json'
                
               
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
