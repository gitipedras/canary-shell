# Import essencials
require 'fileutils'

class String
  # Define color constants
  COLORS = {
    black:   30,
    red:     31,
    green:   32,
    yellow:  33,
    blue:    34,
    magenta: 35,
    cyan:    36,
    white:   37
  }

  # Define color methods
  COLORS.each do |color, code|
    define_method(color) { "\e[#{code}m#{self}\e[0m" }
  end
end


system("ruby canrc.rb")

puts "Welcome to canary shell"

# Variables
username = ENV['USER'] || ENV['USERNAME']

while true

pwd = Dir.pwd

printf "#{username}:#{pwd}$".cyan
command = gets.chomp

if command == "quit"
	break

elsif command == "newfile"
	printf "Enter filename:"
	file_name = gets.chomp

	# Create an empty file
	File.open(file_name, "w") {} 

	puts "Empty file '#{file_name}' has been created."

elsif command == "cd"
	printf "cd:".green
	cdto = gets.chomp

	Dir.chdir("#{cdto}")


elsif command == "ls"
	# List files and directories in the current directory
entries = Dir.entries(".")

# Filter out "." and ".." entries (current directory and parent directory)
entries.reject! { |entry| entry == "." || entry == ".." }

# Print the list of files and directories
puts "+++ List of files and directories +++"
puts entries


elsif command == "echo"
	printf "echo:"
	texttoecho = gets.chomp
	puts "#{texttoecho}"

elsif command == "run --ruby"
	entries = Dir.entries(".")

	# Filter out "." and ".." entries (current directory and parent directory)
	entries.reject! { |entry| entry == "." || entry == ".." }

	# Print the list of files and directories
	puts "+++ List of files and directories +++"
	puts entries
	puts "+++ End List of file and directories +++"

	printf "file to execute:"
	rubyfiletoexecute= gets.chomp
	puts "--- start: #{rubyfiletoexecute} ---"

	system("ruby #{rubyfiletoexecute}")

	puts "--- exit: #{rubyfiletoexecute} ---"

elsif command == "run --python"
	entries = Dir.entries(".")

	# Filter out "." and ".." entries (current directory and parent directory)
	entries.reject! { |entry| entry == "." || entry == ".." }

	# Print the list of files and directories
	puts "+++ List of files and directories +++"
	puts entries
	puts "+++ End List of file and directories +++"

	printf "file to execute:"
	pyfiletoexecute= gets.chomp
	puts "--- start: #{pyfiletoexecute} ---"

	system("python3 #{pyfiletoexecute}")

	puts "--- exit: #{pyfiletoexecute} ---"


elsif command == "rm -rf"

printf "Directory name:"
dir_name = gets.chomp

# Check if the directory exists before attempting to delete it
if Dir.exist?(dir_name)
  FileUtils.remove_dir(dir_name, true)
  puts "Directory '#{dir_name}' and its contents have been deleted."
else
  puts "Directory '#{dir_name}' does not exist."
end

elsif command == "rm"

printf "Filename:"
file_name = gets.chomp

# Check if the file exists before attempting to delete it
if File.exist?(file_name)
  File.delete(file_name)
  puts "File '#{file_name}' has been deleted."
else
  puts "File '#{file_name}' does not exist."
end


	
else
	puts "Invalid command"

end

end


puts "Exited"