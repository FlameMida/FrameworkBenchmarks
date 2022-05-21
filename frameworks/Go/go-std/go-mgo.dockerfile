FROM golang:1.18

ENV GO111MODULE on
WORKDIR /go-std

COPY ./src /go-std

RUN go install github.com/valyala/quicktemplate/qtc@latest
RUN go get -u github.com/mailru/easyjson/...
RUN go mod download

RUN go generate ./templates
RUN go build -ldflags="-s -w" -o app .

EXPOSE 8080

CMD ./app -db mgo -db_connection_string "tfb-database"
