#!/usr/bin/env python

import sys
from Bio import SeqIO
import re

hitlist=sys.argv[1]
genome=sys.argv[2]

input_file = open(genome)
genome_dict = SeqIO.to_dict(SeqIO.parse(input_file, "fasta"))
input_file.close()

stream = open(hitlist)
n=1
for line in stream.readlines():
    column = re.sub(r' +', ' ', line).split(' ')
    if column[4] in genome_dict:
        if column[5] < column[6]:
            hitlen = int(column[6]) - int(column[5])
            if hitlen <= 200:
                sup = 800
            elif hitlen <= 400:
                sup = 500
            elif hitlen <= 600:
                sup = 400
            else:
                sup = 300
            start = int(column[5]) - sup
            if start < 0:
                start = 0
            print(">"+genome_dict[column[4]].id + "_Seq_" + str(n))
            print(genome_dict[column[4]].seq[start:int(column[6])+sup])
        else:
            hitlen = int(column[5]) - int(column[6])
            if hitlen <= 200:
                sup = 800
            elif hitlen <= 400:
                sup = 500
            elif hitlen <= 600:
                sup = 400
            else:
                sup = 300
            start = int(column[6]) - sup
            if start < 0:
                start = 0
            print(">"+genome_dict[column[4]].id + "_Seq_" + str(n))
            print(genome_dict[column[4]].seq[start:int(column[5])+sup].reverse_complement())
    n+=1

stream.close()
