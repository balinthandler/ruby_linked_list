class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)
    if !@head
      @head = node
      @tail = node
    else
      @tail.set_link(node)
      @tail = node
    end
  end

  def prepend(value)
    node = Node.new(value)
    if !@head
      @head = node
      @tail = node
    else
      node.set_link(@head)
      @head = node
    end
  end

  def size
    return 0 if @head.nil?
    counter = counter(@head, 0)
  end
  
  def counter(node, counter)
    if node.get_link == nil
      counter += 1
    else
      counter += 1
      counter(node.get_link, counter)
    end
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    counter = 0
    node = @head
    until node.nil?
      if index == counter
        return node
      else
        counter += 1
        node = node.get_link
      end
    end
    node
  end

  def pop
    if @head
      node = @head
      node = node.get_link until node.get_link == @tail
      node.set_link(nil)
      @tail = node
    end
  end

  def contains(value)
    if @head.nil?
      puts "List is empty" 
      return false
    else
      node = @head
      contains = false
      until node.nil? || contains == true
        return contains = true if node.get_value == value
        node = node.get_link
      end
    end
    contains
  end

  def find(value)
    if @head.nil?
      puts "List is empty"
      return false
    else
      counter = 0
      found = false
      node = @head
      until found
        if node.get_value == value
          found = true
        else
          node = node.get_link
          unless node.nil?
            counter += 1
          else
            return nil
          end
        end
      end
      counter if found
    end
  end

  def to_s
    string = ""
    node = @head
    until node.nil?
      string += "( #{node.get_value} ) -> "
      node = node.get_link
    end
    return string += "nil\n"
  end

  def insert_at(value, index)
    return prepend(value) if index <= 0
    return append(value) if index >= size

    new_node = Node.new(value)
    before_new = at(index - 1)
    new_node.set_link(before_new.get_link)
    before_new.set_link(new_node)
  end
end

class Node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def get_value
    @value
  end

  def get_link
    @next_node
  end

  def set_link(link)
    @next_node = link
  end

end

list = LinkedList.new
# list.append(5)
# list.append(6)
# list.prepend(4)
# list.prepend(3)
# list.append(7)

# puts "LinkedList nodes:"
# puts list.to_s

# puts "Total number of nodes:"
# puts list.size

# puts "Head value:"
# puts list.head.get_value

# puts "Tail value:"
# puts list.tail.get_value

# puts "Node at given index:"
# p list.at(3)

# list.pop
# puts "Last element popped."
# puts list.to_s

# puts "Is it contains 2?"
# puts list.contains(2)

# puts "Index of 5:"
# p list.find(5)

puts list.to_s
puts "Insert 2 to index 3"
list.insert_at(2, 0)
list.insert_at(1, 0)
list.insert_at(3, 2)
puts list.to_s

puts list.head.get_value
puts list.tail.get_value

