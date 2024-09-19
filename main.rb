require_relative 'student'

def add_student
  puts "|ADD STUDENT|"
  print "Enter Student ID:"
  add_id = gets.chomp
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

def remove_student
  print "Enter Student ID to delete:"
  destroy_student = gets.chomp

  student = Student.find(destroy_student)
  if student
    if student.destroy
      puts "Student destroyed successfully"
    else
      puts "Failed to destroy from the record."
    end
  else
    puts "Student not found."
  end
end

def quit_program
  puts "Exiting..."
  exit
end

def display_menu
  puts "[a] Add a Student"
  puts "[d] Delete a Student"
  puts "[e] Exit Program"
  print "Enter an Action to do: "
end

choice = nil
while choice != 'e'
  display_menu
  choice = gets.chomp.downcase
  case choice
  when 'a'
    add_student
  when 'd'
    remove_student
  when 'e'
    quit_program
  else
    puts "Invalid choice. Enter 'a', 'd', 'e'."
  end
end