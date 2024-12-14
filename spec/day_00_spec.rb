RSpec.describe Day00 do
  let(:solution) { described_class.new }

  describe "#inputs" do
    subject { solution.inputs }

    xit { expect(subject.first).to eq "" }
    it { expect(subject.count).to eq 0 }
  end


  describe "#parse_records" do
    subject { solution.parse_records }

    before do
      solution.records = []
    end

    it "parses records" do
      subject
      expect(solution.records).to eq []
    end
  end

  describe "#solve" do
    subject { solution.solve }

    context "for part 1" do
      it { is_expected.to eq 0 }
    end

    xcontext "for part 2" do
      let(:solution) { described_class.new(part: 2) }

      it { is_expected.to eq 0 }
    end
  end
end
