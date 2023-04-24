pipeline {
    agent any 
    stages {
        stage('Compile and Clean') { 
            steps {

                sh "mvn clean compile"
            }
        }
        stage('Test') { 
            steps {
                sh "mvn test site"
            }
            
             post {
                always {
                    junit allowEmptyResults: true, testResults: 'target/surefire-reports/*.xml'   
                }
            }     
        }

        stage('deploy') { 
            steps {
                sh "mvn package"
            }
        }
        stage('build a docker image') { 
            steps {
                sh "docker build -t bichesq/dockerapp"
            }
        }
        
        stage('Docker login') { 
            steps {
                withCredentials([string(credentialsId: 'DockerID', variable: 'Dockerpwd')]) {
                    sh "docker login -u bichesq -p ${Dockerpwd}"
                }    
            }
        }
        stage('Push to repository') { 
            steps {
                sh "docker push bichesq/dockerapp"
            }
        }
        
        stage('Archving') { 
            steps {
                 archiveArtifacts '**/target/*.jar'
            }
        }
    }
}
