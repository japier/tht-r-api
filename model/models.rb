require 'data_mapper'

DataMapper.setup(:default, "mysql://root:@localhost/tht_res")

class Cliente
  include DataMapper::Resource
  property :id,			Serial 
  property :nombre,		String, :length => 42
  property :s_nombre,		String
  property :ape, 			String
  property :s_ape,		String
  property :email,		String
  property :tel, 			Decimal
  property :fena,			DateTime
end
class Login
  include DataMapper::Resource
  property :id, Serial
  property :fk_usr, Integer
  property :passwd, String, :length => 32
  property :nickname, String, :length => 15
  property :reg_date, DateTime
  property :last_ent, DateTime
end
class Comentario
  include DataMapper::Resource
  property :id, Serial
  property :fk_user, Integer
  property :fk_mesa, Integer
  property :fk_res, Integer
  property :comentario, Text
  property :coment_date, DateTime
end
class Mesa
  include DataMapper::Resource
  property :id, Serial
  property :zona, Integer
  property :no_per, Integer
  property :numero, Integer
end
class Personal
  include DataMapper::Resource
  property :id, Serial
  property :nombre, String
  property :ape, String
  property :s_ape, String
  property :tipo, Integer
  property :direccion, String
  property :tel, Decimal 
  property :email, String
  property :fec_nac, Date
end 
# class Category
# 	include DataMapper::Resource
# 	property :id,			Serial
# 	property :name, 		String, :required => true
# 	property :complete_at, 	DateTime
# 	property :hash_category, String, :required => true, :key => true
# end

# class Photo
# 	include DataMapper::Resource
# 	property :id, 			Serial
# 	property :name, 		String, :required => true
# 	property :uri, 			String, :required => true
# 	property :fk_category,	Integer, :required => true
# 	property :created_at,	DateTime # end DataMapper.finalize
# 	
