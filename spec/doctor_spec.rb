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
  end

  describe '.all' do
    it 'starts off with no doctors' do
      expect(Doctor.all).to eq []
    end
  end

  describe ("#==") do
    it("is the same doctor if it has the same name") do
      doc1 = Doctor.new({:name => "Dr. Smith", :specialty => "Foot Doctor"})
      expect(doc).to (eq(doc1))
    end
  end
end
