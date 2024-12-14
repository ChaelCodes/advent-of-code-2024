RSpec.describe Day02 do
  let(:solution) { described_class.new }

  describe "#inputs" do
    subject { solution.inputs }

    context "with input file", :with_input_file do
      it { expect(subject.first).to eq "71 73 74 76 78 80 77" }
      it { expect(subject.count).to eq 1000 }
    end
  end

  describe "#parse_records" do
    subject { solution.parse_records }

    before do
      solution.records = ["7 6 4 2 1",
                          "1 2 7 8 9",
                          "9 7 6 2 1",
                          "1 3 2 4 5",
                          "8 6 4 4 1",
                          "1 3 6 7 9"]
    end

    it "parses records" do
      subject
      expect(solution.records).to eq [[7, 6, 4, 2, 1], 
                                      [1, 2, 7, 8, 9],
                                      [9, 7, 6, 2, 1],
                                      [1, 3, 2, 4, 5],
                                      [8, 6, 4, 4, 1],
                                      [1, 3, 6, 7, 9]]
    end
  end

  describe "#safe_report?" do
    subject { solution.safe_report?(report) }

    context "safe increase report" do
      let(:report) { [1, 3, 6, 7, 9] }

      it { is_expected.to eq true }
    end

    context "safe decrease report" do
      let(:report) { [7, 6, 4, 2, 1] }

      it { is_expected.to eq true }
    end

    context "dangerous increase report" do
      let(:report) { [1, 2, 7, 8, 9] }

      it { is_expected.to eq false }
    end

    context "dangerous decrease report" do
      let(:report) { [9, 7, 6, 2, 1] }

      it { is_expected.to eq false }
    end

    context "dangerous directionless report" do
      let(:report) { [1, 3, 2, 4, 5] }

      it { is_expected.to eq false }
    end

    context "dangerous directionless report" do
      let(:report) { [8, 6, 4, 4, 1] }

      it { is_expected.to eq false }
    end
  end

  describe "#solve" do
    subject { solution.solve }

    context "for part 1" do
      context "with input file", :with_input_file do
        it { is_expected.to eq 279 }
      end

      context "with example input" do
        before do
          solution.records = ["7 6 4 2 1",
                              "1 2 7 8 9",
                              "9 7 6 2 1",
                              "1 3 2 4 5",
                              "8 6 4 4 1",
                              "1 3 6 7 9"]
        end

        it { is_expected.to eq 2 } 
      end
    end

    context "for part 2" do
      let(:solution) { described_class.new(part: 2) }

      context "with input file", :with_input_file do
        # Too high value
        it { is_expected.to eq 374 }
      end
    end
  end
end
