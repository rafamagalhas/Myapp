class User
	include Mongoid::Document
	field :name,  		type: String
	field :email, 		type: String
	field :image_url,	type: String

	has_many :questions
	has_many :answers

	validates :name, :email, :presence => true
	def self.find_or_create_from_auth_hash(auth_hash)
		begin
			user = User.find_by(:email => auth_hash['info']['email'])	
		rescue Exception => e
			user = User.new
			user.email = auth_hash['info']['email']
			user.name = auth_hash['info']['name']
			user.image_url = auth_hash['info']['image']
			user.save
		end
		return user		
	end
end