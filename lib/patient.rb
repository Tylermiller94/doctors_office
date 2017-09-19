class Patient
  attr_reader :name, :birthday, :doctor_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @birthday = attributes.fetch(:birthday)
    @doctor_id = attributes.fetch(:doctor_id)
  end

  def self.all
    return_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    return_patients.each do |patient|
      name = patients.fetch("name")
      birthday = birthday.fetch("birthday")
      doctor_id = doctor_id.fetch("doctor_id").to_i
      patients.push(Patient.new({:name => name, :birthday => birthday, :doctor_id => doctor_id}))
    end
    patients
  end

  def ==(another_patient)
    self.name == another_patient.name && self.doctor_id == another_patient.doctor_id && self.birthday == another_patient.birthday
  end
end
