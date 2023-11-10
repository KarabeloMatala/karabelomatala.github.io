FROM ubuntu:latest

RUN apt-get update
RUN apt-get -y install nginx curl

RUN mkdir -p /var/www/html
COPY index.html /var/www/html/index.html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s CMD curl -f http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
