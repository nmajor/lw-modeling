class Room
  # DATA
  # capacity - integer
  # patients - array of Patient instances

  attr_reader :patients
  attr_accessor :id

  def initialize(attributes = {})
    @capacity = attributes[:capacity] || 0
    @patients = attributes[:patients] || [] # array of Patient objects
    @id = attributes[:id]
  end

  # BEHAVIOR
  # full?

  def full?
    @patients.size >= @capacity
  end

  def add_patient(patient)
    # Raising error communicates to other developers
    raise(StandardError, "Room is full!") if full?
    patient.room = self
    @patients << patient
  end
end