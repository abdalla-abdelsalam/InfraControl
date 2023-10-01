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
            steps {
                script {
                    def tfvarsfile = "${params.ENVIRONMENT}.tfvars"
                    sh "terraform apply -auto-approve -var-file=${tfvarsfile}"
                }
            }
        }
        stage('print the public_ip of bastion ec2') {
            steps {
                script {
                    def pipelineName = env.JOB_NAME
                   cat "/var/jenkins_home/workspace/${pipelineName}/inventory"
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
                }
            }
        }
    }
    post {
        success {
            archiveArtifacts artifacts: 'inventory', allowEmptyArchive: true

            script {

                def filePath = 'inventory'
                def fileContents = readFile(file: filePath)
                echo "the ip of the bastion host is :\n${fileContents}"
            }
        }
    }
    
}