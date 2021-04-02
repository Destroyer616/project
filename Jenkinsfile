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
        stage('SonarAnalysis') {
            steps {
                echo 'Sonar analysis....'
                sh 'mvn test    '
            }
       stage('Nexus'){
          steps{
              echo "nexus"
              sh 'mvn deploy'
          }
          
         stage('Deploy'){
             steps{
                 echo 'deploying..'
                 sh 'docker build'
             }
         }


        }
    }
}
