require 'date'

class SecretFile
  @@archive = []

  def initialize(name, secret_data, logger)
    @name = name
    @data = secret_data
    @logger = logger
    @date = Date.today
    @time = Time.now
    @logging_attempts = []
  end

  def data
    @logger.create_log_entry
    @data
  end

  def add_logger(logger)
    @logging_attempts << "#{@logger}"
    @@archive << "#{@name} accessed the secret data on #{@time}"
  end

  def display_individual_logging_attempts
    @logging_attempts.each do |attempt|
      puts "#{@name} accessed secret data on #{@time}"
    end
  end

  def self.display_logging_attempts
    puts @@archive
  end

  def self.count_logging_attempts
    puts @@archive.size
  end
end

class SecurityLogger

  def create_log_entry
    puts "secret accessed"
  end

end

anna = SecretFile.new("Anna", "secret", SecurityLogger.new)
gilles = SecretFile.new("Gilles", "secret", SecurityLogger.new)
anna = SecretFile.new("Anna", "secret", SecurityLogger.new)
anna.data
gilles.data
anna.data
anna.add_logger(anna)
anna.add_logger(anna)
gilles.add_logger(gilles)
puts anna.display_individual_logging_attempts
puts gilles.display_individual_logging_attempts
SecretFile.display_logging_attempts
SecretFile.count_logging_attempts