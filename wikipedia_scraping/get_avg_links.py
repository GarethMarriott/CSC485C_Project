import statistics
in_file = open("all_articles_TEST.txt")

num_of_articles = []
count = 0

for line in in_file:
    line_split = line.split(" ")
    num_of_articles.append(len(line_split))
    count = count + 1

print(sum(num_of_articles)/count)
print("Standard Deviation of sample is % s " % (statistics.stdev(num_of_articles)))
