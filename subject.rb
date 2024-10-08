class Subject
  attr_accessor :id, :name, :deleted_at
  @@record = []

  def initialize(id, name, deleted_at = nil)
    @id = id
    @name = name
    @deleted_at = deleted_at
    @@record << self
  end

  def save
    existing_record = self.class.find(@id)
    if existing_record
      existing_record.name = @name
      existing_record.deleted_at = @deleted_at
      puts "Subject updated successfully!"
    else
      @@record << self
      puts "Subject created successfully!"
    end
  end

  def destroy
    @deleted_at = Time.now
  end

  def display
    puts "#{@id}: #{@name}"
  end

  def self.all
    @@record.select { |subject| subject.deleted_at.nil? }
  end

  def self.find(id)
    @@record.detect { |subject| subject.id == id && subject.deleted_at.nil? }
  end
end