
# Find contributors with occupation of athlete
athletes <- contr[grepl(".*athlete.*|.*football player.*|.*nfl player.*", contr$contributor_occupation, ignore.case = TRUE), ]

# Party counts
athletes.parties <- table(athletes$recipient_party)

# More general sports category of employers
sports <- contr[contr$contributor_category == "G6400", ]
sports.parties <- table(sports$recipient_party)
