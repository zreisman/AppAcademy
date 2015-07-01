class Hangman
  attr_reader :guesses, :word, :result, :mistakes

  def initialize(guesser, checker)
    @mistakes = 0
    @guesser = guesser
    @checker = checker
  end

  def start_game
    @checker.pick_word

    until won? || @mistakes >= 6
      p @mistakes
      guess = @guesser.guess
      display(@checker.compare(guess))
      @mistakes += @checker.mistake?(guess)
    end

    (won? && (@mistakes < 6)) ? puts("You win") : puts("You're hanged!")

  end



  def display(stuff)
    p stuff.join
  end

  def won?
    @checker.won?
  end
end

class ComputerPlayer
  attr_reader :word, :dictionary

  def mistake?(guess)
    @word.include?(guess) ? 0 : 1
  end

  def compare(guess)
    @word.each_with_index do |letter, idx|
      if guess == letter
        @result[idx] = letter
      end
    end
    @result
  end

  def read_dictionary_array
    @dictionary = []
    filename = 'dict.txt'
    File.open(filename).each do |line|
      dictionary << line.chomp
    end
    @dictionary
  end

  def pick_word
    read_dictionary_array
    @word = @dictionary.sample.split('')
    @dictionary = []
    @result = Array.new(@word.length, '_')
  end

  def guess
    ("a".."z").to_a.sample
  end

  def won?
    !@result.include?("_")
  end

end

class HumanPlayer
  attr_accessor :result

  def initialize
    @result = ["_"]
  end

  def compare(guess)
    puts "The computer guessed #{guess}:"
    puts "Please input the response followed by "\
            "false if the computer guess is wrong"
    response = gets.chomp.split(' ')
    @mistake = !response.last
    @result = response.first.split('')
  end

  def mistake?(guess)
    @mistake ? 1 : 0
  end

  def pick_word
    puts "Write your word down!"
    sleep(5)
  end

  def guess
    puts "What is your guess?"
    gets.chomp
  end

  def won?
    !@result.include?("_")
  end

end

computer = ComputerPlayer.new
human = HumanPlayer.new

game = Hangman.new(computer, human)
game.start_game
