#!/bin/bash

check_url() {
    response=$(curl -s --head $1 | head -n 1)
    if [[ $response =~ "200 OK" ]]; then
        echo "Subdirectory found: $1"
    fi
}

read -p "Enter a domain: " domain
domain="${domain%/}"

subdirs=(
    "/admin"
    "/login"
    "/wp-admin"
    "/wp-login"
    "/administrator"
    "/phpmyadmin"
    "/add"
    "/more"
    "/prefixes"
)

for subdir in "${subdirs[@]}"
do
    check_url "$domain$subdir"
done
