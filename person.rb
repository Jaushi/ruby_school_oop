class Person
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :deleted_at

  def initialize(id, name, birth_date, email, phone_number, deleted_at = nil)
    @id = id
    @name = name
    @birth_date = birth_date
    @email = email
    @phone_number = phone_number
    @deleted_at = deleted_at
  end

  def display
    "ID: #{@id}, Name: #{@name}, Birth Date: #{@birth_date}, Email: #{@email}, Phone Number: #{@phone_number}"
  end
  
  def self.all
    @@record.select { |person| person.deleted_at.nil? }
  end

  def self.find(id)
    @@record.detect { |person| person.id == id && person.deleted_at.nil? }
  end

  def self.find_by_email(email)
    @@record.detect { |person| person.email == email }
  end
end