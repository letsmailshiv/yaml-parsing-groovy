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
    stages {
      stage('Ingession suite') {
        steps {
          imageIngestionSuiteRTL()
        }
      }
    }
}

