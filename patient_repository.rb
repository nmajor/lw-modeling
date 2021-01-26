require 'csv'

class PatientRepository
  def initialize(csv_file, room_repository)
    @room_repository = room_repository
    @csv_file = csv_file
    @patients = []
    load_csv
  end

  def all
    @patients
  end

  def add_patient(patient)
    patient.id = @next_id
    @patients << patient
    @next_id += 1
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:cured] = row[:cured] == "true"

      room = @room_repository.find(row[:room_id].to_i)

      patient = Patient.new(row)
      @patients << Patient.new(row)
      room.add_patient(patient)
    end
    # ternery operator (fancy one line if statement)
    # often used for conditional value assignments
    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
  end
end