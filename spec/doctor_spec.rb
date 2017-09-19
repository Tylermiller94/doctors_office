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
end
