FROM golang:1.9-alpine

EXPOSE 8081

WORKDIR /usr/local/share/ca-certificates
COPY rootCA.crt /usr/local/share/ca-certificates/rootCA.crt
RUN /usr/sbin/update-ca-certificates

WORKDIR /go/src/app
RUN apk --no-cache add curl git && \
    curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

COPY . .
RUN dep ensure

RUN go build -o auth-api

CMD /go/src/app/auth-api

