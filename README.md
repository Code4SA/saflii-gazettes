# SAFLII gazette scripts

These scripts help archive gazettes from opengazettes.org.za into SAFLII.

To run:

* clone this repo somewhere
* change to the gazette database directory
* ensure you have a symlink to both ``fetch-gazettes.py`` and ``fetch-gazettes.sh`` in the current directory
* create a file called ``jurisdiction.txt`` with the jurisdiction code (eg. ZA for national, ZA-GT for Gauteng, etc.)
* run ``./fetch-gazettes.sh``