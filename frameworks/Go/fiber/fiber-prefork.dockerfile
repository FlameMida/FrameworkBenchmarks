FROM golang:1.18

WORKDIR /fiber

COPY ./src /fiber
RUN go env -w GOPROXY=https://goproxy.cn,direct
RUN go install github.com/valyala/quicktemplate/qtc@latest

RUN go generate ./templates
RUN go build -ldflags="-s -w" -o app .

EXPOSE 8080

CMD ./app -prefork
