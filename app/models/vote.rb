class Vote
	include Mongoid::Document
	field :up, type: Boolean

	belongs_to :user
	belongs_to :answer

	validates :up, :user, :answer, :presence => true
end