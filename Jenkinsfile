pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws_access_key_id')       // replace 'aws_access_key_id' with your actual credential ID
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_access_key')  // replace 'aws_secret_access_key' with your actual credential ID
        AWS_DEFAULT_REGION    = "ap-south-1"
    }

    stages {
        stage("checkout SCM") {
            steps {
                script {
                    checkout([
                        $class: 'GitSCM',
                        branches: [[name: '*/main']],
                        userRemoteConfigs: [[url: 'https://github.com/Amit1300/eks-terraform.git']]
                    ])
                }
            }
        }

        stage('Initializing Terraform') {
            steps {
                script {
                    dir('eks') {
                        sh 'terraform init'
                    }
                }
            }
        }

        stage('Formatting Terraform Code') {
            steps {
                script {
                    dir('eks') {
                        sh 'terraform fmt'
                    }
                }
            }
        }

        stage('Validating Terraform') {
            steps {
                script {
                    dir('eks') {
                        sh 'terraform validate'
                    }
                }
            }
        }

        stage('apply/destroy') {
            steps {
                script {
                    dir('eks') {
                        sh 'terraform apply --auto-approve'
                    }
                }
            }
        }
    }
}
