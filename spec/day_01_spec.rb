RSpec.describe Day01 do
  let(:solution) { described_class.new }

  xdescribe "#inputs" do
    subject { solution.inputs }

    it { expect(subject.first).to eq "77710   11556" }
    it { expect(subject.count).to eq 1000 }
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
      xit { is_expected.to eq 1197984 }

      context "example problem" do
        before do
          solution.records = ["3   4", "4   3", "2   5", "1   3", "3   9", "3   3"]
        end

        it { is_expected.to eq 11 }
      end
    end

    context "for part 2" do
      let(:solution) { described_class.new(part: 2) }

      xit { is_expected.to eq 23387399 }

      context "example problem" do
        before do
          solution.records = ["3   4", "4   3", "2   5", "1   3", "3   9", "3   3"]
        end

        it { is_expected.to eq 31 }
      end
    end
  end
end
