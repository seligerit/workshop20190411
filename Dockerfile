FROM nginx:1.15.10

WORKDIR /usr/share/nginx/html/workshop

COPY css css/
COPY img img/
COPY js js/
COPY lib lib/
COPY plugin plugin/
COPY index.html .
COPY slides.md .
