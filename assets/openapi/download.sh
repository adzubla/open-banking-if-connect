#!/usr/bin/env bash

#
# Full documentation can be found at
# https://openbanking-brasil.github.io/areadesenvolvedor/
#

download() {
  OUTPUT="$1/$(basename $2)"
  URL="$2"

  curl -s "$URL" --output "$OUTPUT"
  echo "$OUTPUT"
  grep "version: " "$OUTPUT"
}

FASE1=https://openbanking-brasil.github.io/areadesenvolvedor-fase1
FASE2=https://openbanking-brasil.github.io/areadesenvolvedor
FASE3=https://openbanking-brasil.github.io/areadesenvolvedor

mkdir -p fase1 fase2 fase3

echo
download fase1 $FASE1/swagger/swagger_common_apis.yaml
download fase1 $FASE1/swagger/swagger_channels_apis.yaml
download fase1 $FASE1/swagger/swagger_products_services_apis.yaml
download fase1 $FASE1/swagger/swagger_admin_apis.yaml

echo
download fase2 $FASE2/swagger/swagger_consents_apis.yaml
download fase2 $FASE2/swagger/swagger_credit_cards_apis.yaml
download fase2 $FASE2/swagger/swagger_customers_apis.yaml
download fase2 $FASE2/swagger/swagger_resources_apis.yaml
download fase2 $FASE2/swagger/swagger_accounts_apis.yaml
download fase2 $FASE2/swagger/swagger_credit_cards_apis.yaml
download fase2 $FASE2/swagger/swagger_financings_apis.yaml
download fase2 $FASE2/swagger/swagger_invoice_financings_apis.yaml
download fase2 $FASE2/swagger/swagger_loans_apis.yaml
download fase2 $FASE2/swagger/swagger_unarranged_accounts_overdraft_apis.yaml

echo
download fase3 $FASE3/swagger/swagger_payments_apis.yaml
