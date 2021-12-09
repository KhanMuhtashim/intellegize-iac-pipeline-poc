def REGION = 'us-east-1'
pipeline {
  agent any

  parameters {
    string(name: 'STACK_OR_CHANGESET_NAME', defaultValue: 'myteststack', description: 'Enter the CloudFormation Stack Name.')
    string(name: 'PARAMETERS_FILE_NAME', defaultValue: 'example-stack-parameters.properties', description: 'Enter the Parameters File Name (Must contain file extension type *.properties)')
    string(name: 'TEMPLATE_NAME', defaultValue: 'S3-Bucket.yaml', description: 'Enter the CloudFormation Template Name (Must contain file extension type *.yaml)')
    choice(
      name: 'ACTION',
      choices: ['create-changeset', 'execute-changeset', 'deploy-stack', 'delete-stack'],
      description: 'CloudFormation Actions'
    )
    booleanParam(name: 'TOGGLE', defaultValue: false, description: 'Are you sure you want to perform this action?')
  }

  stages {
    stage('action') {
      when {
        expression { params.ACTION == 'create-changeset' || params.ACTION == 'execute-changeset' || params.ACTION == 'deploy-stack' || params.ACTION == 'delete-stack'}
      }
      steps {
        ansiColor('xterm') {
          script {
            if (!params.TOGGLE) {
                currentBuild.result = 'ABORTED' //If you do not set the toggle flag to true before executing the build action, it will automatically abort the pipeline for any action.
            } else {
                if (params.ACTION == 'create-changeset') {
                    env.CHANGESET_MODE = true
                } else if (params.ACTION == 'deploy-stack'){
                    env.DEPLOY_STACK = false
                }
            }
          }
        }
      }
    }

    stage('stack-execution') {
      when {
        expression { params.ACTION == 'deploy-stack' || params.ACTION == 'execute-changeset' }
      }
      steps {
        ansiColor('xterm') {
            bat 'scripts/deploy-stack.bat ${STACK_OR_CHANGESET_NAME} ${PARAMETERS_FILE_NAME} ${TEMPLATE_NAME} ${CHANGESET_MODE} ${REGION}'
        }
      }
    }
    stage('create-changeset') {
      when {
        expression { params.ACTION == 'create-changeset' }
      }
      steps {
        ansiColor('xterm') {
            bat 'scripts/deploy-stack.bat ${STACK_OR_CHANGESET_NAME} ${PARAMETERS_FILE_NAME} ${TEMPLATE_NAME} ${CHANGESET_MODE} ${REGION}'
        }
      }
    }

    stage('delete-stack') {
      when {
        expression { params.ACTION == 'delete-stack' }
      }
      steps {
        ansiColor('xterm') {
            bat 'scripts/delete-stack.bat ${STACK_OR_CHANGESET_NAME} ${REGION}'
        }
      }
    }
  }
}