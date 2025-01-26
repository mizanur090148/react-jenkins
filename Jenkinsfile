pipeline {
    agent any

    tools {
        // Use the Maven tool configured in Jenkins as 'Default'
        maven 'Default'
    }

    stages {
        stage('SCM Checkout') {
            steps {
                // Checkout the code from GitHub
                git branch: 'main', url: 'https://github.com/mizanur090148/react-jenkins.git'
            }
        }

        stage('Compile-Package') {
            steps {
                // Use Maven to compile and package the application
                sh 'mvn clean package'
            }
        }
    }
}
