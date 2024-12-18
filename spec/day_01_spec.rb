RSpec.describe Day01 do
  let(:solution) { described_class.new }

  describe "#inputs" do
    subject { solution.inputs }

    context "with input file", :with_input_file do
      it { expect(subject.first).to eq "77710   11556" }
      it { expect(subject.count).to eq 1000 }
    end
  end

  describe "#parse_records" do
    subject { solution.parse_records }

    before do
      solution.records = ["3   4", "4   3", "2   5", "1   3", "3   9", "3   3"]
    end

    it "creates a left_list and right_list" do
      subject
      expect(solution.left_list).to eq [3, 4, 2, 1, 3, 3]
      expect(solution.right_list).to eq [4, 3, 5, 3, 9, 3]
    end
  end

  describe "#solve" do
    subject { solution.solve }

    context "for part 1" do
      context "with input file", :with_input_file do
        it { is_expected.to eq 1197984 }
      end

      context "example problem" do
        before do
          solution.records = ["3   4", "4   3", "2   5", "1   3", "3   9", "3   3"]
        end

        it { is_expected.to eq 11 }
      end
    end

    context "for part 2" do
      let(:solution) { described_class.new(part: 2) }

      context "with input file", :with_input_file do
        it { is_expected.to eq 23387399 }
      end

      context "example problem" do
        before do
          solution.records = ["3   4", "4   3", "2   5", "1   3", "3   9", "3   3"]
        end

        it { is_expected.to eq 31 }
      end
    end
  end
end
