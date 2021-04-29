require_relative "code"

class Mastermind

    # => Part 3 

    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(guess)
       puts "exact matches : #{@secret_code.num_exact_matches(guess)}"
       puts "near matches : #{@secret_code.num_near_matches(guess)}"
    end

    def ask_user_for_guess
        puts 'Enter a code'
        guess = Code.from_string(gets.chomp)
        print_matches(guess)  
        @secret_code ==(guess)
    end


end
