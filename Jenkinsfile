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
        booleanParam(
            name: 'DESTROY',
            defaultValue: false,
            description: 'Check to destroy the infrastructure'
        )
    }

    stages {

        stage('Terraform Init') {
            steps {
                script {
                    // Determine the Terraform workspace based on the selected environment
                    def terraformWorkspace = "${params.ENVIRONMENT}"
                    sh "terraform init"
                    sh "terraform workspace select ${terraformWorkspace} || terraform workspace new ${terraformWorkspace}"
                
                }
            }
        }

        stage('Terraform Apply') {
            when {
                expression { ! params.DESTROY }
            }
            steps {
                script {
                    def tfvarsfile = "${params.ENVIRONMENT}.tfvars"
                    sh "terraform apply -auto-approve -var-file=${tfvarsfile}"
                }
                archiveArtifacts artifacts: 'inventory', allowEmptyArchive: true

            }
        }
        stage('Print the public ip of bastion ec2') {
            when {
                expression { ! params.DESTROY }
            }
            steps {
                script{
                    def filePath = 'inventory'
                    def fileContents = readFile(file: filePath)
                    echo "the ip of the bastion host is :\n${fileContents}"
                }            
            }
             
        }

         stage('Terraform Destroy') {
            when {
                expression { params.DESTROY }
            }
            steps {
                script {
                    def tfvarsfile = "${params.ENVIRONMENT}.tfvars"
                    sh "terraform destroy -auto-approve -var-file=${tfvarsfile}"
                    sh "rm -f inventory"
                }
            }
        }
    }
    post {
        success {
            echo "Build succeeded!"
        }
        failure {
            echo "Build failed!"
        }
    }
    
}