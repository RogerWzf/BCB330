# Read in the data
fusion <- read.csv(file="./result.txt", header=TRUE, sep="|", stringsAsFactors = FALSE)
rownames(fusion) <- fusion$Gene.pairs
# Read in all the fusion pairs that have fusion domain data
fusion_with_domain <- read.csv(file = "./fusion_with_domain.txt", header = TRUE, sep = "|", stringsAsFactors = FALSE)
# Print out the fusion pairs for further analysis
fusion_with_domain$Gene.pairs
# [1] "ACSL3 ETV1"     "AGTRAP BRAF"    "AKAP9 BRAF"     "ASPSCR1 TFE3"   "BCOR RARA"      "BCR ABL1"       "BCR FGFR1"
# [8] "BCR JAK2"       "BCR PDGFRA"     "BIRC3 MALT1"    "CANT1 ETV4"     "CCDC6 RET"      "CD74 ROS1"      "CHCHD7 PLAG1"
# [15] "COL1A1 PDGFB"   "COL1A2 PLAG1"   "CREB3L2 PPARG"  "CRTC1 MAML2"    "CRTC3 MAML2"    "EML4 ALK"       "ETV6 ABL1"
# [22] "ETV6 ACSL6"     "ETV6 NTRK3"     "ETV6 PRDM16"    "ETV6 RUNX1"     "EWSR1 ATF1"     "EWSR1 ERG"      "EWSR1 ETV4"
# [29] "EWSR1 FLI1"     "EWSR1 NFATC2"   "EWSR1 NR4A3"    "EWSR1 PATZ1"    "EWSR1 WT1"      "FIP1L1 PDGFRA"  "FOXO1 PAX3"
# [36] "FUS ATF1"       "FUS DDIT3"      "FUS ERG"        "GOLGA5 RET"     "HAS2 PLAG1"     "HNRNPA2B1 ETV1" "HOOK3 RET"
# [43] "KIF5B ALK"      "KIF5B RET"      "MEF2D DAZAP1"   "MN1 ETV6"       "MSN ALK"        "MYB NFIB"       "NDE1 PDGFRB"
# [50] "NDRG1 ERG"      "NIN PDGFRB"     "NPM1 ALK"       "NPM1 RARA"      "NUMA1 RARA"     "PAX3 NCOA1"     "PCM1 RET"
# [57] "PML RARA"       "PRKAR1A RARA"   "PRKAR1A RET"    "RBM15 MKL1"     "RUNX1 RUNX1T1"  "RUNX1 YTHDF2"   "SPTBN1 FLT3"
# [64] "SQSTM1 ALK"     "SRGAP3 RAF1"    "SS18 SSX2"      "TAF15 NR4A3"    "TCF12 NR4A3"    "TCF3 NOP2"      "TCF3 PBX1"
# [71] "TFG ALK"        "TFG NR4A3"      "TFG NTRK1"      "TMPRSS2 ERG"    "TMPRSS2 ETV1"   "TMPRSS2 ETV4"   "TMPRSS2 ETV5"
# [78] "TPM3 ALK"       "TPM4 ALK"       "TPR NTRK1"      "TRIM27 RET"

# Function to find fusion domains
find_FUdomain <- function(fusion_pair){
  result <- c()
  NAA <- "No information for this pair"
  if (all(is.na(fusion[fusion_pair, ]))) {
    return(NAA)
  }
  if (any(is.na(fusion[fusion_pair,]))) {
    return("Since this pair don't share interactors, I considered it as not important")
  }
  else{
    result <- fusion[fusion_pair, ]$domain.of.fusions
    return(result)
    }
}

# Function to find partner domains
find_domain <- function(fusion_pair){
  result <- c()
  NAA <- "No information for this pair"
  if (all(is.na(fusion[fusion_pair, ]))) {
    return(NAA)
  }
  if (any(is.na(fusion[fusion_pair,]))) {
    return("Since this pair don't share interactors, I considered it as not important")
  }
  else{
    result <- fusion[fusion_pair,]$domain.of.first_partner_gene
    result <- c(result, fusion[fusion_pair,]$domain.of.second_partner_gene)
    return(result)
  }
}

# Example
find_FUdomain("ANKRD28 NUP98")
# [1] "Since this pair don't share interactors, I considered it as not important"
find_FUdomain("ACSL3 ETV1")
# [1] "AMP-binding enzyme, PEA3 subfamily ETS-domain transcription factor N terminal domain and Ets-domain"
find_domain("ACSL3 ETV1")
# [1] "AMP-binding_conserved_site, AMP-dependent_synthetase/ligase"
# [2] "Ets, PEA3-type_ETS-domain_transcription_factor_N-terminal, Winged_helix-turn-helix_transcription_repressor_DNA-binding"
find_FUdomain("AGTRAP BRAF")
# [1] "Angiotensin II, type I receptor-associated protein (AGTRAP) and Protein tyrosine kinase"
find_domain("AGTRAP BRAF")
# [1] "Angiotensin_II_type_I_receptor-associated"
# [2] "Diacylglycerol/phorbol-ester_binding, Protein_kinase-like_domain, Protein_kinase_ATP_binding_site,
# Protein_kinase_C-like_phorbol_ester/diacylglycerol_binding, Protein_kinase_catalytic_domain,
# Raf-like_Ras-binding, Serine-threonine/tyrosine-protein_kinase, Serine/threonine-protein_kinase_active_site"
