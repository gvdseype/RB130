class TextAnalyzer
  attr_reader :file
  def initialize
    
  end
  
  def process
    @file = File.new("text.txt", "r")
    yield(@file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split(' ').count} words"}
analyzer.process { |text| puts "#{text.split("\n").count} sentences" }
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
