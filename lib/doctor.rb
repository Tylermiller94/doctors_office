class Doctor
  attr_reader :name, :specialty

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
  end

  def ==(another_doctor)
    self.name == another_doctor.name
  end
end
