require 'spec_helper'

describe 'Doctor' do
  let(:doc) { Doctor.new({:name => "Dr. Smith", :specialty => "Foot Doctor"}) }

  describe '#initialize' do
    it 'wil have a readable name' do
      expect(doc.name).to eq "Dr. Smith"
    end

    it 'wil have a readable specialty' do
      expect(doc.specialty).to eq "Foot Doctor"
    end

    it 'sets its id when you save it' do
      doc.save
      expect(doc.id).to be_an_instance_of Fixnum
    end
  end

  describe '.all' do
    it 'starts off with no doctors' do
      expect(Doctor.all).to eq []
    end
  end

  describe '#save' do
    it 'lets you save doctor to database' do
      expect{ doc.save }.to change{ Doctor.all }.from([]).to([doc])
    end
  end

  describe ("#==") do
    it("is the same doctor if it has the same name") do
      doc1 = Doctor.new({:name => "Dr. Smith", :specialty => "Foot Doctor"})
      expect(doc).to (eq(doc1))
    end
  end
end
