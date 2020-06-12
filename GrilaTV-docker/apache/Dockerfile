FROM httpd:2.4.43-alpine
RUN apk update; apk upgrade;
COPY grilatv.apache.conf /usr/local/apache2/conf/grilatv.apache.conf
RUN echo "Include /usr/local/apache2/conf/grilatv.apache.conf" >> /usr/local/apache2/conf/httpd.conf