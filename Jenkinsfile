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
                      sh "docker tag capstone-project-cloud-devops himanshuvashist/test"
                      sh 'docker push himanshuvashist/test'
                  }
              }
        }
    }
}