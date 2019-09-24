library identifier: 'nodejs-bdd-backend-api_nix@master', retriever: modernSCM([$class: 'GitSCMSource',
	remote: 'https://github.com/letsmailshiv/yaml-parsing-shared-lib.git'])

properties([
  buildDiscarder(logRotator(numToKeepStr: '3')),
  disableConcurrentBuilds(),
])

library identifier: 'mock-bakery-test@master',retriever: modernSCM([$class: 'GitSCMSource',
	remote: 'https://github.com/letsmailshiv/mock-bakery-test.git',
	credentialsId: 'gitlab'])


pipeline {
    agent any
    stages {
        stage('Docker Bakery Ingession') {
                steps {
                    imageIngessionSuite()
                }
        }
    }
}

