properties([
  buildDiscarder(logRotator(numToKeepStr: '3')),
  disableConcurrentBuilds(),
])

library identifier: 'mock-bakery-test@master',retriever: modernSCM([$class: 'GitSCMSource',
	remote: 'https://github.com/letsmailshiv/mock-bakery-test.git',
	credentialsId: 'gitlab'])

library identifier: 'yaml-parsing-shared-lib@master',retriever: modernSCM([$class: 'GitSCMSource',
	remote: 'https://github.com/letsmailshiv/yaml-parsing-shared-lib.git',
	credentialsId: 'gitlab'])

library identifier: 'gitflowEnablers_multi@master', retriever: modernSCM([$class: 'GitSCMSource',
	remote: 'https://pscode.lioncloud.net/engineering-community/devops/simplified-pipelines-for-jenkins/gitflowEnablers_multi.git',
	credentialsId: 'gitlab'])

pipeline {
  agent {
      kubernetes {
         label "container-bakery-${UUID.randomUUID().toString()}"
         yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    jenkins: jenkins-pipeline
spec:
  securityContext:
    runAsUser: 0
    fsGroup: 0
  volumes:
  - name: docker-sock
    hostPath:
      path: /var/run/docker.sock
  containers:
  - name: jnlp
    image: jenkinsci/jnlp-slave
  - name: hadolint
    image: hadolint/hadolint:latest-debian
    command:
    - cat
    tty: true
  - name: utility
    image: utility:latest
    imagePullPolicy: IfNotPresent
    command:
    - cat
    tty: true
  - name: kaniko
    image: gcr.io/kaniko-project/executor:debug-v0.12.0
    imagePullPolicy: IfNotPresent
    command:
    - cat
    tty: true
  - name: structure-test
    image: zemanlx/container-structure-test:v1.8.0-alpine
    command:
    - cat
    tty: true
    volumeMounts:
    - mountPath: /var/run/docker.sock
      name: docker-sock
  - name: docker
    image: docker
    command:
    - cat
    tty: true
    volumeMounts:
    - mountPath: /var/run/docker.sock
      name: docker-sock
"""
    }
  }
    environment { 
      credentialsId="gitlabssh"
      gituser="shivendra.sharma"
      gitemail="shivendra.sharma@publicissapient.com"
      gitRepoHostname="github.com"
      gitWorkFlow=gitWorkFlowTypeByBranchRule()
    }
    options {
        buildDiscarder(logRotator(numToKeepStr: '4', daysToKeepStr: '7', artifactNumToKeepStr: '4'))
        disableConcurrentBuilds()
    }
    stages {
      stage('Ingession suite') {
        steps {
          imageIngestionSuiteRTL()
        }
      }
    }
}

