require_relative 'text_evaluator'

describe TextEvaluator do
  let(:input_text){"word1 word2 word3 word2 word3 word4 word3 word4 word4 word4"}

  subject do
    described_class.new(input_text)
  end

  describe "#most_frequent" do
    context "text is given" do
      it "finds the most frequent word" do
        expect(subject.most_frequent).to eq("word4")
      end
    end

    context "text is empty" do
      let(:input_text){""}

      it "returns empty string for empty text" do
        expect(subject.most_frequent).to eq("")
      end
    end

  end

  describe "#group_words_by_count" do
    context "text is given" do
      it "counts all words and write it as hash" do

        expect(subject.group_words_by_count).to eq({
                                                   "word1" => 1,
                                                   "word2" => 2,
                                                   "word3" => 3,
                                                   "word4" => 4,
                                               })
      end
    end

    context "text is given" do
      let(:input_text){""}
      it "returns empty hash if no text is given" do
        expect(subject.group_words_by_count).to eq({})
      end
    end
  end
end
