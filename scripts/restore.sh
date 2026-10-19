#!/bin/bash
# Restore a backup into a separate test database to verify the backup works.
# Usage: ./scripts/restore.sh backups/<backup-file>.dump

set -e

if [ -z "$1" ]; then
    echo "Usage: ./scripts/restore.sh <backup-file>"
    exit 1
fi

dropdb --if-exists ecommerce_restore
createdb ecommerce_restore
pg_restore -d ecommerce_restore "$1"

echo "Restored $1 into database ecommerce_restore"