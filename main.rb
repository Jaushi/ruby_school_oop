require_relative 'student'
require_relative 'course'
require_relative 'subject'
require_relative 'teacher'

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
  puts "Available Courses: "
  Course.all.each { |course| puts "ID: #{course.id}, Name: #{course.name}" }
  print "Enter Course ID for the student: "
  add_course_id = gets.chomp.to_i
  student = Student.new(add_id, add_name, add_birth_date, add_email, add_phone_number, add_course_id)
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

def edit_student
  print "Enter Student ID to edit: "
  edit_id = gets.chomp.to_i

  student = Student.find(edit_id)
  if student
    print "Enter new Student Name (current: #{student.name}): "
    student.name = gets.chomp
    print "Enter new Student Birth date 'mm/dd/yy' (current: #{student.birth_date}): "
    student.birth_date = gets.chomp
    print "Enter new Student Email (current: #{student.email}): "
    student.email = gets.chomp
    print "Enter new Student Phone Number (current: #{student.phone_number}): "
    student.phone_number = gets.chomp
    student.save
    puts "Student updated successfully!"
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

def display_course
  print "Enter Course ID to display: "
  course_id = gets.chomp.to_i
  course = Course.find(course_id)
  
  if course
    puts "Course Details:"
    puts "ID: #{course.id}, Name: #{course.name}"
    puts "Subjects in this Course:"
    course.subjects.each { |subject| puts "ID: #{subject.id}, Name: #{subject.name}" }
  else
    puts "Course not found."
  end
end

def add_subject_to_course
  puts "Available Courses: "
  Course.all.each { |course| puts "ID: #{course.id}, Name: #{course.name}" }
  
  print "Enter Course ID to add subjects: "
  course_id = gets.chomp.to_i
  course = Course.find(course_id)
  
  if course
    puts "Available Subjects:"
    Subject.all.each { |subject| puts "ID: #{subject.id}, Name: #{subject.name}" }
    
    print "Enter Subject ID to add to the course: "
    subject_id = gets.chomp.to_i
    subject = Subject.find(subject_id)
    
    if subject
      course.add_subject(subject)
      course.save
      puts "Subject #{subject.name} added to course #{course.name}."
    else
      puts "Subject not found."
    end
  else
    puts "Course not found."
  end
end

def edit_course
  print "Enter Course ID to edit: "
  edit_id = gets.chomp.to_i
  course = Course.find(edit_id)
  if course
    print "Enter new Course Name (current: #{course.name}): "
    course.name = gets.chomp
    course.save
  else
    puts "Course not found."
  end
end

def remove_subject_course
  print "Enter Course ID to remove subjects: "
  course_id = gets.chomp.to_i
  course = Course.find(course_id)
  
  if course
    if course.subjects.empty?
      puts "No subjects assigned to this course."
    else
      puts "Subjects in this Course:"
      course.subjects.each { |subject| puts "ID: #{subject.id}, Name: #{subject.name}" }
      
      print "Enter Subject ID to remove from the course: "
      subject_id = gets.chomp.to_i
      subject = course.subjects.find { |s| s.id == subject_id }
      
      if subject
        course.remove_subject(subject)
        course.save
        puts "Subject #{subject.name} removed from course #{course.name}."
      else
        puts "Subject not found in this course."
      end
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

def edit_subject
  print "Enter Subject ID to edit: "
  edit_id = gets.chomp.to_i
  subject = Subject.find(edit_id)
  if subject
    print "Enter new Subject Name (current: #{subject.name}): "
    subject.name = gets.chomp
    subject.save
  else
    puts "Subject not found."
  end
end

def add_teacher
  puts "|ADD TEACHER|"
  add_id = Teacher.all.size + 1
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

def edit_teacher
  print "Enter Teacher ID to edit: "
  edit_id = gets.chomp.to_i

  teacher = Teacher.find(edit_id)
  if teacher
    print "Enter new Teacher Name (current: #{teacher.name}): "
    teacher.name = gets.chomp
    print "Enter new Teacher Birth date 'mm/dd/yy' (current: #{teacher.birth_date}): "
    teacher.birth_date = gets.chomp
    print "Enter new Teacher Email (current: #{teacher.email}): "
    teacher.email = gets.chomp
    print "Enter new Teacher Phone Number (current: #{teacher.phone_number}): "
    teacher.phone_number = gets.chomp
    print "Enter new Teacher Department (current: #{teacher.department}): "
    teacher.department = gets.chomp
    teacher.save
  else
    puts "Teacher not found."
  end
end

def quit_program
  puts "Exiting..."
  exit
end

def student_management
  choice = nil
  while choice != 0
    puts "[1] Add Student"
    puts "[2] Delete Student"
    puts "[3] Display Record"
    puts "[4] Edit Record"
    puts "[0] Back to school management"
    print "Enter an Action to do: "
    choice = gets.chomp.to_i

    case choice
    when 1
      add_student
    when 2
      remove_student
    when 3
      Student.all.each { |student| puts student.display }
    when 4
      edit_student
    when 0
      return
    else
      puts "Invalid choice. Enter 1, 2, 3."
    end
  end
end

def course_management
  choice = nil
  while choice != 0
    puts "[1] Add Course"
    puts "[2] Delete Course"
    puts "[3] Display Record"
    puts "[4] Edit Record"
    puts "[5] Add Subjects to a Course"
    puts "[6] Remove Subjects from a Course"
    puts "[0] Back to school management"
    print "Enter an Action to do: "
    choice = gets.chomp.to_i

    case choice
    when 1
      add_course
    when 2
      remove_course
    when 3
      display_course
    when 4
      edit_course
    when 5
      add_subject_to_course
    when 6 
      remove_subject_course
    when 0
      return
    else
      puts "Invalid choice. Enter 1, 2, 3."
    end
  end
end

def subject_management
  choice = nil
  while choice != 0
    puts "[1] Add Subject"
    puts "[2] Delete Subject"
    puts "[3] Display Record"
    puts "[4] Edit Record"
    puts "[0] Back to school management"
    print "Enter an Action to do: "
    choice = gets.chomp.to_i

    case choice
    when 1
      add_subject
    when 2
      remove_subject
    when 3
      Subject.all.each { |subject| puts subject.display }
    when 4
      edit_subject
    when 0
      return
    else
      puts "Invalid choice. Enter 1, 2, 3."
    end
  end
end

def teacher_management
  choice = nil
  while choice != 0
    puts "[1] Add Teacher"
    puts "[2] Delete Teacher"
    puts "[3] Display Record"
    puts "[4] Edit Record"
    puts "[0] Back to school management"
    print "Enter an Action to do: "
    choice = gets.chomp.to_i

    case choice
    when 1
      add_teacher
    when 2
      remove_teacher
    when 3
      Teacher.all.each { |teacher| puts teacher.display }
    when 4
      edit_teacher
    when 0
      return
    else
      puts "Invalid choice. Enter 1, 2, 3."
    end
  end
end

program_choice = nil
while program_choice != 0
  puts "[1] Student Management"
  puts "[2] Course Management"
  puts "[3] Subject Management"
  puts "[4] Teacher Management"
  puts "[0] Exit Program"
  print "Choose to Access the program: "
  program_choice = gets.chomp.to_i

  case program_choice
  when 1
    student_management
  when 2
    course_management
  when 3
    subject_management
  when 4
    teacher_management
  when 0
    quit_program
  else
    puts "Invalid choice. Enter 1, 2, 3, 4, 0."
  end
end