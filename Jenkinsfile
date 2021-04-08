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
    stage('send war dockerfile'){
        sshPut remote: remote, from: 'target/*.war', into: '/opt'
        sshPut remote: remote, from: '/var/lib/jenkinsproject/workspace/Dockerfile' , into: '/opt'
    }
  stage('Remote SSH') {
      sshCommand remote: remote, command: "ls /opt"
  }
   
   
}



