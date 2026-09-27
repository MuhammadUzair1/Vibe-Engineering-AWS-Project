set -euo pipefail
# Start every deploy from an empty web root so deleted files really disappear
rm -rf /usr/share/nginx/html/*