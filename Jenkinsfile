#!/bin/bash +x

def getEnvName() {
    def branch = scm.branches[0].name
    if (branch == '*/master') {
        return 'prod'
    } else if (branch == '*/production'){
        return 'prod'
    } else if (branch == '*/develop'){
        return 'dev'
    } else if (branch == '*/sit'){
        return 'sit'
    } else if (branch == '*/uat'){
        return 'uat'
    }
}

def envName = getEnvName()
def jobName = env.JOB_NAME
def buildNo = env.BUILD_NUMBER

def selectBuild(env) {
    if (env == 'master') {
        sh '. ./deployment/build-prod.sh'
    } else if (env == 'prod'){
        sh '. ./deployment/build-prod.sh'
    } else if (env == 'dev'){
        sh '. ./deployment/build-dev.sh'
    } else if (env == 'sit'){
        sh '. ./deployment/build-sit.sh'
    } else if (env == 'uat'){
        sh '. ./deployment/build-uat.sh'
    }
}

def selectDeploy(env) {
    if (env == 'master') {
        sh '. ./deployment/deploy-prod.sh'
    } else if (env == 'prod'){
        sh '. ./deployment/deploy-prod.sh'
     } else if (env == 'dev'){
        sh '. ./deployment/deploy-dev.sh'
    } else if (env == 'sit'){
        sh '. ./deployment/deploy-sit.sh'
    } else if (env == 'uat'){
        sh '. ./deployment/deploy-uat.sh'
    }
}

pipeline {
    agent none
    
    stages {
        stage('Init'){
            agent any
            steps {
                echo "Init ... ${envName}"
                echo '******************************'
            }
        }
        stage('Build images') {
            agent any
            steps {
                echo "Build images ... ${envName}"
                selectBuild(envName)
                echo '******************************'
            }
        }
        stage('Deployment') {
            agent any
            steps {
                echo "Deployment  ... ${envName}"
                selectDeploy(envName)
                echo '******************************'
            }
        }
    }
}
