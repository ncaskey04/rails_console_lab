# class Student < ActiveRecord::Base
# 	validates_uniqueness_of :last_name
#   validates_length_of :first_name, :minimum => 5
#   validates_length_of :last_name, :minimum => 5
#   validates_presence_of :first_name
#   validates_presence_of :last_name
# end

class Student < ActiveRecord::Base
  validates :first_name, :last_name, 
              :length => {:minimum => 5},
              :presence => true,
              :uniqueness => true
end
