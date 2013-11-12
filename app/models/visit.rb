# == Schema Information
#
# Table name: visits
#
#  id         :integer          not null, primary key
#  ip         :string(255)
#  os         :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Visit < ActiveRecord::Base
	belongs_to :url

end
