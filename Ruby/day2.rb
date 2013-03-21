res = []

test = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]

test.each do |x|
  res.push(x)
  if res.length == 4
    puts res.join(" ")
    res = []
  end
end

puts

test.each_slice(4) { |x| puts x.join(" ")}

class Tree
  attr_accessor :children, :node_name
  
  def initialize(treeHash)
    @node_name = treeHash.keys[0] 
    @children = []
    treeHash[@node_name].each_pair{|child| @children.push(Tree.new({child[0] => child[1]}))}
  end
  
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  
  def visit(&block)
    block.call self
  end
end

aTree = Tree.new({grandpa:{dad:{child1:{}, child2:{}},uncle:{child3:{},child4:{}}}})

aTree.visit_all {|x| puts x.node_name}

puts

class Grep
  def initialize(filename)
    @filename = filename
  end
  
  def grep(string)
    File.open(@filename, "r").each_with_index do |line, index| 
      #puts "#{index+1}  #{line}" if line.include?(string)
      puts "#{index+1}  #{line}" if line =~ /.*#{string}.*/i
    end
  end
end

grep = Grep.new("test.txt")

grep.grep "ten"


