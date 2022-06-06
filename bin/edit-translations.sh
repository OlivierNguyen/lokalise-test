# Get current branch name
current_branch_name=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
echo "Edit translation files associated with your branch: ${current_branch_name}"

# Open lokalise on the current branch
open "https://app.lokalise.com/project/4204698362972bb02dc737.79420570/?view=multi&branch=${current_branch_name}"

