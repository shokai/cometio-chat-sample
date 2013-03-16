io = Sinatra::CometIO

io.on :chat do |data, from|
  puts "#{data['name']} : #{data['message']}  (from:#{from})"
  io.push :chat, data
end

io.on :connect do |session|
  puts "new client <#{session}>"
  io.push :chat, {:name => "system", :message => "new client <#{session}>"}
  io.push :chat, {:name => "system", :message => "welcome <#{session}>"}, {:to => session}
end

io.on :disconnect do |session|
  puts "disconnect client <#{session}>"
  io.push :chat, {:name => "system", :message => "bye <#{session}>"}
end

EM::defer do
  loop do
    io.push :chat, :name => 'clock', :message => Time.now.to_s
    sleep 60
  end
end

get '/' do
  haml :index
end

get '/:source.css' do
  scss params[:source].to_sym
end
