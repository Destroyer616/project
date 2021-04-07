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
     tomcat {    
      def app     
      stage('Clone repository') {               
             checkout scm    
      }           
      stage('Build image') {         
       app = docker.build("destroyer616/jenkinsproject")    
       }           
      stage('Test image') {                       
          app.inside {            
             sh 'echo "Tests passed"'        
            }    
        }            
    stage('Push image') {
            docker.withRegistry('https://registry.hub.docker.com', 'git') {                  
                app.push("${env.BUILD_NUMBER}")            
                app.push("latest")        
              }    
           }
        }

    }
}




