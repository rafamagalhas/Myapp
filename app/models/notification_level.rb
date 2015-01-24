class NotificationLevel
	include Mongoid::Document
	field :label, type: String
	has_many :users

	validates :label, presence: true
end