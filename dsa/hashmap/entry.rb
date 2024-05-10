class Entry
  attr_reader :key, :value
  def initialize(key, value=nil)
    @key = key
    @value = value
  end

  def to_s
    "(#{key} : #{value})"
  end
end