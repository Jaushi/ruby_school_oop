require_relative 'student'
require_relative 'course'

def add_student
  puts "|ADD STUDENT|"
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

def remove_student
  print "Enter Student ID to delete:"
  destroy_student = gets.chomp.to_i

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

def add_course
  puts "|ADD COURSE|"
  add_course_id = Course.all.size + 1
  print "Enter Course Name:"
  add_course_name = gets.chomp
  course = Course.new(add_course_id, add_course_name)
  course.save

  if Course.find(add_course_id)
    puts "Course added successfully!"
    puts course.display
  else
    puts "Failed to add student."
  end
end

def remove_course
  print "Enter Course ID to delete:"
  destroy_course = gets.chomp.to_i

  student = Course.find(destroy_course)
  if student
    if student.destroy
      puts "Course destroyed successfully!"
    else
      puts "Failed to destroy from the record."
    end
  else
    puts "Course not found."
  end
end

def quit_program
  puts "Exiting..."
  exit
end

def student_management
  puts "[1] Add Student"
  puts "[2] Delete Student"
  print "Enter an Action to do: "
  choice = gets.chomp.to_i

  if choice == 1
    add_student
  end
  if choice == 2
    remove_student
  end
end

def course_management
  puts "[1] Add Course"
  puts "[2] Delete Course"
  print "Enter an Action to do: "
  choice = gets.chomp.to_i

  if choice == 1
    add_course
  end
  if choice == 2
    remove_course
  end
end

program_choice = nil
while program_choice != 0
  puts "[1] Student Management"
  puts "[2] Course Management"
  puts "[0] Exit Program"
  print "Enter a Program to Access: "
  program_choice = gets.chomp.to_i

  case program_choice
  when 1
    student_management
  when 2
    course_management
  when 0
    quit_program
  else
    puts "Invalid choice. Enter 1, 2, 0."
  end
end