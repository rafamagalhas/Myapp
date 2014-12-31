class Question
	include Mongoid::Document
	include Mongoid::Timestamps
	field :title, 	type: String
	field :content, type: String
	field :hits,	type: Integer

	belongs_to :user
	has_many :answers

	validates :title, :content, :user, :presence => true
	validates :title, :content, :length => {:in => 2..140}

	scope :my_questions, -> { desc(:created_at).limit(3)}

	def hit
		if self.hits == nil
			self.hits = 0
		end
		self.hits+=1
		save
	end
end