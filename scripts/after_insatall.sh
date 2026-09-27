set -euo pipefail
source "$(dirname "$0")/config.env"
WEB_ROOT=/usr/share/nginx/html

# 1. Pull heavy files from S3. No access keys: the EC2 instance role grants read access.
aws s3 sync "s3://${MEDIA_BUCKET}/assets/" "${WEB_ROOT}/assets/" --region "${AWS_REGION}" --delete

# 2. Record which deployment put this page live (CodeDeploy sets these variables)
cat > "${WEB_ROOT}/deploy-info.json" <<EOF
{
  "deploymentId": "${DEPLOYMENT_ID}",
  "deploymentGroup": "${DEPLOYMENT_GROUP_NAME}",
  "deployedAt": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "server": "$(hostname)"
}
EOF

# 3. Let Nginx read everything
chown -R nginx:nginx "${WEB_ROOT}"
chmod -R a+rX "${WEB_ROOT}"