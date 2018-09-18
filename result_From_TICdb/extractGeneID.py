import pandas as pd

# Generate the fusion gene pair from the fusion gene data-set downloaded from
# http://www.unav.es/genetica/TICdb/
# genePairTable = pd.read_csv("./fusionGeneID&Seq.tsv", usecols=[0, 1], header=0, delimiter='\t')
# genePairTable.to_csv("./fusionGenePair.csv", sep=" ", index=False)


# Generate a unique list of genes from TICdb
uniqueGeneList1 = pd.read_csv("./fusionGenePair.csv", header=0, usecols=[0], delimiter=' ')
uniqueGeneList2 = pd.read_csv("./fusionGenePair.csv", usecols=[1], header=0, delimiter=' ')
result1 = uniqueGeneList1.drop_duplicates()
result2 = uniqueGeneList2.drop_duplicates()
# result1.to_csv("../Genelist/uniqueGeneList1.csv", sep=" ", index=False, header=None)
# result2.to_csv("../Genelist/uniqueGeneList2.csv", sep=" ", index=False, header=None)
# Manually fix the data by adding genelist2 to genelist1
result = pd.read_csv("../Genelist/uniqueGeneList1.csv", usecols=[0], header=None, delimiter=' ')
result = result.drop_duplicates()
# result.to_csv("../Genelist/uniqueGeneList.csv", sep=" ", index=False, header=None)


