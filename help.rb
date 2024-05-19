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

if ARGV[0] == "main"

puts "--- Canary Shell Help ---"

puts "(1) Commands".cyan


## File operations 
puts "(1.1) File Operations".cyan
puts


puts "newfile - creates a new file"


puts "ls - list all files and directories"
puts "cd - change directory"

## User info + operations
puts "(1.2) User & Info Operations".cyan
puts

puts "whoami - show username"
puts "sysinfo - shows computer data"


## Shell operations
puts "(1.3) Shell Operations".cyan
puts


puts "echo - put text on the screen"


elsif ARGV[0] == "supported-run-langs"

	puts "Supported languages are:"

	puts "python"
	puts "ruby"
	puts "bash"
	#puts "C"

elsif ARGV[0] == "--testrun"
	puts "testrun ok!"
	
elsif ARGV[0] == "-r"
	puts ""
	
elsif ARGV[0] == "ip-flags"
	puts "Avalible flags:".green

	puts "a - displays ip adress"

elsif ARGV[0] == "sysinfo"
	
	puts "sysinfo flags:".cyan

	puts "-a - displays all info"

	puts "-ip - shows ip"

	puts "--help - shows this"
	
	
elsif ARGV[0]

	puts "Sections".cyan

	puts "sysinfo, ip-flags, -r, --testrun, supported-run-langs, main"
	

else
	puts "#{ARGV[0]} is not a valid section"

end