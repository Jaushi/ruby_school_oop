class Teacher
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :department, :deleted_at
  @@record = []

  def initialize(id, name, birth_date, email, phone_number, department, deleted_at = nil)
    @id = id
    @name = name
    @birth_date = birth_date
    @email = email
    @phone_number = phone_number
    @department = department
    @deleted_at = deleted_at
  end

  def save
    existing_record = self.class.find(@id)
    if existing_record
      existing_record.name = @name
      existing_record.birth_date = @birth_date
      existing_record.email = @email
      existing_record.phone_number = @phone_number
      existing_record.department = @department
      existing_record.deleted_at = @deleted_at
      puts "#{self.class} updated successfully!"
    else
      @@record << self
      puts "#{self.class} created successfully!"
    end
  end

  def destroy
    @deleted_at = Time.now
  end

  def display
    print "Student ID #{@id}: #{@name}, #{@birth_date},#{@email}, #{@phone_number}, #{@department}"
  end

  def self.all
    @@record.select { |teacher| Ateacher.deleted_at.nil? }
  end

  def self.find(id)
    @@record.detect { |teacher| teacher.id == id && teacher.deleted_at.nil? }
  end

  def self.find_by_email(email)
    @@record.detect { |teacher| teacher.email == email }
  end
end