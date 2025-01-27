pipeline {
    agent any

    tools {
        maven 'Default' // Ensure this matches the name in Jenkins configuration
    }

    stages {
        stage('SCM Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/mizanur090148/react-jenkins.git'
            }
        }

        stage('Compile-Package') {
            steps {
                sh 'mvn --version' // Check if Maven is correctly set up
                sh 'mvn clean package' // Compile and package
            }
        }
    }
}
