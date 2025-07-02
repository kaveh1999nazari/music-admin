#!/bin/bash

# Run migrations automatically
cd /music

echo "📦 Checking for vendor directory..."

if [ ! -d "vendor" ]; then
    echo "📦 vendor not found. Running composer install..."
    composer install
else
    echo "✅ vendor directory found, updating composer..."
    composer update
fi

echo "🚀 Checking database connection..."
if ! php artisan migrate:status > /dev/null 2>&1; then
    echo "❌ Could not connect to the database."
    exit 1
fi

echo "✅ Database connection successfully."

php artisan storage:link
echo "✅ setting local storage."

# run with supervisord
exec "$@"
