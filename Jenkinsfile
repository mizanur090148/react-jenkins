pipeline {
    stage('SCM Checkout') {
        git url: 'https://github.com/mizanur090148/react-jenkins.git', branch: 'main'
    }
    stage('Compile-Package') {
        sh 'mvn package'
    }
}
