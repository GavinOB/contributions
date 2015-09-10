
# Find contributors with occupation of athlete
athletes <- contr[grepl(".*athlete.*|.*football player.*|.*nfl player.*", contr$contributor_occupation, ignore.case = TRUE), ]

# Party counts
table(athletes$recipient_party)

