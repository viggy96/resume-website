#!/bin/sh

if [[ -n "$ENV" && -n "$PORT" ]]; then
    if ! [[ "$ENV" == "production" || "$ENV" == "development" ]]; then
        echo "Invalid environment"
    else
        hugo server --baseURL https://www.viggy96.me/ --environment $ENV --bind 0.0.0.0 --port $PORT
    fi
else
    echo "Required environment variables missing"
fi
