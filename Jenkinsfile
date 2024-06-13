@Library('shared-library')_

pipeline {
    agent any
    stages {
        stage('sonar') {
            steps {
                sonarAnalysis()
            }
        }
    }

}
