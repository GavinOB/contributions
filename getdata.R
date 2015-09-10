
# Download source data from http://data.influenceexplorer.com/bulk/?r
# zipfile <- "contributions.fec.2012.csv.zip"
# download.file("http://datacommons.s3.amazonaws.com/subsets/td-20150109/contributions.fec.2012.csv.zip", zipfile)
# unzip(zipfile)
contr <- read.csv("contributions.fec.2012.csv", na.strings = "", stringsAsFactors = FALSE)

# Industry category codes
# download.file("http://assets.transparencydata.org.s3.amazonaws.com/docs/catcodes.csv", "catcodes.csv")
catcodes <- read.csv("catcodes.csv", na.strings = "", stringsAsFactors = FALSE)

# I only want individuals and certain fields
contr <- contr[contr$contributor_type == "I", c(
    "id", 
    "transaction_type", 
    "amount", 
    "contributor_name", 
    "contributor_occupation", 
    "contributor_employer", 
    "contributor_category",
    "organization_name",
    "recipient_name",
    "recipient_party",
    "recipient_type",
    "committee_name",
    "committee_party"
    )]

# Convert characters to factors
contr$transaction_type <- as.factor(contr$transaction_type)
contr$recipient_party <- as.factor(contr$recipient_party)
contr$recipient_type <- as.factor(contr$recipient_type)
contr$committee_party <- as.factor(contr$committee_party)
contr$contributor_category <- as.factor(contr$contributor_category)

save(contr, catcodes, file = "contributions.Rdata")
