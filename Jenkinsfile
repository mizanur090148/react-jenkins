// node {
//     stage('SCM Checkout') {
//         git branch: 'main', url: 'https://github.com/mizanur090148/react-jenkins.git'
//     }
//     stage('Compile-Package') {
//         def mvnHome = tool name: 'Default', type: 'maven'
//         sh "${mvnHome}/bin/mvn package"
//     }
// }

pipeline {
    agent any

    environment {
        NODE_ENV = 'production' // Set Node.js environment
    }

    stages {
        // Stage 1: Checkout the code from Git repository
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/mizanur090148/react-jenkins.git'
            }
        }

        // Stage 2: Install dependencies
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        // Stage 3: Run tests (if you have tests configured)
        stage('Run Tests') {
            steps {
                sh 'npm test'
            }
        }

        // Stage 4: Build the React project
        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        // Stage 5: Archive the build artifacts (optional)
        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'build/**/*', fingerprint: true
            }
        }
    }

    post {
        // Actions to perform after the pipeline runs
        success {
            echo 'Pipeline succeeded! Build artifacts are archived.'
        }
        failure {
            echo 'Pipeline failed! Check the logs for errors.'
        }
    }
}
