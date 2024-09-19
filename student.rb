class Student
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :deleted_at
  @@record = []

  def initialize(id, name, birth_date, email, phone_number, deleted_at = nil)
    @id = id
    @name = name
    @birth_date = birth_date
    @email = email
    @phone_number = phone_number
    @deleted_at = deleted_at
  end

  def save
    @@record << self
  end

  def destroy
    deleted_at = Time.now
  end

  def display
    print "Student ID #{@id}: #{@name}, #{@birth_date},#{@email}, #{@phone_number}"
  end

  def self.all
    @@record.select { |student| student.deleted_at.nil? }
  end

  def self.find(id)
    @@record.detect { |student| student.id == id && student.deleted_at.nil? }
  end

  def self.find_by_email(email)
    @@record.detect { |student| student.email == email }
  end
end