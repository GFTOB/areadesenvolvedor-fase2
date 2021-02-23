#!/usr/bin/env bash

swagger-cli bundle source/swagger/parts/_admin_apis_part.yml --outfile source/swagger/swagger_admin_apis.yaml --type=yaml
swagger-cli bundle source/swagger/parts/_channels_apis_part.yml --outfile source/swagger/swagger_channels_apis.yaml --type=yaml
swagger-cli bundle source/swagger/parts/_common_apis_part.yml --outfile source/swagger/swagger_common_apis.yaml --type=yaml
swagger-cli bundle source/swagger/parts/_products_services_apis_part.yml --outfile source/swagger/swagger_products_services_apis.yaml --type=yaml
swagger-cli bundle source/swagger/parts/_customers_apis_part.yml --outfile source/swagger/swagger_customers_apis.yaml --type=yaml
swagger-cli bundle source/swagger/parts/_credit_cards_apis_part.yml --outfile source/swagger/swagger_credit_cards_apis.yaml --type=yaml
swagger-cli bundle source/swagger/parts/_accounts_apis_part.yml --outfile source/swagger/swagger_accounts_apis.yaml --type=yaml
swagger-cli bundle source/swagger/parts/_bank_borrowing_apis_part.yml --outfile source/swagger/swagger_bank_borrowing_apis.yaml --type=yaml
swagger-cli bundle source/swagger/parts/_open_banking_apis_part.yml --outfile source/swagger/swagger_open_banking_apis.yml --type=yaml

widdershins source/swagger/swagger_open_banking_apis.yml -o source/includes/partials_open_banking/_open_banking_apis.md.erb --user_templates source/templates/openapi3/ --language_tabs "javascript:JavaScript:request" "python:Python:request" "java:Java::request" --omitHeader --summary --httpsnippet

spectral lint source/swagger/*.yaml

bundle exec middleman serve
