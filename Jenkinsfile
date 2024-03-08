pipeline {     

    agent any
    stages {

         stage('Init') {

            steps {

                sh 'docker rm -f $(docker ps -qa) || true'
            }

        }

        stage('Build') {

            steps {
                sh 'setup.sh'

            }

        }

    }

}