ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "pokemon"
)

if defined? Sinatra
	after do
	  ActiveRecord::Base.connection.close
	end
end
