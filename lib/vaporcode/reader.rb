
module VaporCode
  module Reader
    @@program ||= []

    def self.read(filename)
      File.open(filename,'r') do |r|
        r.each_line do |line|
          @@program << line.split(/\s+/)
        end
      end
      return @@program
    end
  end
end
