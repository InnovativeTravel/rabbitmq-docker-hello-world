require 'march_hare'


connection = MarchHare.connect(:host => 'rabbit')
channel = connection.create_channel
channel.prefetch = 10

exchange = channel.exchange('test', :type => :direct)

queue = channel.queue('hello.world')
queue.bind(exchange, :routing_key => 'xyz')
queue.purge

100.times do |i|
  exchange.publish("hello world! #{i}", :routing_key => 'xyz')
end

exchange.publish("POISON!", :routing_key => 'xyz')