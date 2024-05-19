# shell.rb

# Requiremets
require_relative 'functions'
require 'socket'
require 'etc'

# Include the Functions module
include Functions

# Canrc

system "ruby canrc.rb"

# Main loop
username = ENV['USER'] || ENV['USERNAME']

while true
  pwd = Dir.pwd
  printf "#{username}:#{pwd}$".green
  command = gets.chomp
  
  # Split the command into parts
  parts = command.split(/\s+/)
  cmd = parts[0]  # The first part is the command
  args = parts[1..-1]  # The rest are arguments
  
  # Check if the command corresponds to a function in functions.rb
  if respond_to?(cmd)
    # Call the function dynamically with arguments
    send(cmd, *args)
  else
    puts "Invalid command"
  end
end

### 37 lines!!!!!!