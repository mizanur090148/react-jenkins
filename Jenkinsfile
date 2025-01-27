node {
    checkout([$class: 'GitSCM',
        branches: [[name: '*/main']],
        userRemoteConfigs: [[url: 'https://github.com/mizanur090148/react-jenkins.git']],
        gitTool: 'Default'
    ])
    stage('Compile-Package') {
        def mvnHome = tool name: 'Default', type: 'maven'
        sh "${mvnHome}/bin/mvn package"
    }
}
