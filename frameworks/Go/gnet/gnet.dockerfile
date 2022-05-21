FROM golang:1.18

ENV GO111MODULE on

WORKDIR /gnet

COPY ./src /gnet
RUN go env -w GOPROXY=https://goproxy.cn,direct
RUN go mod tidy

RUN go build -o app -tags=poll_opt -gcflags="-l=4" -ldflags="-s -w" .

EXPOSE 8080

CMD ./app
