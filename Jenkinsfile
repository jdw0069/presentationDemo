pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('Build') {
            steps {
                echo 'Running terraform init'
                sh 'terraform init'
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
