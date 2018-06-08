# import socket module
import socket

serverSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
# Prepare a server socket
serverSocket.bind(('0.0.0.0', 6789))  # 将TCP欢迎套接字绑定到指定端口
serverSocket.listen(10)  # 最大连接数为10

while True:
    # Establish the connection
    print('Ready to serve...')
    connectionSocket, addr = serverSocket.accept()  # 接收到客户连接请求后，建立新的TCP连接套接字
    try:
        message = connectionSocket.recv(1024)  # 获取客户发送的报文
        message_split = message.split()
        if len(message_split) == 0:
            continue
        print(message_split)
        filename = message.split()[1]
        print(filename)
        f = open(filename[1:])
        outputdata = f.read()
        # Send one HTTP header line into socket
        header = 'HTTP/1.1 200 OK\nConnection: close\nContent-Type: text/html\nContent-Length: %d\n\n' % (
            len(outputdata))
        connectionSocket.send(header.encode())

        # Send the content of the requested file to the client
        for i in range(0, len(outputdata)):
            connectionSocket.send(outputdata[i].encode())
        connectionSocket.close()
    except IOError:
        # Send response message for file not found
        header = 'HTTP/1.1 404 NOT FOUND\nConnection: close\n'
        try:
            connectionSocket.send(header.encode())
        except Exception:
            pass
        # Close client socket
        connectionSocket.close()
    except Exception:
        pass

serverSocket.close()


