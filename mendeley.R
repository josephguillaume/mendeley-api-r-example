require(httr)

# Obtain OAuth client ID and secret from the corresponding environment variables
# Register at https://dev.mendeley.com/myapps.html with Redirect URL http://localhost:1410/

client_id <- getOption("MENDELEY_CLIENT_ID")
client_secret <- getOption("MENDELEY_CLIENT_SECRET")

if(is.null(client_id)) stop('options("MENDELEY_CLIENT_ID") not set')
if(is.null(client_secret)) stop('options("MENDELEY_CLIENT_SECRET") not set')

# Obtain OAuth access token

endpoint=oauth_endpoint(NULL,
                        authorize="authorize",
                        access="token",
                        base_url = "https://api.mendeley.com/oauth")
app=oauth_app("mendeley",client_id,client_secret)
token=oauth2.0_token(endpoint,app,scope="all")

# Search the Mendeley catalogue for the specified DOI

doi = '10.1016/j.molcel.2009.09.013'

catalogue_url = modify_url('https://api.mendeley.com/catalog?view=stats', 
                           query=list(doi=doi))
doc_rsp <- GET(catalogue_url,
               config(token = token),
               accept('application/vnd.mendeley-document.1+json')
)

docs <- content(doc_rsp,as = "parsed",type="application/json")

if (length(docs) > 0) {
  doc <- docs[[1]]
  message(paste(doc$title, 'has', doc$reader_count, 'readers.'))
  
  # Create visual representation of the data

  df <- data.frame(t(data.frame(doc$reader_count_by_academic_status)))
  colnames(df) <- c('readers')
  par(mar=c(5,18,1,1), las=2)
  barplot(df$readers, names.arg=row.names(df), horiz=TRUE)
} else {
  message('Document not found.')
}

