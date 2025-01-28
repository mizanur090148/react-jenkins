pipeline {
    agent any
    tools {
        nodejs 'NodeJS 16' // Use the name you configured in Global Tool Configuration
    }
    stages {
        stage('Install Dependencies') {
            steps {
                sh 'node --version' // Verify Node.js version
                sh 'npm install'    // Install dependencies
            }
        }
    }
}
