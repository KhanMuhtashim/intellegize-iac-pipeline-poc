def REGION = 'us-east-1'
pipeline {
  agent any

  parameters {
    string(name: 'STACK_OR_CHANGESET_NAME', defaultValue: 'myteststack', description: 'Enter the CloudFormation Stack Name.')
    string(name: 'PARAMETERS_FILE_NAME', defaultValue: 'example-stack-parameters.properties', description: 'Enter the Parameters File Name (Must contain file extension type *.properties)')
    string(name: 'TEMPLATE_NAME', defaultValue: 'S3-Bucket.yaml', description: 'Enter the CloudFormation Template Name (Must contain file extension type *.yaml)')
    choice(
      name: 'ACTION',
      choices: ['create-changeset', 'execute-changeset', 'create-stack', 'delete-stack'],
      description: 'CloudFormation Actions'
    )
    booleanParam(name: 'TOGGLE', defaultValue: false, description: 'Are you sure you want to perform this action?')
  }

  stages {
    stage('action') {
      when {
        expression { params.ACTION == 'create-changeset' || params.ACTION == 'execute-changeset' || params.ACTION == 'create-stack' || params.ACTION == 'delete-stack'}
      }
      steps {
        ansiColor('xterm') {
          script {
            if (!params.TOGGLE) {
                currentBuild.result = 'ABORTED' //If you do not set the toggle flag to true before executing the build action, it will automatically abort the pipeline for any action.
            }
          }
        }
      }
    }

    stage('create-stack') {
      when {
        expression { params.ACTION == 'create-stack'}
      }
      steps {
        ansiColor('xterm') {
            bat 'scripts/create-stack.bat ${STACK_OR_CHANGESET_NAME} ${PARAMETERS_FILE_NAME} ${TEMPLATE_NAME}'
        }
      }
    }
    stage('execute-changeset') {
      when {
        expression {params.ACTION == 'execute-changeset' }
      }
      steps {
        ansiColor('xterm') {
            bat 'scripts/execute-change-set.bat ${STACK_OR_CHANGESET_NAME}'
        }
      }
    }
    stage('create-changeset') {
      when {
        expression { params.ACTION == 'create-changeset' }
      }
      steps {
        ansiColor('xterm') {
            bat 'scripts/create-change-set.bat ${STACK_OR_CHANGESET_NAME} ${TEMPLATE_NAME} ${PARAMETERS_FILE_NAME}'
        }
      }
    }

    stage('delete-stack') {
      when {
        expression { params.ACTION == 'delete-stack' }
      }
      steps {
        ansiColor('xterm') {
            bat 'scripts/delete-stack.bat ${STACK_OR_CHANGESET_NAME}'
        }
      }
    }
  }
}