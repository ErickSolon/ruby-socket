require 'socket'

Socket.open(:INET, :STREAM) do |sc|
  sc.bind(Addrinfo.tcp('127.0.0.1', 4444))

  sc.listen(5)

  puts 'escutando na porta 4444'

  while true

    cliente_conexao, = sc.accept

    Thread.new(cliente_conexao) do |th|
      while true
        puts th.recv(1024)
        File.open('./log.txt', 'a') { |escrever| escrever.write(th.recv(1024) + "\n") }
      end
    end

  end
end
