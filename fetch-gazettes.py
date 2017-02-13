#!/bin/env python
#
# Script to generate Registry.txt and pdf-urls.txt for gazettes from opengazettes.org.za
import json
import os
import os.path

entries = []
urls = []
count = 0


# what jurisdiction code should we use?
with open("jurisdiction.txt") as f:
    jurisdiction = f.read().strip()
print "Only using gazettes for jurisdiction code: %s" % jurisdiction


# generate an entry for each gazette entry
with open("gazette-index-latest.jsonlines", "r") as f:
    for line in f:
        gazette = json.loads(line)
        if gazette['jurisdiction_code'] != jurisdiction:
            continue

        fname = os.path.basename(gazette['archive_url'])
        urls.append(gazette['archive_url'])
        entries.append('"%s" (%s) %s' % (fname, gazette['publication_date'], gazette['issue_title']))

        count += 1
        if count == 10:
            break


# write the new registry
with open("Registry.txt.new", "w") as f:
    f.write("\n".join(entries))


# write the new urls
with open("pdf-urls.txt.new", "w") as f:
    f.write("\n".join(urls))


# atomically rename the files
os.rename("Registry.txt.new", "Registry.txt")
os.rename("pdf-urls.txt.new", "pdf-urls.txt")
