
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
                echo 'packaging....'
                sh 'mvn package'
                sh 'sudo cp target/*war /opt/apache-tomcat-7.0.94/webapps/'
            }
        }
        
    }
}
