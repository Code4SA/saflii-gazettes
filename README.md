# SAFLII gazette scripts

These scripts help archive gazettes from opengazettes.org.za into SAFLII.

To run:

* clone this repo somewhere
* change to the gazette database directory
* ensure you have a symlink to both ``fetch-gazettes.py`` and ``fetch-gazettes.sh`` in the current directory
* create a file called ``jurisdiction.txt`` with the jurisdiction code (eg. ZA for national, ZA-GT for Gauteng, etc.)
* run ``./fetch-gazettes.sh``

To install the crontab that updates gazettes every morning, use ``crontab crontab``.

NOTE: the crontab expects the code to live in ``~/saflii-gazettes`` and the data in ``/data/home/saflii/raw/``.

## How it works

1. The crontab sets up a regular job that calls `refresh-all.sh`.
2. `refresh-all.sh` has a list of the jurisdictions (national, provincial) which must be updated. Each jurisdiction is a different SAFLII collection directory. The script runs the `fetch-gazettes.sh` script in each jurisdiction directory.
3. The `fetch-gazettes.sh` script downloads the list of gazettes from `http://archive.opengazettes.org.za/index/gazette-index-latest.jsonlines` (a potentially pretty big file).
4. The script then triggers `fetch-gazettes.py` which creates two files, filtered to just the gazettes for this jurisdiction:
    * `Registry.txt` - used by the SAFLII system to know what is available in this collection
    * `pdf-urls.txt` - a list of URLs of PDFs to download
5. Finally, `fetch-gazettes.sh` uses `wget` to download all the PDFs listed in `pdf-urls.txt` to the `Data` directory. Only new PDFs are downloaded.
6. SAFLII's normal build system will kick in at some point and process `Registry.txt` and the files in the `Data` directory.
