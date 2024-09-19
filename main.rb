require_relative 'student'

def add_student
  puts "ADD STUDENT:"
  add_id = Student.all.size + 1
  print "Enter Student Name:"
  add_name = gets.chomp
  print "Enter Student Birth date 'mm/dd/yy':"
  add_birth_date = gets.chomp
  print "Enter Student Email:"
  add_email = gets.chomp
  print "Enter Student Phone Number:"
  add_phone_number = gets.chomp

  student = Student.new(add_id, add_name, add_birth_date, add_email, add_phone_number)
  student.save

  if Student.find(add_id)
    puts "Student added successfully!"
    puts student.display
  else
    puts "Failed to add student."
  end
end

add_student
