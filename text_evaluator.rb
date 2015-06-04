# TDD practice - write a method,
# which would count the number of times each
# word (space separated) occurs in a piece of text
#
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
    split_words.inject({}) do |memo, word|
      if memo[word]
        memo[word] += 1
      else
        memo[word] = 1
      end
      memo
    end
  end

  private

  attr_reader :text, :words_array

  def split_words
    @words_array ||= text.split(' ')  #lazy loading
  end
end

describe TextEvaluator do
  let(:input_text){"word1 word2 word3 word2 word3 word4 word3 word4 word4 word4"}

  describe "#most_frequent" do
    it "finds the most frequent word" do
      obj = described_class.new(input_text)
      expect(obj.most_frequent).to eq("word4")
    end

    it "returns empty string for empty text" do
      obj = described_class.new("")
      expect(obj.most_frequent).to eq("")
    end
  end

  describe "#group_words_by_count" do
    it "counts all words and write it as hash" do
      obj = described_class.new(input_text)
      expect(obj.group_words_by_count).to eq({
                                                 "word1" => 1,
                                                 "word2" => 2,
                                                 "word3" => 3,
                                                 "word4" => 4,
                                             })
    end

    it "returns empty hash if no text is given" do
      obj = described_class.new("")
      expect(obj.group_words_by_count).to eq({})
    end
  end
end
