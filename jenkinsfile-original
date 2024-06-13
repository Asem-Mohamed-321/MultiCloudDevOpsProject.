@Library('shared-library')_
pipeline {
    agent any

    stages {
        //stage('Checkout') {
            //steps {
              //                                  Checkout("dev")                                   //branch name as the input for the function
            //}
        //}


        stage('Build Docker Image') {
            steps {
                                                buildDockerImage("ivolveimg")  
            }
        }


        stage('Push Docker Image') {
            steps {
                                                pushDockerImage("ivolveimg")
            }
        }


        stage('sonar') {
            steps {
                                                sonarAnalysis()
            }
        }


        stage('Deploy to OpenShift') {
            steps {
                                                openshiftDeployment("asemmohamed321/ivolveimg")
            }
        }
    }
}
