#!/bin/sh

if [[ -n "$ENV" ]]; then
    if ! [[ "$ENV" == "production" || "$ENV" == "development" ]]; then
        echo "Invalid environment"
    else
        if [[ "$ENV" == "production" ]]; then
            hugo server --baseURL https://www.viggy96.me/ --environment $ENV --bind 0.0.0.0 --port 443
        elif [[ "$ENV" == "development" ]]; then
            hugo server --baseURL http://localhost --environment $ENV --bind 0.0.0.0 --port 8080
        fi
    fi
else
    echo "Required environment variables missing"
fi
