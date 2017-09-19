class Doctor
  attr_reader :name, :specialty

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
  end

end
