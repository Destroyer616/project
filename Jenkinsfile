pipeline { 
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
            
        }
    }






