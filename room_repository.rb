class RoomRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @rooms = []
    load_csv
  end

  def add_room(room)
    @rooms << room
  end

  def all
    @rooms
  end

  def add_room(room)
    room.id = @next_id
    @rooms << room
    @next_id += 1
  end

  def find(id)
    @rooms.find{|room| room.id == id }
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:capacity] = row[:capacity].to_i
      @rooms << Room.new(row)
    end
    @next_id = @rooms.empty? ? 1 : @rooms.last.id + 1
  end
end