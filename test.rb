require_relative 'room'
require_relative 'room_repository'
require_relative 'patient'
require_relative 'patient_repository'

room_repository = RoomRepository.new('rooms.csv')
patient_repository = PatientRepository.new('patients.csv', room_repository)

tyrion = Patient.new(name: "Tyrion")
patient_repository.add_patient(tyrion)

p patient_repository.all
p room_repository.all


