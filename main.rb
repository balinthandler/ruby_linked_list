class LinkedList
  def initialize
    @list = []
  end

  def append(value)
    @list.push Node.new(value)
  end

  def prepend(value)
    @list.unshift(value)
  end

  def size
    @list.length
  end

  def head
    @list[0]
  end

  def tail
    @list[@list.length - 1]
  end

  def at(index)
    @list[index]
  end

  def pop
    @list.pop
  end

  def contains(value)
    @list.any? {|item| item == value}
  end

  def find(value)
    @list.find_index {|item| item == value}
  end

  def to_s
    @list.each_with_index do |node, index | 
      print "( #{node.value} ) -> "
      print " nil " if index == @list.length - 1
    end
  end
end

class Node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def value
    @value
  end

  def link
    @next_node
  end

end

list = LinkedList.new
list.append(5)
list.append(5)

list.to_s
