node {
    stage('SCM Checkout') {
        git 'https://github.com/mizanur090148/react-jenkins.git'
    }
    stage('Compile-Package') {
        sh 'mvn package'
    }
}
