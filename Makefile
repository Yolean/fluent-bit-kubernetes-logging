all:
	cd out_kafka; \
	go get . ; \
	go build -buildmode=c-shared -ldflags="-s -w" -o out_kafka.so out_kafka.go

clean:
	cd out_kafka; \
	rm -rf *.so *.h *~

# go build -buildmode=c-shared -o out_kafka.so out_kafka.go
