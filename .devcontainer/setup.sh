#!/bin/bash
# Adyen Angular Online Payments - Devcontainer setup steps
set -euo pipefail

echo ""
echo "Dependencies installed!"
echo ""

# Check for environment variables in Codespaces
ENV_VARS_SET=true
MISSING_VARS=()

if [ -z "${ADYEN_API_KEY:-}" ]; then
    ENV_VARS_SET=false
    MISSING_VARS+=("ADYEN_API_KEY")
fi

if [ -z "${ADYEN_CLIENT_KEY:-}" ]; then
    ENV_VARS_SET=false
    MISSING_VARS+=("ADYEN_CLIENT_KEY")
fi

if [ -z "${ADYEN_MERCHANT_ACCOUNT:-}" ]; then
    ENV_VARS_SET=false
    MISSING_VARS+=("ADYEN_MERCHANT_ACCOUNT")
fi

# Provide status and instructions
if [ "$ENV_VARS_SET" = true ]; then
    echo "Environment variables found in Codespaces"
    echo ""
    echo "You can start the application:"
    echo "   Terminal 1: cd checkout && ng serve --proxy-config proxy.conf.json"
    echo "   Terminal 2: cd node-api && npm start"
else
    echo "Environment variables not configured"
    echo "Before running the server, create a .env file in the node-api directory:"
    echo "   cp .env.example node-api/.env"
    echo ""
    echo "Then edit node-api/.env and fill in your actual values:"
    echo "   - ADYEN_API_KEY          (required) (https://docs.adyen.com/user-management/how-to-get-the-api-key)"
    echo "   - ADYEN_CLIENT_KEY       (required) (https://docs.adyen.com/user-management/client-side-authentication)"
    echo "   - ADYEN_MERCHANT_ACCOUNT (required) (https://docs.adyen.com/account/account-structure)"
    echo "   - ADYEN_HMAC_KEY         (optional, recommended) (https://docs.adyen.com/development-resources/webhooks/verify-hmac-signatures)"
    echo ""
    echo "Remember to include http://*.github.dev/* and http://localhost:8080 in the Allowed Origins for your Client Key."
    echo ""
    echo "To start the application:"
    echo "   Terminal 1: cd checkout && ng serve --proxy-config proxy.conf.json"
    echo "   Terminal 2: cd node-api && npm start"
fi