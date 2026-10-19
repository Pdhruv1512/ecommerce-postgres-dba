#!/bin/bash
# Back up the ecommerce database to a timestamped file.

set -e  # stop immediately if any command fails

mkdir -p backups
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
FILE="backups/ecommerce_$TIMESTAMP.dump"

pg_dump -Fc ecommerce -f "$FILE"

echo "Backup saved to $FILE"