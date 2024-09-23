class CourseSubject
  attr_accessor :id, :course_id, :subject_id, :deleted_at
  @@record = []

  def initialize(id, name, deleted_at = nil)
    @id = id
    @course_id = course_id
    @course_id = course_id
    @deleted_at = deleted_at
  end

  def save
    existing_record = self.class.find(@id)
    if existing_record
      existing_record.course_id = @course_id
      existing_record.subject_id = @subject_id
      existing_record.deleted_at = @deleted_at
      puts "Course Subject updated successfully!"
    else
      @@record << self
      puts "Course Subject created successfully!"
    end
  end

  def destroy
    @@record
  end

  def display
    "#{@id}: #{@name}"
  end

  def self.all
    @@record.select { |course| course.deleted_at.nil? }
  end

  def self.find(id)
    @@record.detect { |course| course.id == id && course.deleted_at.nil? }
  end
end