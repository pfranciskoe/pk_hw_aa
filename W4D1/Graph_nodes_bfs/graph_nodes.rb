class GraphNode
    attr_accessor :value, :neighbors
    def initialize(value)
        @value = value
        @neighbors = []
    end
end
def bfs(starting_node, target_value)
    visted_nodes = [starting_node]
    queue = [starting_node]
    while !queue.empty?
        next_node = queue.pop
        return next_node if next_node.value == target_value
        next_node.neighbors.each do |ele|
            if !visted_nodes.include?(ele)
            queue << ele
            end
        end
    end
    nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]
p  bfs(a, "b")
p  bfs(a, "f")
