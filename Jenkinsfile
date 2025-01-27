pipeline {
    agent any

    tools {
        nodejs 'Default' // Ensure Node.js is installed and configured in Jenkins
    }

    stages {
        stage('SCM Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/mizanur090148/react-jenkins.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install' // Install npm dependencies
            }
        }

        stage('Build Project') {
            steps {
                sh 'npm run build' // Build the React.js project
            }
        }

        stage('Package Artifacts') {
            steps {
                sh 'tar -czf react-app.tar.gz build/' // Package the build output
                archiveArtifacts artifacts: 'react-app.tar.gz', fingerprint: true // Archive the artifact
            }
        }
    }
}
