# How would you design a stack which, in addition to push and pop,
# also has a function min which returns the minimum element? Push,
#  pop and min should all operate in O(1) time.

class MyStack
  attr_accessor :store, :min

  def initialize
    @store = []
  end

  def push(val)
    new_node = MyNode.new(val)
    if @store.empty?
      new_node.min = val
    else
      prev_min = @store[-1].min
      new_node.min = prev_min < val ? prev_min : val
    end
    @store.push(new_node)
  end

  def pop
    @store.pop unless @store.empty?
  end

  def min
    @store.empty? ? nil : @store[-1].min
  end
end

class MyNode
  attr_reader :val
  attr_accessor :min

  def initialize(val)
    @val = val
    @min = nil
  end
end
