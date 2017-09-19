class Doctor
  attr_reader :name, :specialty

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
  end

  def self.all
    return_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    return_doctors.each do |doctor|
      name = doctor.fetch("name")
      specialty = doctor.fetch("specialty")
      doctors.push(Doctor.new({:name => name, :specialty => specialty}))
    end
    doctors
  end


  def ==(another_doctor)
    self.name == another_doctor.name
  end
end
