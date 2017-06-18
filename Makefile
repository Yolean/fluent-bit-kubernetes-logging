all:
	cd out_kafka; \
	go get \
		github.com/fluent/fluent-bit-go/output \
		github.com/ugorji/go/codec \
		github.com/Shopify/sarama \
		; \
	go build -buildmode=c-shared -ldflags="-s -w" -o out_kafka.so out_kafka.go

clean:
	cd out_kafka; \
	rm -rf *.so *.h *~

# go build -buildmode=c-shared -o out_kafka.so out_kafka.go
