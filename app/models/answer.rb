class Answer
	include Mongoid::Document
	include Mongoid::Timestamps
	field :content, type: String

	belongs_to :question
	belongs_to :user
	has_many :votes

	validates :content, :user, :question, :presence => true
	validates :content, :length => {:in => 2..140}

  def vote(user,type)
    begin
      vote = Vote.find_by(:user_id => user.id.to_s, :answer_id => self)
    rescue Exception => e
      vote = Vote.new
      vote.user = user
      vote.answer = self
    end
    
    if type==:up
      vote.up=true
    else
      vote.up=false
    end
    vote.save
    return vote
  end 
  
  def vote_balance
  	balance=0
  	self.votes.each do |v|
  	  if v.up
  	    balance += 1
  	  else
  		balance -= 1
  	  end
  	end
  	return balance
  end
end
