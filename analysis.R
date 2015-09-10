
# Find contributors with occupation of athlete
athletes <- contr[grepl(".*athlete.*|.*football player.*|.*nfl player.*", contr$contributor_occupation, ignore.case = TRUE), ]

# Party counts
athletes.parties <- table(athletes$recipient_party)

# More general sports category of employers
sports <- contr[contr$contributor_category == "G6400", ]
sports.parties <- table(sports$recipient_party)

# All occupation categories
all.parties <- as.data.frame.matrix(table(contr$contributor_category, contr$recipient_party))
names(all.parties) <- c("Third.Party", "Democrat", "Independent", "L", "Republican", "Unknown")
all.parties <- data.frame("code" = rownames(all.parties), all.parties)
rownames(all.parties) <- NULL
all.parties <- merge(x = all.parties, y = catcodes[, c("code", "name")], all.x = TRUE)

