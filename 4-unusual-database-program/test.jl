using Sockets

socket = Sockets.UDPSocket()
send(socket,  ip"127.0.0.1", 5000, "foo=bar")
send(socket,  ip"127.0.0.1", 5000, "foo=bar=baz")
send(socket,  ip"127.0.0.1", 5000, "foo=")
sleep(1)
send(socket,  ip"127.0.0.1", 5000, "foo===")
send(socket,  ip"127.0.0.1", 5000, "=foo")
println("insertions finished")

sleep(1)
println("retrive foo")
send(socket,  ip"127.0.0.1", 5000, "foo")
println(String(recv(socket)))
println("retrive empty")
send(socket,  ip"127.0.0.1", 5000, "")
println(String(recv(socket)))
println("attempt to change version")
send(socket,  ip"127.0.0.1", 5000, "version=hackerman")
println("receive version")
send(socket,  ip"127.0.0.1", 5000, "version")
println(String(recv(socket)))
close(socket)