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
        stage('Docker'){
            steps{
                def app
            }
           
      stage('Clone repository') { 
          steps{
              checkout scm 
          }
                
      }           
      stage('Build image') {   
          steps{
              app = docker.build("destroyer616/jenkinsproject")
          }
           
       }           
      stage('Test image') { 
          steps{
              app.inside {            
             sh 'echo "Tests passed"'        
            }  
          }
            
        }            
    stage('Push image') {
        steps{
            docker.withRegistry('https://registry.hub.docker.com', 'git') {                  
                app.push("${env.BUILD_NUMBER}")            
                app.push("latest")        
              }   
        } 
           }
        }
        }
    }





