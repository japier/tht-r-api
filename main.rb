require 'sinatra'
require 'data_mapper'
require 'json'
require './model/models'

before do
  headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
  headers['Access-Control-Allow-Origin'] = 'http://localhost'
  headers['Access-Control-Allow-Headers'] = 'accept, authorization, origin'
  headers['Access-Control-Allow-Credentials'] = 'true'
end
def check_signature signature
  signature == "ot_35"
end
get '/' do
	"Welcome to Sorgocom"
end
get '/login/:user' do
  return "Bad signature" unless params['firma'] == "ot_35"
  "Login user"
end
post '/login' do
  return "Bad signature" unless params['firma'] == "ot_35"
  begin 
    Login.create(:fk_usr => params['fk_usr'], :passwd => params['passwd'], :nickname => params['nickname'])
  rescue
    "Error on create user"
  end
  
end
get '/cliente/' do 
	@categories = Cliente.all
	@categories.to_json
end
get '/clientes/:id_category' do
	@category = Cliente.first(:id => params[:id_category])
	@category.to_json
end
