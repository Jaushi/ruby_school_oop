class Teacher
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :department
  @@record = []

  def initialize(id, name, birth_date, email, phone_number, department)
    @id = id
    @name = name
    @birth_date = birth_date
    @email = email
    @phone_number = phone_number
    @department = department
  end

  def save
    @@record.prepend(self)
  end

  def destroy
    @@record.delete(self)
  end

  def display
    puts "Student ID #{@id}: #{@name}, #{@birth_date},#{@email}, #{@phone_number}, #{@department}"
  end

  def self.all
    @@record
  end

  def self.find(id)
    @@record.detect { |teacher| teacher.id == id }
  end

  def self.find_by_email(email)
    @@record.detect { |teacher| teacher.email == email }
  end
end