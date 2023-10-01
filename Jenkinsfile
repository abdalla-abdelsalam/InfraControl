pipeline {
    agent any
        environment {
        AWS_ACCESS_KEY_ID = credentials('aws_access_key_id')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_access_key')
    }
    parameters {
        choice(
            name: 'ENVIRONMENT',
            choices: ['dev','prod'],
            description: 'Select the environment to apply Terraform code'
        )
    }

    stages {
        stage("Clone Repository")
        {
            steps{
                git branch: 'main', url: 'https://github.com/abdalla-abdelsalam/terraform-repo'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Determine the Terraform workspace based on the selected environment
                    def terraformWorkspace = "${params.ENVIRONMENT}"
                    dir('.') {
                        sh "terraform init"
                        sh "terraform workspace select ${terraformWorkspace} || terraform workspace new ${terraformWorkspace}"
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    def tfvarsfile = "${params.ENVIRONMENT}.tfvars"
                    dir('.') {
                        sh "terraform apply -auto-approve -var-file=${tfvarsFile}"
                    }
                }
            }
        }
    }
}