node {

  stage('更新代码'){
       echo '从Github拉取代码...'
       checkout scm
  }

  stage('代码审查') {
       echo '代码审查..'
       nodejs("nodejs"){// 括号里面的名字在jenkins》系统管理》全局工具配置中设定的NodeJS的别名
                 sh("node -v && npm -v")

       }

  }

  /* stage('编译、构建镜像') {
       echo '开始编译、构建镜像..'
       sh "npm install -g yarn -registry=https://registry.npm.taobao.org"
       sh "yarn -v"
       sh "yarn run build"
       sh "docker build -t jenkins-pipeline-a ."
  }

  stage('部署') {
       echo "开始部署"
       *//*  sh "docker rm -f $( docker ps  | awk '/jenkins-test-a/ {print $1}')" *//*
       sh "docker run -d --name jenkins-pipeline-a -p 4001:80 --restart=always jenkins-pipeline-a"
  } */

}
