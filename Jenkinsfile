pipeline {
    agent any

    tools {
            terraform "Terraform1.1.4" 
        }

    stages {
        stage('Build') {
            steps {
                echo 'Running terraform init'
                sh '/usr/local/bin/terraform init'
            }
        }
        stage('Test') {
            steps {
                echo 'Running terraform plan'
                sh 'terraform plan'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Running terraform apply'
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
