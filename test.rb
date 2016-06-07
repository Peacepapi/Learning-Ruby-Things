# marks = {"Ramesh":23, "Vivek":40, "Harsh":88, "Mohammad":60}
# def group_by_marks(marks, n)
#   # your code here
#   	puts marks.group_by { |k,v| v > n ? "Passed":"Failed"}
# end

# group_by_marks(marks, 40)

input_hash = eval(gets)
values_only = ->(d) {d}
e = values_only.(input_hash)

p e