require 'spec_helper'

describe Patient do
  let(:patient) { Patient.new({:name => "Elrey", :doctor_id => 1, :birthday => "2017-09-18"}) }

  describe "#initialize" do
    it "will have a readable name" do
      expect(patient.name).to eq "Elrey"
    end

    it "will have a readable Doctor ID" do
      expect(patient.doctor_id).to eq 1
    end

    it "will have a readable birthday" do
      expect(patient.birthday).to eq "2017-09-18"
    end
  end

end