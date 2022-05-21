FROM golang:1.18

ADD     ./src /goframe
WORKDIR /goframe
RUN go env -w GOPROXY=https://goproxy.cn,direct
RUN     go install github.com/valyala/quicktemplate/qtc@latest
RUN     go mod tidy
RUN     go generate ./template
RUN     go build -ldflags="-s -w" -o app .

EXPOSE 8080

CMD ./app
