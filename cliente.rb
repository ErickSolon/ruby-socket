require 'socket'

Socket.open(:INET, :STREAM) do |sc|
  sc.connect(Socket.pack_sockaddr_in(4444, '127.0.0.1'))

  begin
    while true

      puts 'envie uma mensagem: '

      sc.send(gets.chomp.to_s, 0)

      # cliente.send(ARGV[0].to_s, 0)

    end
  rescue Interrupt => e
    puts e.message
  ensure
    sc.close
  end
end
