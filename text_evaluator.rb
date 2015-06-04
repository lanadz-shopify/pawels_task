# TDD practice - write a method,
# which would count the number of times each
# word (space separated) occurs in a piece of text
# and outputs the word which is used the most frequently

class TextEvaluator
  def initialize(text)
    @text = text
    split_words
  end

  def most_frequent
    result = group_words_by_count.max_by{|_, count| count} #returns array [element, count]
    result.nil? ? ""  : result[0]
  end

  def group_words_by_count
    split_words.inject(Hash.new(0)) do |memo, word|
      memo[word] += 1
      memo
    end
  end

  private

  attr_reader :text, :words_array

  def split_words
    @words_array ||= text.split(' ')  #lazy loading
  end
end
