require 'spec_helper'

describe 'Doctor' do
  let(:doc) { Doctor.new({:name => "Dr. Smith", :specialty => "Foot Doctor", :id => nil}) }

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
      doc.save
      expect(Doctor.all).to eq [doc]
    end
  end

  describe(".find") do
    it("returns a doctor by its ID") do
      test_doctor = Doctor.new({:name => "Dr. Bob", :specialty => "dentist", :id => nil})
      test_doctor.save
      doc.save

      p doc.id
      p test_doctor.id
      expect(Doctor.find(test_doctor.id)).to eq test_doctor
    end
  end

  describe ("#==") do
    it("is the same doctor if it has the same name") do
      doc1 = Doctor.new({:name => "Dr. Smith", :specialty => "Foot Doctor", :id => nil})
      expect(doc).to (eq(doc1))
    end
  end

  describe("patient") do
    it("lists patients under this doctors ID") do
      doc.save
      patients = Patient.new({:name => "steve", :birthday => "2017-09-18", :doctor_id => doc.id})
      patients.save
      expect(doc.patients()).to eq [patients]
    end
  end
end
