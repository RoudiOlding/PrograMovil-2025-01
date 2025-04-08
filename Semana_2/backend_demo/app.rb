require 'sinatra'
set :public_folder, 'public'
set :bind, '0.0.0.0' #
set :port, 4567 #

get '/' do
    'Attack on Titan >> Hellsing'
end