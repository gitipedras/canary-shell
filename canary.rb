# Import essencials
require 'fileutils'
require 'rbconfig'
require 'socket'


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
# Functions


def newfile(file_name)
  puts "Creating new file: #{file_name}"
  # Create an empty file
  File.open(file_name, "w") {} 
  puts "Empty file '#{file_name}' has been created."
end

################ Run Function
def run(runlang, runfile)

puts "#{runlang}"

if runlang == "rb"
	system("ruby #{runfile}")

elsif runlang == "ruby"
	system("ruby #{runfile}")

elsif runlang == "py"
	system("python3 #{runfile}")

elsif runlang == "python"
	system("python3 #{runfile}")
else
	puts "#{lang} is not a supported language. Use 'help supported-run-langs'"
end

end

################ Help section

def help(section)
	puts "- Loading help in section #{section}"
	sleep(0.25)

	system("ruby help.rb #{section}")
end


################ Loop
while true
pwd = Dir.pwd
printf "#{username}:#{pwd}$".cyan


command = gets.chomp
if command == "quit"
	break

### Start Helping!

elsif command == "help"
	
	#puts "Press ENTER for default section"
	printf "section:"

	helpsection = gets.chomp

	puts help(helpsection)


### End Helping!


################ Run Command

elsif command == "run"

printf "lang:"
runlang = gets.chomp

printf "file:"
runfile = gets.chomp

puts run(runlang, runfile)

################ End Run Command

elsif command == "clear"
	system "clear"



elsif command == "newfile"
	  printf "filename:"
    file_name = gets.chomp
    newfile(file_name)

elsif command == "whoami"

	puts "#{username}"

elsif command == "neofetch"

	puts "Username: #{username}"
	# Get Ruby interpreter information
puts "Ruby Version: #{RbConfig::CONFIG['ruby_version']}"
puts "Ruby Executable Path: #{RbConfig::CONFIG['bindir']}/#{RbConfig::CONFIG['ruby_install_name']}"

# Get host information
puts "Hostname: #{Socket.gethostname}"
puts "IP Address: #{Socket.ip_address_list.find { |addr| addr.ipv4_private? }.ip_address}"

elsif command == "cd"
  printf "cd:".green
  cdto = gets.chomp
  if cdto.start_with?("~/")
    # Expand the tilde (~) to the user's home directory
    cdto = File.expand_path(cdto)
  end
  # Change directory to the specified path
  Dir.chdir(cdto)
#end
elsif command == "cp"
	 printf "file to cp:"
	 srcfilecp = gets.chomp
	 printf "destination:"
	 destfilecp = gets.chomp
	 FileUtils.cp_r(srcfilecp, destfilecp)
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

### 215 Lines !!!!!!!!!!!!!!!!