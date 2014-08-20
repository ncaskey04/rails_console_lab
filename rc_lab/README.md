Console Lab

For this lab, we'd like you to strengthen your Rails console skills. This lab is going to be very familiar to the SQL lab, where we'll ask you to create a model and then write out the console commands you would use to execute these queries

To Start

1. Create a model called Student, that has a first_name, last_name and age

  # rake db:create
  # rails generate model Student first_name:string last_name:string age:integer

2. Don't forget to run your migrations

  # rake db:migrate

Tasks to create

1. Using the new/save syntax, create a student, first and last name and an age

  # student = Student.new
  # student.first_name = "Rocko"
  # student.age = 45

2. Save the student to the database

  # student.save

3. Using the find/set/save syntax update the student's first name to taco

  # student = Student.find_by_id(1)
  # student.first_name = "Taco"
  # student.save

4. Delete the student (where first_name is taco)

  # student = Student.find_by_name("Taco")
  # student.destroy

5. Validate that every Student's last name is unique
  
  # class Student < ActiveRecord::Base
  #   validates :last_name, :uniqueness => true
  # end

6. Validate that every Student has a first and last name that is longer than  4 characters

  # class Student < ActiveRecord::Base
  #   validates_uniqueness_of :last_name
  #   validates :first_name, :last_name, :length => {:minimum => 5}
  # end

7. Validate that every first and last name cannot be empty

  # validates :first_name, :last_name, :presence => true

8. Combine all of these individual validations into one validation (using validate and a hash)

   # class Student < ActiveRecord::Base
      validates :first_name, 
                  length: {:minimum => 5},
                  presence: true
      
      validates :last_name,
                  length: {:minimum => 5},
                  presence: true,
                  uniqueness: true
      end

9. Using the create syntax create a student named John Doe who is 33 years old

  # student = Student.create(:first_name => "John", :last_name => "Doe", :age => 33)

10. Show if this new student entry is valid

  # student.valid? (would return false because it fails length validator)

11. Show the number of errors for this student instance

  # student.errors.size

12. In one command, Change John Doe's name to Jonathan Doesmith

  # studentA.update_attributes(:first_name => "Jonathan", :last_name => "Doesmith")

13. Clear the errors array

  # student.errors.clear

14. Save Jonathan Doesmith

  # student = Student.new
  # student.save

15. Find all of the Students

  # Student.all

16. Find the student with an ID of 128 and if it does not exist, make sure it returns nil and not an error

  # Student.find_by_id(128)

17. Find the first student in the table

  # Student.first

18. Find the last student in the table

  # Student.last

19. Find the student with the last name of Doesmith

  # Student.find_by_last_name("Doesmith")

20. Find all of the students and limit the search to 5 students, starting with the 2nd student and finally, order the students in alphabetical order

  # Student.offset(2).limit(5).order(last_name: :asc)

21. Delete Jonathan Doesmith

  # Student.find_by_last_name("Doesmith").destroy

Bonus

1. Use the validates_format_of and regex to only validate names that consist of letters (no numbers or symbols) and start with a capital letter

  # validates_format_of :first_name, :last_name, :with => /\A[A-Z][a-zA-Z]*\z/, :on => :create

2. Write a custom validation to ensure that no one named Delmer Reed, Tim Licata, Anil Bridgpal or Elie Schoppik is included in the students table

  # INSTRUCTORS = [{:first_name => "Delmer", :last_name => "Reed"}, 
                   {:first_name => "Tim", :last_name => "Licata"}, 
                   {:first_name => "Anil", :last_name => "Bridgpal"}, 
                   {:first_name => "Elie", :last_name => "Schoppik"}]

    validate :no_instructors

    def no_instructors
      INSTRUCTORS.each do |teacher|
      if teacher[:first_name] == first_name and teach[:last_name] == last_name
        errors.add(:first_name, :last_name, "This is a restricted instructor name")
      end
    end
