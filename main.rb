require_relative 'student'
require_relative 'course'
require_relative 'subject'
require_relative 'teacher'

def clear_terminal
  system("clear") || system("cls")
end
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
      puts "Student destroyed successfully!"
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

def add_subject
  puts "|ADD SUBJECT|"
  add_subject_id = Subject.all.size + 1
  print "Enter Subject Name:"
  add_subject_name = gets.chomp
  subject = Subject.new(add_subject_id, add_subject_name)
  subject.save

  if Subject.find(add_subject_id)
    puts "Subject added successfully!"
    puts subject.display
  else
    puts "Failed to add student."
  end
end

def remove_subject
  print "Enter Course ID to delete:"
  destroy_subject = gets.chomp.to_i

  student = Subject.find(destroy_subject)
  if student
    if student.destroy
      puts "Subject destroyed successfully!"
    else
      puts "Failed to destroy from the record."
    end
  else
    puts "Subject not found."
  end
end

def add_teacher
  puts "|ADD TEACHER|"
  add_id = Student.all.size + 1
  print "Enter Teacher Name:"
  add_name = gets.chomp
  print "Enter Teacher Birth date 'mm/dd/yy':"
  add_birth_date = gets.chomp
  print "Enter Teacher Email:"
  add_email = gets.chomp
  print "Enter Teacher Phone Number:"
  add_phone_number = gets.chomp
  print "Enter Teacher Department:"
  add_department = gets.chomp

  teacher = Teacher.new(add_id, add_name, add_birth_date, add_email, add_phone_number, add_department)
  teacher.save

  if Teacher.find(add_id)
    puts "Teacher added successfully!"
    puts teacher.display
  else
    puts "Failed to add teacher."
  end
end

def remove_teacher
  print "Enter Teacher ID to delete:"
  destroy_teacher = gets.chomp.to_i

  teacher = Teacher.find(destroy_teacher)
  if teacher
    if teacher.destroy
      puts "Teacher destroyed successfully!"
    else
      puts "Failed to destroy from the record."
    end
  else
    puts "Teacher not found."
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

def subject_management
  puts "[1] Add Subject"
  puts "[2] Delete Subject"
  print "Enter an Action to do: "
  choice = gets.chomp.to_i

  if choice == 1
    add_subject
  end
  if choice == 2
    remove_subject
  end
end

def teacher_management
  puts "[1] Add Teacher"
  puts "[2] Delete Teacher"
  print "Enter an Action to do: "
  choice = gets.chomp.to_i

  if choice == 1
    add_teacher
  end
  if choice == 2
    remove_teacher
  end
end

program_choice = nil
while program_choice != 0
  puts "[1] Student Management"
  puts "[2] Course Management"
  puts "[3] Subject Management"
  puts "[4] Teacher Management"
  puts "[0] Exit Program"
  print "Enter a Program to Access: "
  program_choice = gets.chomp.to_i

  case program_choice
  when 1
    student_management
    clear_terminal
  when 2
    course_management
    clear_terminal
  when 3
    subject_management
    clear_terminal
  when 4
    teacher_management
    clear_terminal
  when 0
    quit_program
  else
    puts "Invalid choice. Enter 1, 2, 3, 4, 0."
  end
end