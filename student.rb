class Student
  attr_accessor :id, :name, :birth_date, :email, :phone_number
  @@record = []

  def initialize(id, name, birth_date, email, phone_number)
    @id = id
    @name = name
    @birth_date = birth_date
    @email = email
    @phone_number = phone_number
  end

  def save
    @@record << self
  end

  def destroy
    @@record.delete(self)
  end

  def display
    puts "Student ID #{@id}: #{@name}, #{@birth_date},#{@email}, #{@phone_number}"
  end

  def self.all
    @@record
  end

  def self.find(id)
    @@record.detect { |student| student.id == id }
  end

  def self.find_by_email(email)
    @@record.detect { |student| student.email == email }
  end
end