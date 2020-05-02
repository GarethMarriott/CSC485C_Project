import sys
import statistics

f = open(sys.argv[1],'r')

count = -1
num_of_edges = []

for line in f:
    if count == -1:
        count = 0
    else:
        line_split = line.split(" ")
        # print(len(line_split)-1)
        num_of_edges.append(len(line_split)-1)
        count = count + 1

print((sum(num_of_edges)/count))
print("Standard Deviation of sample is % s " % (statistics.pstdev(num_of_edges)))
