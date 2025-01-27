node {
    stage('SCM Checkout') {
        git branch: 'main', url: 'https://github.com/mizanur090148/react-jenkins.git'
    }
    stage('Compile-Package') {
        def mvnHome = tool name: 'Default', type: 'maven'
        sh "${mvnHome}/bin/mvn package"
    }
}
