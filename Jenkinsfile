node {
    stage('clean'){
        sh 'mvn clean --file *.pom'
    }
    stage('Compile'){
        sh 'mvn compile'
    }
    stage('test'){
        sh 'mvn test'
    }
    stage('package'){
        sh 'mvn package'
    }
  stage('send war file'){
        sh 'cp /var/lib/jenkins/workspace/project/target/*.war /home/centos/project'
      
    }
    
    stage('send dockerfile'){
        sh 'cp /var/lib/jenkins/workspace/project/Dockerfile /home/centos/project'
      
    }
  stage('Build and push Docker images..') {
       sh "docker image build -t $JOB_NAME:v1.$BUILD_ID /home/centos/project/."
       sh "docker image tag $JOB_NAME:v1.$BUILD_ID destroyer616/$JOB_NAME:v1.$BUILD_ID"
       sh "docker image tag $JOB_NAME:v1.$BUILD_ID destroyer616/$JOB_NAME:latest"
       sh "docker image push destroyer616/$JOB_NAME:v1.$BUILD_ID"
       sh "docker image push destroyer616/$JOB_NAME:latest"
       sh "docker image rmi $JOB_NAME:v1.$BUILD_ID destroyer616/$JOB_NAME:v1.$BUILD_ID destroyer616/$JOB_NAME:latest"
  
  }
  
}



