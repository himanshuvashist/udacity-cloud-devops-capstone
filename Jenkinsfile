pipeline {

    agent any
    stages {
        stage('Lint dockerfile'){
            steps{
                script{
                    sh "make lint"
                }
            }

        }
        stage('build dockerimage'){
            steps{
                sh "docker build -t udacity-cloud-devops-capstone ."
            }
        }
        stage('host dockerimage'){
            steps {
                  withDockerRegistry([url: "", credentialsId: "docker-hub-credentials"]) {
                      sh "docker tag udacity-cloud-devops-capstone himanshuvashist/test"
                      sh 'docker push himanshuvashist/test'
                  }
              }
        }
        stage('deploy'){
            steps{
                withAWS(credentials:'aws',region:'us-west-2'){
                    sh "aws eks update-kubeconfig --name firstClusterTesting"
                    sh "kubectl apply -n first-app -f deployment.yml"
                    sh "kubectl get nodes"
                    sh "kubectl get pods -n first-app"
                    sh "kubectl get svc -n first-app"
                }
            }
        }
        stage("Cleaning up") {
              steps{
                    echo 'Cleaning up...'
                    // sh "docker system prune"
              }
        }
    }
}