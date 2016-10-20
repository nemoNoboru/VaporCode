class VaporCode::VirtualMachine
  opcode 'movs' do |t,l|
    t.data[l[2]] = l[1]
  end

  opcode 'set' do |t,l|
    t.data[l[2]] = t.data[l[1]]
  end

  opcode 'add' do |t,l|
    t.data["acc"] += t.data[l[1]]
  end

  opcode 'sub' do |t,l|
    t.data["acc"] -= t.data[l[1]]
  end

  opcode 'in' do |t,l|
    t.data["acc"] = $stdin.gets.chomp
  end

  opcode 'ini' do |t,l|
    t.data["acc"] = $stdin.gets.chomp.to_i
  end

  opcode 'out' do |t,l|
    puts t.data[l[1]]
  end

  opcode 'label' do |t,l|
    t.data[l[1]] = t.pc
  end

  opcode 'jne' do |t,l|
    if t.data[l[1]] != t.data["acc"]
      t.pc = l[2].to_i
      t.pc -= 2
    end
  end

  opcode 'jgt' do |t,l|
    if t.data[l[1]] < t.data["acc"]
      t.pc = l[2].to_i
      t.pc -= 2
    end
  end

  opcode 'jlt' do |t,l|
    if t.data[l[1]] > t.data["acc"]
      t.pc = l[2].to_i
      t.pc -= 2
    end
  end

  opcode 'jeq' do |t,l|
    if t.data[l[1]] == t.data["acc"]
      t.pc = l[2].to_i
      t.pc -= 2
    end
  end

  opcode 'jmp' do |t,l|
    num = l[1].to_i
    num -= 2
    t.pc = num
  end

  opcode 'exit' do |t,l|
    t.run = false
  end

  opcode 'movi' do |t,l|
    t.data[l[2]] = l[1].to_i
  end

  opcode nil do
  end

  opcode ';' do
  end
end
