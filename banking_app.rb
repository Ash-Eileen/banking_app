# gets ability to mask password entry
require 'io/console'

def banking_app
	# Set password and default balance
	password = "Password1"
	balance = 0
	
	puts "Welcome to the banking app"
	
	# Utilise exiting password method
	password_checker password
	
	# Array containing the options available for ease of adjustment in functionality
	menu_options = ["balance", "deposit", "withdraw", "exit"]
	
	continue_loop = true

	while continue_loop		
		system "clear"
		
		puts "What would you like to do? (options: #{menu_options.join(", ")})"
		action = gets.strip.downcase

		case action
			when "balance"
				puts "Your balance is $#{balance}"
			when "deposit"
				puts "How much would you like to deposit?"
				deposit = gets.strip.to_i
				balance += deposit
				puts "Your balance is $#{balance}"
		 	when "withdraw"
				puts "How much would you like to withdraw?"
				withdrawal = gets.strip.to_i
					if withdrawal > balance
						puts "Sorry your balance is less than $#{withdrawal}"
					else
						balance = balance - withdrawal
						puts "Your new balance is $#{balance}"
					end	
			when "exit"
				system "clear"
				puts "Thank you for choosing to bank with Ruby. Goodbye"
				continue_loop = false
			else
				puts "Invalid selection!"
		end
		sleep 2
	end
end

# Method to check password. Takes one argument in the form of the existing password to be checked.

def password_checker password
	# Adjustable variable to store the number of time the user can attempt to enter their password
	available_attempts = 3
		
	puts "You have #{available_attempts} attempts to enter your password"
	
	num_of_attempts = 0

	
	while num_of_attempts < available_attempts
		# Immediately decrements the number of times the user has attempted to enter their password
		available_attempts -= 1
		
		puts "Please enter your password"
		# Below gets method masks the password entry
		password_attempt = STDIN.noecho(&:gets).chomp
		
		# Checks password entered vs stored password. Exits loop if matched
		if password_attempt == password
			break
		# Checks if number if available attempts has been exceed and exits program if it has.
		elsif num_of_attempts == available_attempts
			puts "Sorry you have exceeded your maximum number of attempts. Goodbye."
			exit
		# Advises no match and the number of attempts remaining.
		else
			puts "Sorry your password is incorrect. You have #{available_attempts} attempts remaining"
		end
		sleep 1
		system "clear"
	end
end

banking_app