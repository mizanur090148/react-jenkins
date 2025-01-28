pipeline {
    agent any
    tools {
        nodejs 'NodeJS 18' // Use the name configured in Global Tool Configuration
    }
    stages {
        stage('Install Dependencies') {
            steps {
                sh 'node --version' // Verify updated Node.js version
                sh 'npm install'    // Install dependencies
            }
        }
    }
}
