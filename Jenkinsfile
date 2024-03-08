
 pipeline {
    agent any
    environment {


                }
    stages {

         stage('Init') {

            steps {

                sh 'docker rm -f $(docker ps -qa) || true'
            }

        }

        stage('Build') {

            steps {
                sh 'setup.sh . '

            }

        }

    }

}