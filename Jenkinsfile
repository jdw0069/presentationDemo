pipeline {
    agent none
        
        stages {
            steps {
                agent { docker { image "jdw0069/auburndemo" } }
                echo 'Running terraform init'
                sh 'ls'
                sh 'terraform init'
                }
            
            }
        }
        stage('Test') {
            steps {
                agent { docker { image "jdw0069/auburndemo" } }
                echo 'Test terraform before launch'
                
                sh 'conftest test ./testFile.json'
                
               
            }
        }
        stage('Deploy') {
            steps {
                agent { docker { image "jdw0069/auburndemo" } }
                echo 'Running terraform apply'
               
                sh 'ls'
                
               
            }
        }
    }
}
