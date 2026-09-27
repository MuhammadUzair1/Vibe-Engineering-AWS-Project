set -euo pipefail
# Try for up to 30 seconds; the page must load AND contain the word CloudFolio
for i in {1..10}; do
  if curl -fsS http://localhost/ | grep -q "CloudFolio"; then
    echo "Validation passed"
    exit 0
  fi
  sleep 3
done
echo "Validation FAILED: homepage missing or does not contain 'CloudFolio'"
exit 1