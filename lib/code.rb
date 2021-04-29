class Code

  # => Part 1

  attr_accessor :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(array)
    array.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end

  def self.random(length)
    rand_pegs = []
    length.times {rand_pegs << POSSIBLE_PEGS.keys.sample}

    Code.new(rand_pegs)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def initialize(array)
    if Code.valid_pegs?(array)
      @pegs = array.map {|ele| ele.upcase}
    else
      error
    end
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  # => Part 2

  def num_exact_matches(guess)
    count = 0
    (0...guess.length).each do |ele|
      if guess[ele] == @pegs[ele]
        count +=1
      end
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    (0...guess.length).each do |ele|
      if @pegs.include?(guess[ele]) && guess[ele] != @pegs[ele]
        count += 1 
      end
    end
    count
  end

  def ==(code_guess)
    code_guess == @pegs
  end
end
