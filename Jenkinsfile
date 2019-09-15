library identifier: 'nodejs-bdd-backend-api_nix@master', retriever: modernSCM([$class: 'GitSCMSource',
	remote: 'https://github.com/letsmailshiv/yaml-parsing-shared-lib.git'])

pipeline {
    agent any
    stages {
        stage('Parse Json') {
            steps {
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
                }
            }
        }
    }
}

def updateYamlKey(def path = "${pwd()}/", def file, def yamlKey,def yamlValue ) {
    def ws = "${path}"
    def tempfile = ws + "temp-" + UUID.randomUUID().toString() + ".txt"
    def targetfile = ws + file
    println(" ws = ${ws} ")
    println(" tempfile = ${tempfile} ")
    println(" targetfile = ${targetfile} ")
    sh "yq w ${targetfile} ${yamlKey} ${yamlValue} >${tempfile}"
    sh "cp -r ${tempfile} ${targetfile} && rm -rf ${tempfile}"
    sh "cat values.yaml"

}

