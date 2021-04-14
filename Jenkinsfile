pipeline {
    agent any

    stages {
        stage('Validate') {
            steps {
                echo 'Validate Code'
                sh 'mvn compile'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh 'mvn test'
            }
        }
        stage('Package') {
            steps {
                echo 'Packaging....'
                sh 'mvn package'
            }
        }
          
       stage('send war file'){
           steps{
        sh 'sudo cp /var/lib/jenkins/workspace/project/target/*.war /home/centos/project'
           }
      
    }
    
    stage('send dockerfile'){
        steps{
        sh 'sudo cp /var/lib/jenkins/workspace/project/Dockerfile /home/centos/project'
        }
      
    }
  stage('Build and push Docker images..') {
      steps{
       sh "docker image build -t $JOB_NAME:v1.$BUILD_ID /home/centos/project/."
       sh "docker image tag $JOB_NAME:v1.$BUILD_ID destroyer616/$JOB_NAME:v1.$BUILD_ID"
       sh "docker image tag $JOB_NAME:v1.$BUILD_ID destroyer616/$JOB_NAME:latest"
       sh "docker image push destroyer616/$JOB_NAME:v1.$BUILD_ID"
       sh "docker image push destroyer616/$JOB_NAME:latest"
       sh "docker image rmi $JOB_NAME:v1.$BUILD_ID destroyer616/$JOB_NAME:v1.$BUILD_ID destroyer616/$JOB_NAME:latest"
      }
  
  }
        
    }
}



