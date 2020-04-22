import sys
import re
import colorama
from colorama import Fore, Style
from urllib.request import urlopen
from bs4 import BeautifulSoup
import random
import time

# url = sys.argv[1]
new_url = "https://en.wikipedia.org/wiki/Special:AllPages"
# new_url = "https://en.wikipedia.org/w/index.php?title=Special:AllPages&from=%22B%22+Is+for+Burglar"

f = open("all_articles_out.txt", "w")

def scrap_page(url, count):
    # Download URL
    html = urlopen(url).read().decode('utf-8')

    # Set up HTML Parser with fetched data
    soup = BeautifulSoup(html, 'html.parser')

    # Filter out everything except "content div"
    next_page_soup = soup.find("div", class_="mw-allpages-nav")

    next_page_link = next_page_soup.find_all("a")

    if len(next_page_link) == 1 and count != 1:
        return ""

    next_page_link = next_page_link[-1].get("href")

    # Filter out everything except "content div"
    less_soup = soup.find(id='content')

    # compile Regex
    # Selects only links that start with /wiki/ and don't have a hash in the name
    prog = re.compile('^\/wiki\/[^\s|^#]+$')
    # matches wikipedia special pages. NOTE: this REGEX get inversed during for loop
    prog_WIKI = re.compile('^\/wiki\/(Wikipedia|WP|Project|User|Image|Special|Category|File|Template|Help|Category|Portal|Draft|TimedText|MediaWiki|Module|Book|Education_Program_talk|Gadget|Gadget_definition|Education_Program|WT|CAT|H|MOS|P|T|Project_Talk|Image_Talk|Template_talk|Talk):.*$')

    # Loop through all valid links and select append all valid links to list
    # valid_links = []
    colors = list(vars(colorama.Fore).values())

    # print(len(less_soup.find_all('a')))

    for tag in less_soup.find_all('a'):
        link = tag.get('href')
        if link == None:
            continue
        if prog.match(link) and not prog_WIKI.match(link):
            short_link = link[6:]
            f.write(short_link+"\n")
    print(random.choice(colors) + str(count), end="")
    print(Style.RESET_ALL, end="")
    print("", end ="\r")

    return next_page_link

    # print(valid_links)

# scrap_page("https://en.wikipedia.org/wiki/Special:AllPages", 1)

count = 1
url = "blank"
while url != new_url:
    url = new_url
    # print(url)
    new_url = "https://en.wikipedia.org/" + scrap_page(url, count)
    count += 1

f.close()
