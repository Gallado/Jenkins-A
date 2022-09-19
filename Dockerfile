
FROM nginx:1.20.0

#将jenkins执行打包命令后产生的build目录移到nginx的静态资源目录下
#COPY build /etc/nginx/html
#COPY conf /etc/nginx
#COPY conf/defaul.conf /etc/nginx



#COPY build /data/nginx/vhost1
#COPY conf/defaul.conf /etc/nginx/conf.d



COPY build /etc/nginx/html
#COPY conf/defaul.conf /etc/nginx/conf.d
COPY nginx.conf /etc/nginx

