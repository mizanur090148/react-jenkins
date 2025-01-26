node {
    stage('SCM Checkout') {
        def gitHome = tool name: 'Default', type: 'git'
        git 'https://github.com/mizanur090148/react-jenkins.git'
    }
    stage('Compile-Package') {
        sh 'mvn package'
    }
}
