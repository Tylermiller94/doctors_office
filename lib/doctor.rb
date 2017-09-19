class Doctor
  attr_reader :name, :specialty, :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
    @id = attributes.fetch(:id)
  end

  def self.all
    return_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    return_doctors.each do |doctor|
      name = doctor.fetch("name")
      specialty = doctor.fetch("specialty")
      id = doctor.fetch("id").to_i
      doctors.push(Doctor.new({:name => name, :specialty => specialty, :id => id}))
    end
    doctors
  end

  def save
    result = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  def self.find(id)
    found_doctor = nil
    Doctor.all().each() do |doctor|
      if doctor.id == id
        found_doctor = doctor
      end
    end
    found_doctor
  end

  def ==(another_doctor)
    self.name == another_doctor.name && self.id == another_doctor.id && self.specialty == another_doctor.specialty
  end
end
