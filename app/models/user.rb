class User
	include Mongoid::Document
	include Mongoid::Timestamps
	
	field :name,  		type: String
	field :email, 		type: String
	field :birthday,    type: Date
	field :use_provider_avatar, type: Boolean, default: true
	field :provider_image_url, 	type: String

    attr_accessor :avatar
    attr_accessor :secret_tag

	belongs_to :skill_level
	belongs_to :notification_level
	has_many :questions
	has_many :answers

	validates :name, :email, :presence => true
	validates :email, :uniqueness => true

	def self.find_or_create_from_auth_hash(auth_hash)
		begin
			user = User.find_by(:email => auth_hash['info']['email'])
			user.provider_image_url = auth_hash['info']['image']
			user.save	
		rescue Exception => e
			user = User.new
			user.email = auth_hash['info']['email']
			user.name = auth_hash['info']['name']
			user.provider_image_url = auth_hash['info']['image']
			user.save
		end
		return user		
	end

	def user_folder
		"public/files/#{self.id.to_s}"
	end

	def image_url
		if self.use_provider_avatar
			return self.provider_image_url
		else
			return "/files/#{self.id.to_s}/avatar"
		end
	end

	def vote_balance
		balance = 0
		self.answers.each do |a|
			balance+=a.vote_balance
		end
		return balance
	end

	def reputation
		rep = 0
		rep += rep_from_votes
		rep += rep_from_questions
		rep
	end

	private
	def rep_from_votes
		balance = self.vote_balance
		if balance <= 0
			return 0
		else
			balance * 5
		end
	end

	def rep_from_questions
		balance = self.questions.count
		self.questions.each do |q|
		  balance += 9 if q.answers.count > 15
		  balance += 6 if q.answers.count > 10
		  balance += 4 if q.answers.count > 5
		end
		balance
	end
end