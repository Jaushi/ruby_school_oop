class Student < Person
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :deleted_at, :course_id
  @@record = []

  def initialize(id, name, birth_date, email, phone_number, course_id = nil, deleted_at = nil)
    @id = id
    @name = name
    @birth_date = birth_date
    @email = email
    @phone_number = phone_number
    @course_id = course_id
    @deleted_at = deleted_at
  end

  def save
    existing_record = self.class.find(@id)
    if existing_record
      existing_record.name = @name
      existing_record.birth_date = @birth_date
      existing_record.email = @email
      existing_record.phone_number = @phone_number
      existing_record.course_id = @course_id
      existing_record.deleted_at = @deleted_at
      puts "Student updated successfully!"
    else
      @@record << self
      puts "Student created successfully!"
    end
  end

  def destroy
    @deleted_at = Time.now
  end

  def display
    course_name = Course.find(@course_id)&.name || "No Course Assigned"
    "ID: #{@id}, Name: #{@name}, Birth Date: #{@birth_date}, Email: #{@email}, Phone: #{@phone_number}, Course: #{course_name}"
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

  def subjects
    student_subjects = StudentSubject.find_by_student_id(@id)
    student_subjects.map { |ss| Subject.find(ss.subject_id) }
  end
end