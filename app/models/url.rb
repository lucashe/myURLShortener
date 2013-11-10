class Url < ActiveRecord::Base
	  validates :longURL, :uniqueness => true
	  
	  has_many :visits



end
