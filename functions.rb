# functions.rb

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

module Functions
  # Define the help function
  def help(section)
    puts "- searching for section: '#{section}'"
    sleep(0.25)
  
    # Call the help script with the specified section
    system("ruby help.rb #{section}")
  end


  def test
  	sleep(1)
  	puts "Copying files from /etc/skel..."
  	sleep (0.26)
  	puts "Creating 'modular-functions'...."
  	sleep (0.26)
  	puts "Cleaning up...."
  	sleep (0.26)
  	puts "Testing help pages...."
  	system "ruby help.rb --testrun"
  	puts "Test succeeded"
  end

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


	def newfile(file_name)
  		puts "Creating new file: #{file_name}"
  		# Create an empty file
  		File.open(file_name, "w") {} 
  		puts "Empty file '#{file_name}' has been created."
	end


	def ls
		entries = Dir.entries(".")
		# Filter out "." and ".." entries (current directory and parent directory)
		entries.reject! { |entry| entry == "." || entry == ".." }
		# Print the list of files and directories
		puts "- list".cyan
		puts entries
		puts "- list".cyan

	end

	def sysinfo(flags)

		if flags == "-a"
			puts "System Info".green
			ip_address = Socket.ip_address_list.detect(&:ipv4_private?).ip_address
			puts "IP Address: #{ip_address}".blue

			# Get the hostname
			hostname = Socket.gethostname
			puts "Hostname: #{hostname}".blue

			# Get the current user
			current_user = Etc.getlogin
			puts "Current User: #{current_user}".blue

			# Get the user ID (UID)
			user_id = Process.uid
			puts "User ID (UID): #{user_id}".blue

			# Get the group ID (GID)
			group_id = Process.gid
			puts "Group ID (GID): #{group_id}".blue

		elsif flags == "-ip"
			ip_address = Socket.ip_address_list.detect(&:ipv4_private?).ip_address
			puts "IP Address: #{ip_address}".blue

		elsif flags == "--colortest"
			puts "black".black
			puts "green".green
			puts "yellow".yellow
			puts "blue".blue
			puts "magenta".magenta
			puts "cyan".cyan
			puts "white".white
			

		else
			system "ruby help.rb ip-flags"
		end
			
	end

	def quit
		exit
	end

	def ip(flags)

		if flags == "a"
			ip_address = Socket.ip_address_list.detect(&:ipv4_private?).ip_address
			puts "IP Address: #{ip_address}"
		else
			puts "Flags are:".green
			system "ruby help.rb ip-flags"
		end
	end


	def rm(file)

		if File.exist?(file)
 			File.delete(file)
 			puts "File '#{file}' has been deleted."
		else
 			puts "File '#{file}' does not exist."
		end
	end
end

