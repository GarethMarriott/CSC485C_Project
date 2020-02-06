import sys
import re
import colorama
from colorama import Fore, Style
from urllib.request import urlopen
from bs4 import BeautifulSoup

# url = "https://en.wikipedia.org/wiki/Sergei_Korolev"

url = sys.argv[1]
print(Fore.BLUE + "fetching URL: " + url)
print(Style.RESET_ALL)

# Download URL
html = urlopen(url).read().decode('utf-8')

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
        print(link)
        valid_links.append(link)

print(valid_links)
