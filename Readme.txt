All the python-related codes and files are stored in Python_script.
All the R-related codes and files are stored in R_scirpt.
The final result file are stored at Result.
Inside the Python_script, 
1. the find_common_interactors contains code to find the common interactors for each fusion pair. 
    find_common_interactors.py reads in the organized interactors data from find_interactors.py for each pair and 
    returns the common interactors.
    find_interactors.py reads in the interactors data and return a organized interactors data.
    uniqueFusionPair.csv is the unique fusion pairs data filtered from TICdb downloaded data and is used in find_interactors.py
    geneIntDic.csv is the organized interactors data returned from find_interactors.py
2. fp_result contains result downloaded from FpClass [http://dcv.uhnres.utoronto.ca/FPCLASS/properties/] 
3. IID results contains the results downloaded from IID database [http://www.unav.es/genetica/TICdb/] (release 3.3 (August 2013))
    and code usde to clean the results.
    PPIs (1)-(5).txt contains PPIs data, since IID only accept max 100 IDs and I have 432 gene IDs, I queried 5 times. 
    PPIs_final.tsv is the cleaned result returned by filter_IID_result.py
    filter_IID_result.py reads all the PPIs (1)-(5), deletes the duplicates and returns one file. 
4. result_From_TICdb contains data downloaded from TICdb and filtered data returned by custom code
    extractGeneID.py reads in the TICdb result and returns the gene fusion pairs. Then it reads in the gene fusion pairs data and
    returns 432 unique gene IDs.
Inside the R_scirpt contains the Untitled.R used to analysis the result file.

