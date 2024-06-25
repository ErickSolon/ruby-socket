require 'socket'

Socket.open(:INET, :STREAM) do |sc|
  sc.bind(Addrinfo.tcp('127.0.0.1', 4444))

  sc.listen(5)

  puts 'escutando na porta 4444'

  while true

    cliente_conexao, _ = sc.accept

    Thread.new(cliente_conexao) do |th|
      puts th.recv(1024) while true
      th.close
      cliente_conexao.close
    end

  end
end
