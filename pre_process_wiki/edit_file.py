

in_file = open("all_articles.txt")
out_file = open("all_articles_out.txt","w")

for line in in_file:
    line = line[6:]
    out_file.write(line)
