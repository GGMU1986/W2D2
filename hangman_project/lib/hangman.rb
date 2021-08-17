class Hangman
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) { "_" }
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    return true if attempted_chars.include?(char)
    false
  end

  def get_matching_indices(char)
    (0...@secret_word.length).select { |i| @secret_word[i] == char }
  end

  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char  }
  end

  

end
