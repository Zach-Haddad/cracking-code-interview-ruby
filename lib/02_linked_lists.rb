# Write code to remove duplicates from an unsorted linked list. FOLLOW UP
# How would you solve this problem if a temporary buffer is not allowed?

class Node
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end

end

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def push(val)
    new_node = Node.new(val)
    if @tail
      @tail.next = new_node
      @tail = new_node
    else
      @head, @tail = new_node, new_node
    end
  end

  # def pop
  #   if @head.next == @tail
  #     @head.next, @tail, temp = nil, nil, @tail
  #     temp
  #   elsif @tail
  #
  #
  # end

  def shift
    temp, @head = @head, @head.next
    temp
  end

  def unshift(val)
    new_node = Node.new(val)
    if @head
      new_node.next = @head
      @head = new_node
    else
      @head, @tail = new_node, new_node
    end
  end

end
