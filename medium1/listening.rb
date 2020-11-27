class Device
  attr_accessor :recordings
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    return if block_given? == false
    record(yield)
  end

  def play
    puts recordings
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.listen { "Second Test" }
listener.play # Outputs "Hello World!"