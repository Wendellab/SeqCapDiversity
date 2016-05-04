#!/bin/python
## Corrinne Grover, May 2016

import numpy as np
import sys
import os


gff = open("D5.CDS.gff", 'r')
output_file = open("D5.CDS_range.gff", 'w')

Chr, phy, CDS, rmin, rmax, dunno, strand, chop, name = np.loadtxt(gff, dtype = object, unpack=True)

# iterate over all rows in the file
num_rows = len(name)
i = 0
while i < num_rows:

    # keep track of range info
    range_min = int(rmin[i])
    range_max = int(rmax[i])

    # if other rows have the same name, update the ranges
    while i < num_rows - 1 and name[i] == name[i + 1]:
        i += 1
        range_min = min(range_min, int(rmin[i]))
        range_max = max(range_max, int(rmax[i]))

    # output the aggregated data for this name
    output_file.write("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n" % (Chr[i], phy[i], CDS[i], str(range_min),
                      str(range_max), dunno[i], strand[i], chop[i], name[i]))
    i += 1

output_file.close()
