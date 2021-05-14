# Integração

O diagrama mostra as interfaces necessárias entre a Tecban e a IF.


![Integração](../images/Integracao_Apis.png)

É de responsabilidade da IF expor duas APIs:

**AIS Server -** Essa API deve ser implementada pela IF para que a Tecban possa expor esses serviços as TPPs. Devem estar de acordo com a especificação OpenAPI 3.0 disponibilizada pela Tecban. Vide seção xxx.

**PIS Server -** Essa API deve ser implementada pela IF para que a Tecban possa expor serviços de pagamento para TPPs. Devem estar de acordo com a especificação OpenAPI 3.0 disponibilidade pela Tecban. Vide seção xxx.

É de responsabilidade da IF chamar as APIs da Tecban de acordo com o fluxo definido nos diagramas de sequência.
Devem ser chamados dois serviços existentes na plataforma Open Banking da Tecban:

**Authorization Server -** devem ser chamados pela IF no final de suas viagens de autorização.

A interface permite que um ASPSP desenvolva a interface do usuário para PSUs sem ter que lidar com as complexidades de OIDC e FAPI e sem ter que obter um entendimento completo das restrições impostas pela FAPI.

**Consent Server -** deve ser chamado pela IF para localizar, modificar e excluir consentimentos.
