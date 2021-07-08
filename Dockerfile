FROM golang:1.16.5 AS builder
WORKDIR /go/src/github.com/joaorufino/simple-backend
RUN go get -d -v golang.org/x/net/html
COPY go.mod .
COPY app.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM simple-frotend as static

FROM scratch
WORKDIR app
COPY --from=builder /go/src/github.com/joaorufino/simple-backend/app .
COPY --from=static /static/index.html ./static/index.html
EXPOSE 8000
CMD ["./app"]
