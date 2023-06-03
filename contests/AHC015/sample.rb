STDOUT.flush

# require 'tsort'

# graph = {1=>[2], 2=>[3, 4], 3=>[2], 4=>[]}
# each_child = lambda {|n, &b| graph[n].each(&b) }
# TSort.each_strongly_connected_component_from(1, each_child) {|scc|
#   p scc
# }
# # => [4]
# #    [2, 3]
# #    [1]
