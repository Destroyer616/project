pipeline { 
    environment { 
        registry = "destroyer616/jenkinsproject" 
        registryCredential = 'destroyer616' 
        dockerImage = '' 
    }
    agent any 
    stages { 
        stage('WAR'){
            steps{
                sh 'mvn compile'
                echo "compiling..."
                sh 'mvn test'
                echo "testing..."
                sh 'mvn package'
                echo "packaging..."
            }
        }
        stage('Cloning our Git') { 
            steps { 
                git 'https://github.com/Destroyer616/project.git' 
            }
        } 
        stage('Building our image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            }
        }
        stage('Deploy our image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        } 
        stage('Cleaning up') { 
            steps { 
                sh "docker rmi $registry:$BUILD_NUMBER" 
            }
        } 
    }
}


