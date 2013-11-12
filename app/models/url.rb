# == Schema Information
#
# Table name: urls
#
#  id         :integer          not null, primary key
#  longURL    :string(255)
#  shortURL   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Url < ActiveRecord::Base
	  validates :longURL, :uniqueness => true
	  
	  has_many :visits



end
