import grpc 
import monedas_pb2
import monedas_pb2_grpc


def serve():
	#ESTE ES EL CONSUMER
	#Aqui se debe levantar la conexion
	with grpc.insecure_channel('srv_persistor:50051') as channel:
		stub = monedas_pb2_grpc.MonedasStub(channel)
		request = monedas_pb2.EmptyMessage()
		response= stub.PingMonedas(request)
		print("Recived: ", response.ack)


if __name__ == "__main__":
	serve()
