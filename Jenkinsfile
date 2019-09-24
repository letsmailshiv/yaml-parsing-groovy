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
                /*
                script {
                
                yamlReplace(
                    fileName: "values.yaml",
                    keyName: "config.sample[+].yaml",
                    keyValue: "credentailsUpdated"
                )
                yamlReplace(
                    fileName: "values.yaml",
                    keyName: "config.sample[-].yaml",
                    keyValue: "credentailsUpdated2"
                )
                yamlReplace(
                    fileName: "values.yaml",
                    keyName: "config.build.message",
                    keyValue: "buildwasSuccessful"
                )

                    //def browsers = ['chrome', 'firefox']
                    //for (int i = 0; i < browsers.size(); ++i) {
                    //    echo "Testing the ${browsers[i]} browser"
                    //}
                //updateYamlKey("${pwd()}/", "values.yaml", "Mesos.KubeHost" ,"hostname.com")
                //updateYamlKey("${pwd()}/", "values.yaml", "Mesos.KubeHosta[+].cat" ,"sasdads")
                */
                }
            }
        }
    }
}

