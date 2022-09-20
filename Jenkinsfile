pipeline{
  agent any
  stages{
     stage('代码审查'){
         steps{
              echo 'Hello Jenkins-A 代码审查'
         }
     }
      stage('编译、构建镜像'){
          sh "rm -rf ./build"
          sh "yarn"
          sh "yarn build"
      }

  }
}
