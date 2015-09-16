counts_raw <- read.delim("data/counts-raw.txt.gz")
dim(counts_raw)
head(counts_raw)
tail(counts_raw)
counts_raw[1,10]
counts_raw[1:10, "pmid"]
str(counts_raw$daysSincePublished)
head(counts_raw$daysSincePublished / 7)
is.numeric(counts_raw$daysSincePublished)
str(counts_raw$journal)
levels(counts_raw$journal)
counts_raw$authorsCount[1:10]
is.na(counts_raw$authorsCount[1:10])
anyNA(counts_raw$authorsCount[1:10])
summary(counts_raw$wosCountThru2011)
hist(counts_raw$wosCountThru2011)
hist(sqrt(counts_raw$wosCountThru2011))
plot(counts_raw$daysSincePublished,counts_raw$wosCountThru2011)
counts_raw$authorsCount[1:10] > 7
dim(counts_raw[counts_raw$journal == "pone",])
dim(counts_raw[counts_raw$journal != "pone",])
dim(counts_raw[counts_raw$journal %in% c("pone","pbio","pgen"),])
dim(counts_raw[grepl("Immunology", counts_raw$plosSubjectTags),])
if (anyNA(counts_raw$authorsCount)) {
  print("Be careful!")
} else {
  print("Looking good!")
}
x <- strsplit(as.character(counts_raw$plosSubjectTags), split="\\|")
for (i in 1:10){
  print(i)
}

levels(counts_raw$journal)
results<-numeric(length=length(levels(counts_raw$journal)))
results
names(results) <- levels(counts_raw$journal)
results
for (j in levels(counts_raw$journal)) {
  results[j] <- mean(counts_raw$wosCountThru2011[counts_raw$journal==j])
}
results
