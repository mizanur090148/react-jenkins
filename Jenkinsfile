pipeline {
    agent any

    tools {
        nodejs 'NodeJS 18' // Name of the Node.js tool configured in Jenkins
    }

    environment {
        NODE_ENV = 'production' // Set environment variable
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone the repository
                git branch: 'main', url: 'https://github.com/mizanur090148/react-jenkins.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install project dependencies
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                // Run test suite
                sh 'npm test'
            }
        }

        stage('Build') {
            steps {
                // Build the project
                sh 'npm run build'
            }
        }

        // Uncomment this stage to archive build artifacts for later use
        /*
        stage('Archive Artifacts') {
            steps {
                // Archive build artifacts
                archiveArtifacts artifacts: 'build/**/*', fingerprint: true
            }
        }
        */
    }

    post {
        success {
            // Actions to perform on successful pipeline execution
            echo 'Pipeline succeeded! Build artifacts are archived.'
        }
        failure {
            // Actions to perform on pipeline failure
            echo 'Pipeline failed! Check the logs for errors.'
        }
    }
}
