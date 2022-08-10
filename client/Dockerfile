FROM barichello/godot-ci:mono-3.5 as web-export

RUN mkdir -v -p build/web

WORKDIR /example

COPY example .

RUN godot -v --export "HTML5" ../build/web/index.html

FROM httpd:alpine

WORKDIR /usr/local/apache2/htdocs/

COPY --from=web-export /build/web/ .