# VaporCode
A hackable retro programming language just for fun

Tired of being productive and want some oldschool coding on your life?
Want to hack a programming language from the ground up using Ruby?
Just want to have some assembly fun?
Check VaporCode! the "new" programming language designed for fun and for not
being usefull at all!

# Syntax
Just like assembly.
[Opcode] {operator1} {operator2} ... {operatorN}
the ';' character represents a comment in stdlib.

# Native operators
The only native hardcoded operator is 'require'
and it's used to add libraries to the current program.

# stdlib
It implements the following operators:
- movs s var       : moves the string 's' to var


- set l1 l2        -> moves the value in l1 to l2


- add l1           -> adds l1 to acumulator


- sub l1           -> subtracts l1 to acumulator


- in               -> reads a word from stdin and stores it on acumulator


- ini              -> reads a number from stdin and stores it on acumulator


- out              -> writes the content of acumulator to stdout


- jne l1 line_num  -> jumps to line_num if acumulator != l1


- jgt l1 line_num  -> jumps to line_num if l1 > acumulator


- jlt l1 line_num  -> jumps to line_num if l1 < acumulator


- jeq l1 line_num  -> jumps to line_num if l1 == acumulator


- jmp line_num     -> jumps to line_num


- movi i l2        -> movs number i to l2


- exit             -> exits

# stdstack
- stack l1 -> creates a stack on l1


- push l1 -> pushes acumulator to the top of stack l1


- pop l1 -> pops a value of l1 and sends it to acumulator

# Creating new operators
Create a Ruby file and just use the DSL that i have written for you.
example of writting a operator that does modulus with the acumulator
```ruby
class VaporCode::VirtualMachine
  opcode 'movs' do |t,l|
    t.data['acc'] %= l[1]
  end
```
The block can be very long and complex and rich. It's all on yours hands.
The variable 't' represents the virtual machine instance running. the array 'l' represents a list of given operators

# VirtualMachine
a virtual machine instance has three atributes:
- data wich is a hash containing all variables that has been setted at the given moment
- pc (Program counter) a number representing the next line to be processed
- run a flag that shutdowns the machine if is setted to false

# Examples
In the test folder you have plenty of examples to get you running.
