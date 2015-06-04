# TDD practice - write a method,
# which would count the number of times each
# word (space separated) occurs in a piece of text
# and outputs the word which is used the most frequently
require 'pry'
class TextEvaluator
  def initialize(text)
    @text = text
    split_words
  end

  def most_frequent
    max_frequency = group_words_by_count.values.max
    result = group_words_by_count.select{|_, frequency| max_frequency == frequency}
    result.keys
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
