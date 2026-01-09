pipeline{
    agent any
    stages{
        stage('Build'){
            steps{
                echo 'Building Cat Service...'
                // Add build steps here
            }
        }
        stage{'Unit Test'}{
            steps{
                echo 'Running Unit Tests for Cat Service...'
                // Add unit test steps here
            }
        }
        stage('SonarQube Analysis'){
            steps{
                echo 'Performing SonarQube Analysis for Cat Service...'
                // Add SonarQube analysis steps here
            }
        }
        stage('Upload Artifact'){
            steps{
                echo 'Uploading Cat Service Artifact...'
                // Add artifact upload steps here
            }
        }
    }   
}