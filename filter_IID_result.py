# Purpose is to clean the result get from the IID database and put them into one csv file.
import pandas as pd
IID_result1 = pd.read_csv("./IID results/PPIs (1).txt", sep='\t', usecols=[3, 4], header=0)
IID_result1_single = IID_result1.drop_duplicates()
IID_result2 = pd.read_csv("./IID results/PPIs (2).txt", sep='\t', usecols=[3, 4], header=0)
IID_result2_single = IID_result1.drop_duplicates()
IID_result3 = pd.read_csv("./IID results/PPIs (3).txt", sep='\t', usecols=[3, 4], header=0)
IID_result3_single = IID_result1.drop_duplicates()
IID_result4 = pd.read_csv("./IID results/PPIs (4).txt", sep='\t', usecols=[3, 4], header=0)
IID_result4_single = IID_result1.drop_duplicates()
IID_result5 = pd.read_csv("./IID results/PPIs (5).txt", sep='\t', usecols=[3, 4], header=0)
IID_result5_single = IID_result1.drop_duplicates()
result = pd.concat([IID_result1_single, IID_result2_single, IID_result3_single, IID_result4_single, IID_result5_single])
result_single = result.drop_duplicates()
result_single.to_csv("./IID results/PPIs_final.tsv", sep='\t', index=False)

