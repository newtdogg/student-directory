def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def save_students
  file= File.open("students.csv", "w")
    @students.each do |student|
    student_data = [student [:name], student [:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def interactive_menu
  @students = []
  loop do
  print_menu
  process(gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't understand, try again"
  end
end


def print_menu
  puts "1. Input the sudents"
  puts "2. Show the students"
  puts "3. Save to directory.csv"
  puts "4. Load from directory.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print(@students)
  print_footer(@students)
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  @students = []
  enter_info
  while !@name.empty? do
    @students << {name: @name, cohort: @cohort}
    puts "Now we have #{@students.count} #{plural(@students)}"
    enter_info
  end
  @students
end

def print_header
puts "The students of Villains Academy".center(100)
puts "-------------".center(100)
end

def print(names)
names.each_with_index do |x, index|
puts "#{index}. #{x[:name]} (#{x[:cohort]} cohort)".center(100)
end
end

def print_footer(names)
  if names.count > 1
    puts "Overall, we have #{names.count} great #{plural(@students)}".center(100)
  else
    puts "Overall, we have #{names.count} great #{plural(@students)}".center(100)
  end
end

def enter_info
  puts "Enter name"
  @name = gets.chomp
  puts "Enter cohort"
  @cohort = gets.chomp
end

def plural(names)
  if names.count > 1
    return "students"
  else
    return "student"
  end
end

interactive_menu
