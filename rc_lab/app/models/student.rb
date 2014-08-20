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
              :uniqueness => true,
              :format => { :with => (/[A-Za-z]\w*/) }

  FORBIDDEN_NAMES = ["Delmer Reed", "Tim Licata", "Anil Bridgpal", "Elie Schoppik"]
  validate :name_is_allowed

  def name_is_allowed
    if FORBIDDEN_NAMES.include?(studentName)
      errors.add(:student, "This is a restricted name")
    end
  end
  
end

