require 'march_hare'


connection = MarchHare.connect(:host => 'rabbit')
channel = connection.create_channel
channel.prefetch = 10

exchange = channel.exchange('test', :type => :direct)

queue = channel.queue('hello.world')
queue.bind(exchange, :routing_key => 'xyz')
consumer = queue.build_consumer(:block => true) do |headers, msg|
  puts msg
  headers.ack
  consumer.cancel if msg == "POISON!"
end
queue.subscribe_with(consumer, :manual_ack => true)

puts "Disconnecting now..."