class Doctor
  attr_reader :name, :specialty, :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
    @id = attributes.fetch(:id, 'nil')
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

  def save
    result = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  def ==(another_doctor)
    self.name == another_doctor.name
  end
end
