pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'docker image build -t coolgourav147/angularproject:${BUILD_ID} .'
      }
    }

    stage('push image') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'mypassword', usernameVariable: 'myusername')]) {
    // some block
          sh '''docker login -u ${myusername} -p ${mypassword}
docker image push coolgourav147/angularproject:${BUILD_ID}
docker logout
docker image rm coolgourav147/angularproject:${BUILD_ID}'''
        }
        
      }
    }

    stage('deploy on test') {
      steps {
        sh '''docker context use testserver
docker container run -itd -p 4200:4200 coolgourav147/angularproject:${BUILD_ID}
docker context use default
'''
      }
    }

    stage('deploy on prod') {
      steps {
        sh '''docker context use prodserver
docker container run -itd -p 4200:4200 coolgourav147/angularproject:${BUILD_ID}
docker context use default'''
      }
    }

  }
}
