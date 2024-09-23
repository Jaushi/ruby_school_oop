class Course
  attr_accessor :id, :name, :deleted_at
  @@record = []

  def initialize(id, name, deleted_at = nil)
    @id = id
    @name = name
    @deleted_at = deleted_at
  end

  def save
    existing_record = self.class.find(@id)
    if existing_record
      existing_record.name = @name
      existing_record.deleted_at = @deleted_at
      puts "Course updated successfully!"
    else
      @@record << self
      puts "Course created successfully!"
    end
  end

  def destroy
    @deleted_at = Time.now
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