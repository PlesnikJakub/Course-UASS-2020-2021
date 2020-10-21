# ukol doplnit nacteni vsech souboru najednou, pouzit nejaky cyklus pro vypocet vlastnosti vsech datasetu,
# zapsat je do matice prop a pak vyexportovat do csv (najednou pro vsechny datasety)
# a pro kazdy dataset vytovrit dve pdfka s distribuci velikost komponent a distribuci stupnu pro nejvesti souvislou komponentu

if (!require("igraph")) 
  install.packages("igraph")
library(igraph)
if (!require("ggplot2")) 
  install.packages("ggplot2")
library(ggplot2)

f <- "ChCh-Miner_durgbank-chem-chem.csv"
# bude potreba urcit pocet souboru n, zatim mame jeden
i <- 1
# nacteni dat do dataframu
df <- read.csv2(f, header =FALSE)
#prevod na objekt "typu" igraph
g <- graph.data.frame(df, directed = FALSE) 

# jmeno datoveho souboru bez cesty a pripony
jmeno <- gsub(pattern = "\\.csv$", "", basename(f))

prop <- matrix(0, nrow = 1, ncol = 11, byrow=T, dimnames = list(i, c("n", "m", "hustota", "n_komp", "m_komp", "hustota_komp", "d_min", "d_max",  "<d>",  "<l>", "l_max")))
# je g jednoduchy (bez smycek a multihran)?
is_simple(g)
if(!is_simple(g))
  g <- simplify(g, remove.multiple = TRUE, remove.loops = TRUE)

# je g souvisly?
is_connected(g)
count_components(g)
comp <- components(g, mode = "weak")

# distribuce velikosti komponent (histogram)
plot(component_distribution(g))

# histogram lepe
# velikosti komponent
vel_k <- table(comp$csize)
# konverze na dataframe
df_pom <- data.frame(velikosti=as.numeric(names(vel_k)),frekv=as.numeric(vel_k)) 
ggplot(df_pom, aes(x = velikosti, y = frekv)) + 
  geom_point() + 
  scale_x_continuous() + 
  scale_y_continuous() + 
  labs(title = jmeno) +
  theme_bw() +
  theme(plot.title = element_text(size = 7, color="red"))

# ziskat jen nejvetsi komponentu souvislosti
g2 <- induced.subgraph(g, which(comp$membership == which.max(comp$csize)))
is_connected(g2)

## pro cely graf (i nesouvisly)
prop[i,1] <- vcount(g) # pocet vrcholu
prop[i,2] <- ecount(g) # pocet hran 
prop[i,3] <- edge_density(g) # hustota

# pro nejvetsi komponentu
prop[i,4] <- vcount(g2) 
prop[i,5] <- ecount(g2) 
prop[i,6] <- edge_density(g2) 
prop[i,7] <- min(degree(g2)) # min stupen
prop[i,8] <- max(degree(g2)) # max stupen
prop[i,9] <- mean(degree(g2)) # avg stupen
prop[i,10] <- mean_distance(g2,  directed = FALSE, unconnected = FALSE)  # prumerna vzdalenost
prop[i,11] <- diameter(g2) # prumer neboli nejvestsi vzdalenost
  
# stupne vrcholu
deg <- degree(g2, mode="all")
# distribuce stupnu (histogram)
hist(deg, breaks = 1:vcount(g2)-1, main = "Histogram stupnu", xlab = "stupen", ylab = "cetnost")

# histogram lepe
deg <- table(deg)
df_pom2 <- data.frame(stupen=as.numeric(names(deg)),frekv=as.numeric(deg)) 
p <- ggplot(df_pom2, aes(x = stupen, y = frekv)) + 
  geom_point() + 
 # scale_x_log10() + 
#  scale_y_log10() + 
  scale_x_continuous() +
  scale_y_continuous() +
  labs(title = jmeno) +
  theme_bw() +
  theme(plot.title = element_text(size = 7, color="red"))

# ulozime do pdf
pdf(file = paste(jmeno, "_distr_stupnu.pdf"))
plot(p)
dev.off()

# zapiseme do csv souboru
mode(prop) = "numeric"
m <- as.data.frame(prop)
# pridej jmeno datasetu
m <- cbind(jmeno, m)
write.table(m, file = "global vlastnosti.csv", sep = ";", dec = ",", row.names = FALSE)

# vypne vĹˇechna otevĹ™enĂˇ grafickĂˇ zaĹ™Ă­zenĂ­ (zavre vsechna otevrena okna Plots)
dev.off()
# The line removes all variables from the current environment
rm(list = ls())
