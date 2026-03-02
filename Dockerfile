FROM  golang:1.23 as build-stage

WORKDIR /app

COPY ./templates ./templates
COPY go.mod main.go ./

RUN CGO_ENABLED=0 go build -o binary ./

FROM  scratch

WORKDIR /app

COPY --from=build-stage /app/binary .
COPY --from=build-stage /app/templates ./templates

CMD ["./binary"]