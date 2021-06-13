# Integração

O diagrama mostra as interfaces necessárias entre a Tecban e a IF.

![Integração](../images/Integracao_Apis.png)

# APIs Open Banking padrão

As APIs que são usadas pelas TPP e implementam o padrão [Open Banking Brasil](https://openbanking-brasil.github.io/areadesenvolvedor/) (OAuth, OIDC, FAPI), fazem parte da Plataforma TecBan, e não demandam nenhuma implementação por parte da IF.

A Plataforma Tecban permite que um ASPSP desenvolva a interface do usuário para PSUs sem ter que lidar com as complexidades de OIDC e FAPI e sem ter que obter um entendimento completo das restrições impostas pela FAPI.

Fase 2

- [swagger_accounts_apis.yaml](https://docs.sfa.tecban.com.br/docs/open-banking-if-connect/assets/openapi/fase2/swagger_accounts_apis.yaml)
- [swagger_consents_apis.yaml](https://docs.sfa.tecban.com.br/docs/open-banking-if-connect/assets/openapi/fase2/swagger_consents_apis.yaml)
- [swagger_credit_cards_apis.yaml](https://docs.sfa.tecban.com.br/docs/open-banking-if-connect/assets/openapi/fase2/swagger_credit_cards_apis.yaml)
- [swagger_customers_apis.yaml](https://docs.sfa.tecban.com.br/docs/open-banking-if-connect/assets/openapi/fase2/swagger_customers_apis.yaml)
- [swagger_financings_apis.yaml](https://docs.sfa.tecban.com.br/docs/open-banking-if-connect/assets/openapi/fase2/swagger_financings_apis.yaml)
- [swagger_invoice_financings_apis.yaml](https://docs.sfa.tecban.com.br/docs/open-banking-if-connect/assets/openapi/fase2/swagger_invoice_financings_apis.yaml)
- [swagger_loans_apis.yaml](https://docs.sfa.tecban.com.br/docs/open-banking-if-connect/assets/openapi/fase2/swagger_loans_apis.yaml)
- [swagger_resources_apis.yaml](https://docs.sfa.tecban.com.br/docs/open-banking-if-connect/assets/openapi/fase2/swagger_resources_apis.yaml)
- [swagger_unarranged_accounts_overdraft_apis.yaml](https://docs.sfa.tecban.com.br/docs/open-banking-if-connect/assets/openapi/fase2/swagger_unarranged_accounts_overdraft_apis.yaml)

Fase 3

- [swagger_payments_apis.yaml](https://docs.sfa.tecban.com.br/docs/open-banking-if-connect/assets/openapi/fase3/swagger_payments_apis.yaml)


# Autenticação do usuário

É de responsabilidade da IF realizar a autenticação do usuário através de uma **interface web** conforme os mecanismos já existentes na plataforma de _Internet Banking_ da instituição.

# Comunicação entre TecBan e Instituição Financeira

A comunicação entre TecBan e Instituição Financeira é realizada através de APIs padrão REST (https e json).

- As APIs são especificadas através do padrão OpenAPI Specification 3.0 (OAS3).

- A comunicação entre APIs da Tecban e da Instituição Financeira deve ser realizada através de mTLS 1.2 (certificate-based mutual Transport Layer Security) ou seja, ambos participantes precisam de certificados X.509 para se autenticar e estabelecer a conexão.

## Fluxo de autorização e consentimento

É de responsabilidade da IF chamar as APIs da Tecban de acordo com o fluxo definido nos diagramas de sequência de Compartilhamento de Dados e Pagamentos.
Devem ser chamados dois serviços existentes na plataforma Open Banking da Tecban:

- **Authorization Server** - devem ser chamados pela IF durante sua jornada de autorização.

[headless-heimdall-spec.yaml](https://docs.sfa.tecban.com.br/docs/open-banking-if-connect/assets/openapi/headless-heimdall-spec.yaml)

- **Consent Server** - deve ser chamado pela IF para localizar, modificar e excluir consentimentos.

[consent-manager-spec.yaml](https://docs.sfa.tecban.com.br/docs/open-banking-if-connect/assets/openapi/consent-manager-spec.yaml)

## APIs de negócio

É de responsabilidade da IF expor duas APIs: AIS Server e PIS Server.

- **AIS Server** - Essa API deve ser implementada pela IF para o compartilhamento de dados (fase 2).

[obie-api-spec-ais.yaml](https://docs.sfa.tecban.com.br/docs/open-banking-if-connect/assets/openapi/obie-api-spec-ais.yaml)

- **PIS Server** - Essa API deve ser implementada pela IF para serviços de pagamento(fase 3).

[obie-api-spec-pis.yaml](https://docs.sfa.tecban.com.br/docs/open-banking-if-connect/assets/openapi/obie-api-spec-pis.yaml)


# Referências

O detalhamento dessas integrações está descrito em

- [Compartilhamento de dados]()
- [Pagamentos]()
- [Portal de Consentimento]()
