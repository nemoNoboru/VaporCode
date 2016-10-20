class VaporCode::VirtualMachine
  opcode 'stack' do |t,l|
    t.data[l[1]] = []
  end

  opcode 'push' do |t,l|
    t.data[l[1]] << t.data["acc"]
  end

  opcode 'pop' do |t,l|
    t.data["acc"] = t.data[l[1]].pop
  end
end
