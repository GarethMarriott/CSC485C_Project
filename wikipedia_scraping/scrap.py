import sys
import re
import colorama
from colorama import Fore, Style
from urllib.request import urlopen
from bs4 import BeautifulSoup

lines_dic = {}

# url = "https://en.wikipedia.org/wiki/Sergei_Korolev"
def scrap_page(url):
    # url = sys.argv[1]
    print(Fore.BLUE + "fetching URL: " + url + Style.RESET_ALL)

    # Download URL
    try:
        html = urlopen(url).read().decode('utf-8')
    except:
        print("404 error")
    else:
        # Set up HTML Parser with fetched data
        soup = BeautifulSoup(html, 'html.parser')

        # Filter out everything except "content div"
        less_soup = soup.find(id='content')

        # compile Regex
        # Selects only links that start with /wiki/ and don't have a hash in the name
        prog = re.compile('^\/wiki\/[^\s|^#]+$')
        # matches wikipedia special pages. NOTE: this REGEX get inversed during for loop
        prog_WIKI = re.compile('^\/wiki\/(Wikipedia|WP|Project|User|Image|Special|Category|File|Template|Help|Category|Portal|Draft|TimedText|MediaWiki|Module|Book|Education_Program_talk|Gadget|Gadget_definition|Education_Program|WT|CAT|H|MOS|P|T|Project_Talk|Image_Talk|Template_talk|Talk):.*$')

        # Loop through all valid links and select append all valid links to list
        valid_links = []
        for tag in less_soup.find_all('a'):
            link = tag.get('href')
            if link == None:
                continue
            if prog.match(link) and not prog_WIKI.match(link):
                link = link[6:]
                valid_links.append(link)

        return valid_links

in_file = open("all_articles_out.txt","r")
out_file = open("all_articles_TEST.txt","w")

num_lines = sys.argv[1]

counter = 1


for line in in_file:
    line = line.strip('\n')
    if counter < 10:
        print(type(line))
        print(repr(line))

    lines_dic[line] = str(counter)
    counter = counter + 1
    # print(counter)

in_file.close()
print("done")
in_file = open("all_articles_out.txt","r")

counter = 1
for line in in_file:
    print(str(counter) + "/" + num_lines)

    line = line.strip('\n')
    links = scrap_page("https://en.wikipedia.org/wiki/" + line)
    if links == None:
        continue
    links_set = set(links)
    links = list(links_set)
    num_links = list(map(lambda x : lines_dic[x] , links))
    links = [lines_dic[line]] + num_links
    links = " ".join(links)
    # print(line)
    out_file.write(links+"\n")
    counter = counter + 1
