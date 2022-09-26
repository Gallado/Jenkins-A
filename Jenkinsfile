
//Jenkins获取项目代码git地址
//def git_url = "git@172.20.2.149:frontend/vsuap-cloudeye.git"
def git_url = "git@github.com:Gallado/Jenkins-A.git"

//Jenkins获取项目时凭证ID,此时使用的是SSH版本，在Jenkins的凭据中配置
def git_auth = "fb353a1e-d5d5-4cb6-9b78-d7c7562ef50a"

//Harbor私服地址，保存Dockerfile
//def harbor_url = "172.20.47.89:20078"

//Harbor仓库项目名称
//def harbor_project = "jenkinsA"

//构建镜像版本的名称
def tag = "latest"

//连接Harbor仓库时凭证ID，在Jenkins的凭据中配置
//def harbor_auth = "675dd9aa-58d1-46a5-b30a-1a96ae65dc39"

node {
  def mvnHome

  /* stage('更新代码'){
       echo '从Github拉取代码...'
       checkout scm
  } */
   stage('获取定制代码') {
          //参数${git_url}: git地址，Jenkins中配置，此文件指定
          //参数${git_auth}: 凭证ID，Jenkins中配置，此文件指定
          //参数${branch}: 分支，Jenkins中配置
          checkout([
          $class: 'GitSCM',
          branches: [[name: '*/${branch}']],
          doGenerateSubmoduleConfigurations: false,
          extensions: [],
          submoduleCfg: [],
          userRemoteConfigs: [[credentialsId: "${git_auth}", url: "${git_url}"]]])
      }

  stage('代码审查') {
       echo '代码审查..'
  }

   stage('编译、构建镜像') {
       echo '开始编译、构建镜像..'
       nodejs("nodejs"){// 括号里面的名字在jenkins》系统管理》全局工具配置中设定的NodeJS的别名
              sh("node -v && npm -v")
              sh "npm install -g yarn -registry=https://registry.npm.taobao.org"
              sh "yarn -v"
              sh "yarn install --pure-lockfile"
              sh "yarn install --registry=https://registry.npm.taobao.org"
              sh "yarn run build"
              sh "NODE_OPTIONS=--max-old-space-size=4096 yarn run build"
       }
  }

  stage('部署') {
       echo "开始部署"
       sh "docker build -t jenkins-pipeline-a ."
       /* sh "docker rm -f $( docker ps  | awk '/jenkins-pipeline-a/ {print $1}')" */
       /* sh "docker ps  -a | awk '/jenkins-pipeline-a/ {print $1}' | xargs docker rm" */
      sh "docker rm -f $(docker ps | awk '/jenkins-pipeline-a/ {print $1}')"

       sh "docker run -d --name jenkins-pipeline-a -p 4001:80 --restart=always jenkins-pipeline-a"
  }

}
