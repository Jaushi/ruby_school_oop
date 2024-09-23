class StudenSubject
    attr_accessor :id, :student_id, :subject_id, :deleted_at
    @@record = []
  
    def initialize(id, course_id, subject_id, deleted_at = nil)
      @id = id
      @course_id = course_id
      @subject_id = subject_id
      @deleted_at = deleted_at
    end
  
    def save
      @@record << self
    end
  
    def destroy
      @deleted_at = Time.now
    end
  
    def display
      "#{@id}: #{@course_id}, #{@subject_id}"
    end
  
    def self.all
      @@record.select { |course| course.deleted_at.nil? }
    end
  
    def self.find(id)
      @@record.detect { |course| course.id == id && course.deleted_at.nil? }
    end
  end
  