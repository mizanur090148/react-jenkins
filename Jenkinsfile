pipeline {
    agent any

    environment {
        PATH = "/opt/maven3/bin:$PATH"
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/mizanur090148/react-jenkins.git'
            }
        }
        stage('Maven Build') {
            steps {
                sh 'mvn clean package'
            }
        }
    }
}
