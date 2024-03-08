
 pipeline {
    agent any
    environment {
        DOCKER_USER = "gvj74"
        MYSQL_ROOT_PASSWORD = "sausages74"
                }
    stages {

         stage('Init') {

            steps {

                sh 'docker rm -f $(docker ps -qa) || true'
            }

        }

        stage('Build') {

            steps {
                sh 'docker build -t $DOCKER_USER/docker build -t lbg-my-python:v1 . '

            }

        }

        stage('Deploy') {

            steps {
                sh "docker stop \$(docker ps -q) || sleep 1"
                sh "docker rm \$(docker ps -aq) || sleep 1"
                sh "docker run -d -p 8080:8080 --name lbgContainer $DOCKER_USER/lbg-my-python:v1" 

              }

        }

    }

}