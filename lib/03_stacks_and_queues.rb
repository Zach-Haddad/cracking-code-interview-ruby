# How would you design a stack which, in addition to push and pop,
# also has a function min which returns the minimum element? Push,
#  pop and min should all operate in O(1) time.

class MyStack
  attr_accessor :store, :min

  def initialize
    @store = []
  end

  def vals
    @store.map(&:val)
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
    new_node.val
  end

  def pop
    unless @store.empty?
      val = @store.pop
      val.val
    end
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

# Implement a MyQueue class which implements a queue using two stacks.

class MyQueue
  attr_accessor :in_stack, :out_stack

  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def enqueue(val)
    @in_stack.push(val)
  end

  def dequeue
    self.adjust if !@in_stack.store.empty? && @out_stack.store.empty?
    @out_stack.pop
  end

  def adjust
    until @in_stack.empty?
      @out_stack.push(@out_stack.pop)
    end
  end
end
