def interactive_menu
  @students = []
  loop do
  print_menu
  process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the sudents"
  puts "2. Show the students"
  puts "3. Save to directory.csv"
  puts "4. Load from directory.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    print(@students)
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

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return three times"
  @students = []
  enter_info
  while !@name.empty? do
    @students << {name: @name, cohort: @cohort}
    puts "Now we have #{@students.count} #{plural(@students)}"
    enter_info
  end
  @students
end

def print(names)
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
  names.each_with_index do |x, index|
    puts "#{index}. #{x[:name]} (#{x[:cohort]} cohort)".center(100)
  end
  puts "Overall, we have #{names.count} great #{plural(@students)}".center(100)
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

def load_students(filename = "students.csv") #load_students will load from students.csv by default, but given an argument it will load from a given file
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first# first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def enter_info
  puts "Enter name"
  @name = STDIN.gets.chomp
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

try_load_students
interactive_menu
