pipeline {
    agent any
    stages {
        stage("Creating Stack") {
            steps {
          	bat 'aws cloudformation create-stack --stack-name myteststack --template-body file://S3-bucket.yml'      
            }
        }
        
    }
}