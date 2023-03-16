echo "Mounting the Cloud Storage Bucket locally to './live-streamserver'"
mkdir live-streamserver 
gcsfuse  live-streamserver live-streamserver
