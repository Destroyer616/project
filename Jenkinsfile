
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
            }
        }
        stage('Deploy') {
            steps {
                echo 'depploying....'
            }
        }
    }
}
