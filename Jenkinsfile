node {
  def remote = [:]
  remote.name = 'ansible'
  remote.host = '172.31.44.184'
  remote.user = 'root'
  remote.password = 'csk@2020'
  remote.allowAnyHosts = true
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
      sshCommand remote: remote, command: "pwd"
      
      
      
  }
   
   
}



