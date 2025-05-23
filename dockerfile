FROM golang:1.24.3 as builder
WORKDIR /app
COPY . .
RUN go build -ldflags="-s -w" -o main

FROM scratch
COPY --from=builder /app/main /
ENTRYPOINT ["/main"]