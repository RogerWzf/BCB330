# Author: Wu Zhifan
# Date: Mar 8th, 2018
# Purpose: Find the common interactor of a pair of fusion genes.

import pandas as pd
import csv
from collections import OrderedDict


def find_common_interactor():
    """ Nonetype -> NoneType
    1. Get the unique fusion gene pairs.
    2. For each gene pair, get all the interactors they have, and find the common interactor.
    3. Store the information
    """
    # 1. filter the unique fusion gene pairs.
    # fusionGenePair = pd.read_csv("./fusionGenePair.csv", header=0, sep=' ')
    # unique_fusionGenePair = fusionGenePair.drop_duplicates()
    # unique_fusionGenePair.to_csv("./uniqueFusion.csv", sep=' ', index=False)
    unique_fusionGenePair = pd.read_csv("./uniqueFusion.csv", sep=' ', header=0)

    # 2. for each gene pairs, get all the interactors each partner has.

    # Store the 5' partner gene and 3' partner gene in two lists.
    FivePartnerGenelist = []
    ThreePartnerGenelist = []
    for index, row in unique_fusionGenePair.iterrows():
        FivePartnerGenelist.append(row['5_PARTNER_GENE'])
        ThreePartnerGenelist.append(row['3_PARTNER_GENE'])
    # Get the unique gene in each pair
    uniqueFPGL = list(OrderedDict.fromkeys(FivePartnerGenelist))
    uniqueTPGL = list(OrderedDict.fromkeys(ThreePartnerGenelist))
    uniqueGene = list(OrderedDict.fromkeys(uniqueTPGL + uniqueFPGL))

    # Find each gene's interactor in the PPI datasets
    PPIS = pd.read_csv("./IID results/PPIs_final.tsv", sep='\t', header=0)

    # Put each gene interactor into a dictionary.
    geneIntDic = {}
    for item in uniqueGene:
        for index, row in PPIS.iterrows():
            if row['Query Symbol'] == item:
                if item in geneIntDic:
                    geneIntDic[item].append(row['Partner Symbol'])
                else:
                    key = item
                    geneIntDic.setdefault(key, [])
                    geneIntDic[item].append(row['Partner Symbol'])
            if row['Partner Symbol'] == item:
                if item in geneIntDic:
                    geneIntDic[item].append(row['Query Symbol'])
                else:
                    key = item
                    geneIntDic.setdefault(key, [])
                    geneIntDic[item].append(row['Query Symbol'])
    w = csv.writer(open("./geneIntDic.csv", "w"))
    for key, val in geneIntDic.items():
        w.writerow([key, val])


if __name__ == '__main__':
    find_common_interactor()
