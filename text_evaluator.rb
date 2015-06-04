# TDD practice - write a method,
# which would count the number of times each
# word (space separated) occurs in a piece of text
#
# and outputs the word which is used the most frequently

class Counter

  def initialize(text)
    @text = text
  end

  def most_frequent
    words_ary = text.split(' ')
    frequent_word = ""
    max_count = 0

    words_ary.each do |word|
      frequent_word = word if max_count < count_word(word)
    end

    frequent_word
  end

  def group_by_word

  end

  private

  attr_reader :text

  def count_word(word)
    words_ary = text.split(' ')
    result = 0
    words_ary.each do |element|
      if element == word
        result += 1
      end
    end
    result
  end

end

describe Counter do
  describe "#most_frequent" do
    it "finds the most frequent word" do
      input_text = "outputs the word which is used the most frequently word"
      obj = described_class.new(input_text)
      expect(obj.most_frequent).to eq("word")
    end

    xit "returns empty string for empty text" do

    end
  end
end
