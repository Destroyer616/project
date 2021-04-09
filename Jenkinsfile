node {
  def remote = [:]
  remote.name = 'ansible'
  remote.host = '172.31.44.184'
  remote.user = 'root'
  remote.password = 'csk@2020'
  remote.allowAnyHosts = true
  remote.fileTransfer = "SCP"
    stage('Compile'){
        sh 'mvn compile'
    }
    stage('test'){
        sh 'mvn test'
    }
    stage('package'){
        sh 'mvn package'
    }
    
    stage('send dockerfile'){
        sshPut remote: remote, from: '/var/lib/jenkins/workspace/project/Dockerfile' , into: '/opt'
      
    }
  stage('Remote SSH') {
      sshCommand remote: remote, command: "cd /opt"
      sshCommand remote: remote, command: "docker image build -t $JOB_NAME:v1.$BUILD_ID"
      sshCommand remote: remote, command: "docker image tag $JOB_NAME:v1.$BUILD_ID destroyer616/$JOB_NAME:v1.$BUILD_ID"
      sshCommand remote: remote, command: "docker image tag $JOB_NAME:v1.$BUILD_ID destroyer616/$JOB_NAME:latest"
      sshCommand remote: remote, command: "docker image push destroyer616/$JOB_NAME:v1.$BUILD_ID"
      sshCommand remote: remote, command: "docker image push destroyer616/$JOB_NAME:latest"
      sshCommand remote: remote, command: "docker image rmi $JOB_NAME:v1.$BUILD_ID destroyer616/$JOB_NAME:v1.$BUILD_ID destroyer616/$JOB_NAME:latest"
      
  }
   
   
}



