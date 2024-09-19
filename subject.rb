class Subject
  attr_accessor :id, :name, :deleted_at
  @@record = []

  def initialize(id, name, deleted_at = nil)
    @id = id
    @name = name
    @deleted_at = deleted_at
  end

  def save
    @@record. << self
  end

  def destroy
    deleted_at = Time.now
  end

  def display
    print "#{@id}: #{@name}"
  end

  def self.all
    @@record.select { |subject| subject.deleted_at.nil? }
  end

  def self.find(id)
    @@record.detect { |subject| subject.id == id && subject.deleted_at.nil? }
  end
end