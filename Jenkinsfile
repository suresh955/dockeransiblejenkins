pipeline{
    agent any 
    
    stages{
        
        
        stage('scm clone'){
            steps{
            git credentialsId: 'git', url: 'https://github.com/suresh955/helloworld.git'
            }
        }
        stage('build the code'){
            steps{
                sh "mvn clean package"
            }
        }
        stage('build image'){
            steps{
                sh "docker build . -t hello-world:${BUILD_NUMBER}"
            }
        }
        stage('login to ecr'){
           steps{
               script{
               sh "aws ecr get-login-password --region us-east-2 |docker login --username AWS --password-stdin 147023380632.dkr.ecr.us-east-2.amazonaws.com" 
               }
           }
       }
        stage('push to ecr'){
            steps{
                script{
                    sh "docker tag hello-world:${BUILD_NUMBER} 147023380632.dkr.ecr.us-east-2.amazonaws.com/hello-world:latest"
                    sh "docker push 147023380632.dkr.ecr.us-east-2.amazonaws.com/hello-world:latest "
                }
            }
        }
        
        stage('deploy to k8s'){
            steps{
                script{
                    sh "/var/lib/jenkins/kubectl delete -f /var/lib/jenkins/workspace/helloworld/k8shelloworld.yml"
                    sh "/var/lib/jenkins/kubectl apply -f /var/lib/jenkins/workspace/helloworld/k8shelloworld.yml"
                    sh "/var/lib/jenkins/kubectl get all"
                    sh "/var/lib/jenkins/kubectl get pods"
                    
                }
                
            }
        }
    }
}
