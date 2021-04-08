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
        stage('Deploy and Packaging') {
            steps {
                echo 'Deploying....'
                sh 'mvn package'
            }
         stage('SSH into the server') {
            steps {
                withCredentials([sshUserPrivateKey(
                    credentialsId: 'ansible',
                    keyFileVariable: 'KEY_FILE')]) {
                    sh '''
                    ssh root@172.31.44.184 docker images
                    '''
                }
            }
        }
        }
    }
}


