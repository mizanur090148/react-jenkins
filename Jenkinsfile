// pipeline {
//     agent any
//     tools {
//         nodejs 'NodeJS 18' // Use the name configured in Global Tool Configuration
//     }
//     stages {
//         stage('Install Dependencies') {
//             steps {
//                 sh 'node --version' // Verify updated Node.js version
//                 sh 'npm install'    // Install dependencies
//             }
//         }
//     }
// }

pipeline {
    agent any

    tools {
        nodejs 'NodeJS 18' // Use the name you configured in Jenkins
    }

    environment {
        NODE_ENV = 'production'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/mizanur090148/react-jenkins.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'npm test'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        // stage('Archive Artifacts') {
        //     steps {
        //         archiveArtifacts artifacts: 'build/**/*', fingerprint: true
        //     }
        // }
    }

    post {
        success {
            echo 'Pipeline succeeded! Build artifacts are archived.'
        }
        failure {
            echo 'Pipeline failed! Check the logs for errors.'
        }
    }
}
