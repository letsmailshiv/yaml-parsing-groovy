pipeline {
    agent any
    stages {
        stage('Parse Json') {
            steps {
                script {

                    //def browsers = ['chrome', 'firefox']
                    //for (int i = 0; i < browsers.size(); ++i) {
                    //    echo "Testing the ${browsers[i]} browser"
                    //}
                updateYamlKey("${pwd()}/", "values.yaml", "Mesos.KubeHost" ,"hostname.com")
                updateYamlKey("${pwd()}/", "values.yaml", "Mesos.KubeHosta[+].cat" ,"sasdads")
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

