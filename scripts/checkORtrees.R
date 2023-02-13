library(ape)
tree <- commandArgs(trailingOnly=T)[1]
phy <- read.tree(tree)
phy<- root.phylo(phy, outgroup = "ADRA1A_NP_000671.2")
ORphy <- extract.clade(phy = phy, node = getMRCA(phy = phy, tip = grep("MUSmus", phy$tip.label)))
if (length(ORphy$tip.label) == 26) {print("OUTGROUP")}
