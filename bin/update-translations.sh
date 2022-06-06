# Get env variables from .env
source .env

# Place ourself in the translation directory
cd ./src/i18n
ls ./

# Get current branch name
current_branch_name=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
echo "Retrieve the translation files associated with your branch: ${current_branch_name}"

# Get Lokalise current branch translation files URL
lokalise_file_url=$(curl --location --request POST "https://api.lokalise.com/api2/projects/4204698362972bb02dc737.79420570:${current_branch_name}/files/download" \
--header "content-type: application/json" \
--header "x-api-token: ${LOKALISE_ACCESS_TOKEN}" \
--data-raw '{"format":"json","original_filenames":false, "bundle_structure": "locale/%LANG_ISO%.%FORMAT%"}' | jq -r '.bundle_url')
echo "Download Lokalise translation files from: ${lokalise_file_url}"

# Download file and replace old ones
curl $lokalise_file_url -L -o lokalise.zip
unzip -o lokalise.zip 
rm lokalise.zip
echo "Translation files have been updated"
