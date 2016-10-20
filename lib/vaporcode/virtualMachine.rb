module VaporCode
  class VirtualMachine

    @@opcodes = {}

    attr_accessor :data, :pc, :run

    def initialize
      @data = {"acc" => 0}
      @pc = 0
      @run = true
    end

    def self.opcode(name,&block)
      @@opcodes[name] = block
    end

    def process(list)
      operator = @@opcodes[list[0]]
      if operator
        operator.call(self,list)
      else
        puts "Error, operator ''#{list[0]}'' not found"
        exit
      end
    end

    def feed(program)
      while @pc < program.length && @run
        process(program[@pc])
        @pc += 1
        #sleep 1
      end
    end

    opcode 'require' do |t,l|
      require_relative l[1]
    end
  end
end
