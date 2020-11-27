# methods: 
# new - creates a buffer chain of n-length
# write - writes whatever argument you have
  # raise an exception BufferFull Exception if the current case is already full
  # after successfully writing a case, put the index on the next case. If the case is the last one in the chain, 
  # put the index on the first case of the chain
# write! - writes whatever argument you have
  # does't raise an exception if the current case is already full.
  # after succesfully writing a case, put the index on the next case. If the case is the last one i the chain,
  # put the index on the first case of the chain.  
# read - reads the first inserted number in the buffer, and erases it afterwards
  # raise an exception BufferEmptyException if the current case is empty. 
  # after successfully reading a case, put the index on the next case. If the case is the last one in the chain, put the index on the first case of the chain


  class CircularBuffer
    attr_accessor :array, :index, :writer_index, :reader_index
    attr_reader :size

    def initialize(size)
      @size = size
      @array = []
      size.times { |n| array << []}
      @writer_index = 0
      @reader_index = 0
    end

    def is_full_writer_index
      array[writer_index].empty? ? false : true
    end

    def is_full_reader_index
      array[reader_index].empty? ? false : true
    end

    def increase_writer_index
      writer_index == array.size - 1 ? self.writer_index = 0 : self.writer_index += 1
    end

    def increase_reader_index
      reader_index == array.size - 1 ? self.reader_index = 0 : self.reader_index += 1
    end

    def write(input)
      if is_full_writer_index
        raise BufferFullException 
      else 
        array[writer_index][0] = input
        increase_writer_index
      end
    end

    def write!(input)
      array[writer_index][0] = input
      increase_writer_index
    end

    def read
      if is_full_reader_index
        array.shift
        array[reader_index] = []
        increase_reader_index
      else
        raise BufferEmptyException
      end
    end
    
    class BufferEmptyException < Exception; end
    class BufferFullException < Exception; end
  end

  buffer = CircularBuffer.new(1)
  buffer.write '1'
  buffer.read