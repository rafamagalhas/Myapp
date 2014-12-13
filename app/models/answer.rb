class Answer
	include Mongoid::Document
	field :content, type: String

	belongs_to :question
	belongs_to :user

	validates :content, :user, :question, :presence => true
	validates :content, :length => {:in => 2..140}
end