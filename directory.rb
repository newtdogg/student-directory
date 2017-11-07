
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  puts "Enter name"
  name = gets.chomp
  puts "Enter cohort"
  cohort = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    puts "Enter name"
    name = gets.chomp
    puts "Enter cohort"
    cohort = gets.chomp
  end
  students
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
  puts "Overall, we have #{names.count} great students".center(100)
end

students = input_students
print_header
print(students)
print_footer(students)
