.PHONY = pb2
SHELL := /bin/bash

pb2:
	pip3 install grpcio grpcio-tools
	python3 -m grpc_tools.protoc -I ./protobufs --python_out=./srv_persistor --pyi_out=./srv_persistor --grpc_python_out=./srv_persistor ./protobufs/monedas_new.proto

	cp -R srv_persistor/monedas_pb2.py srv_reader
	cp -R srv_persistor/monedas_pb2_grpc.py srv_reader
	cp -R srv_persistor/monedas_pb2.pyi srv_reader