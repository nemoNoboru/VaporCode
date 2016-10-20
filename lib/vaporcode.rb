require_relative 'vaporcode/reader.rb'
require_relative 'vaporcode/virtualMachine.rb'

virtual = VaporCode::VirtualMachine.new
program = VaporCode::Reader.read(ARGV[0])
virtual.feed(program)
