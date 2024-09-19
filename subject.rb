class Subject
  attr_accessor :id, :name
  @@record = []

  def initialize(id, name)
    @id = id
    @name = name
  end

  def save
    @@record. << self
  end

  def destroy
    @@record.delete(self)
  end

  def display
    puts "#{@id}: #{@name}"
  end

  def self.all
    @@record
  end

  def self.find(id)
    @@record.detect { |subject| subject.id == id }
  end
end