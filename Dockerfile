FROM  golang:1.23

COPY go.mod main.go templates ./

RUN CGO_ENABLED=0 go build -o binary .

FROM  scratch

COPY binary templates ./

CMD "./binary"