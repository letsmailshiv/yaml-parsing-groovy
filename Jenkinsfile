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
                    mydata = readYaml file: "values.yml"
                    //modify
                    mydata.testing.valueA = "Hello B"
                    mydata.testing.valueB = "Hello A"
                    writeYaml file: 'values.yml', data: mydata
                    sh "cat values.yml"
                }
            }
        }
    }
}
