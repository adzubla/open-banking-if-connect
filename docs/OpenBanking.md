# Especificação Plataforma de Open Banking

- [Especificação Plataforma de Open Banking](#especificação-plataforma-de-open-banking)
- [1. Identificação do Documento](#1-identificação-do-documento)
- [2. Definições e Abreviaturas](#2-definições-e-abreviaturas)
- [3. Visão Geral](#3-visão-geral)
  - [3.1. Plataforma de Open Banking](#31-plataforma-de-open-banking)
  - [3.2. Arquitetura](#32-arquitetura)
    - [3.2.1. Visão de Serviços](#321-visão-de-serviços)
    - [3.2.2. Arquitetura de Referência](#322-arquitetura-de-referência)
  - [3.3. Integração com instituições financeiras](#33-integração-com-instituições-financeiras)
  - [3.4. Conectores Com a plataforma de Open Banking](#34-conectores-com-a-plataforma-de-open-banking)
  - [3.5. Conectores para gerenciamento do consentimento (Implementação TecBan)](#35-conectores-para-gerenciamento-do-consentimento-implementação-tecban)
  - [3.6. Conectores para o servidor de autorização (Implementação TecBan)](#36-conectores-para-o-servidor-de-autorização-implementação-tecban)
  - [3.7. Conectores para dados do cliente (2º Fase) (Implementação Banco)](#37-conectores-para-dados-do-cliente-2º-fase-implementação-banco)
  - [3.8. Conectores para iniciação de pagamentos (3º Fase) (Implementação Banco)](#38-conectores-para-iniciação-de-pagamentos-3º-fase-implementação-banco)
  - [3.9. Relatórios e Logs](#39-relatórios-e-logs)
  - [3.10. Proposta Jornada do usuário](#310-proposta-jornada-do-usuário)
  - [3.11. Utilização do Swagger (OpenAPI 3)](#311-utilização-do-swagger-openapi-3)
  - [3.12. Esquema Swagger Tecban](#312-esquema-swagger-tecban)
- [4. Monitoração](#4-monitoração)
- [5. Segurança](#5-segurança)
  - [5.1. Introdução](#51-introdução)
  - [5.2. Segurança nas APIs](#52-segurança-nas-apis)
  - [5.3. Geração do Token JWT](#53-geração-do-token-jwt)
  - [5.4. Conectividade - Integração via internet ou API Gateway Privado (Link Dedicado ou VPN)](#54-conectividade---integração-via-internet-ou-api-gateway-privado-link-dedicado-ou-vpn)
  - [5.5. Certificado Digital](#55-certificado-digital)
- [6. Ambiente Sandbox](#6-ambiente-sandbox)
- [7. Premissas e Restrições](#7-premissas-e-restrições)
- [8. Histórico de Alterações do Documento](#8-histórico-de-alterações-do-documento)
- [9. Documentos de apoio](#9-documentos-de-apoio)


# 1. Identificação do Documento

| Nome do Documento                        | Objetivo                                                                                                                                                                                                                                                                                                        |
|------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Especificação Plataforma de Open Banking | Esta especificação permite que as Instituições Financeiras conectem seus sistemas à Plataforma SaaS que disponibiliza as APIs em nome de seus clientes (White-Label). <br /> Facilidade para o compliance com o Open Banking no Brasil. <br /> Uma solução segura e economicamente eficiente para as instituições financeiras. |

# 2. Definições e Abreviaturas	

| Termo               | Descrição                                                                                                                                                                                                                                                                                                                                                                             |
|---------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| API                 | Application Programming Interface: conjunto de definições de métodos e funções que fornece uma biblioteca para ser utilizada por outros programas (no caso desse projeto, para páginas Web). De modo geral, a API é composta por uma série de funções acessíveis somente por programação, e que permitem utilizar características do software menos evidentes ao usuário tradicional. |
| IF                  | Instituição Financeira, Banco Digital, Parceiro ou Fintech.                                                                                                                                                                                                                                                                                                                           |
| Sandbox             | Ambiente para testes da aplicação.                                                                                                                                                                                                                                                                                                                                                    |
| APP                 | Aplicativo mobile transacional da Instituição Financeira.                                                                                                                                                                                                                                                                                                                             |
| Swagger             | Traduzido do inglês – O Swagger é um framework open source que facilita os desenvolvedores a desenhar, especificar e documentar suas APIs. Ele segue a iniciativa [Open API](https://www.openapis.org) que busca a padronização de APIs REST. Esse termo, descreve os recursos de suas APIs, como endpoints, parâmetros de entrada, objetos de retorno, códigos HTTP, métodos de autenticação, entre outros.     |
| Certificado Digital | Arquivo eletrônico que serve como identidade virtual para uma pessoa física ou jurídica, e por ele pode se fazer transações online com garantia de autenticidade e com toda proteção das informações trocadas.                                                                                                                                                                        |

# 3. Visão Geral

## 3.1. Plataforma de Open Banking

Os bancos precisam de uma plataforma especializada para realizar a exposição de APIs, de maneira segura e fazer certo as coisas difíceis.
Os 6 pilares da Plataforma de Open Banking da TecBan, representam a solução para o problema acima.

![Imagem 1](https://raw.githubusercontent.com/Alextnetto/tecban-documentation/main/Images/imagem_1.png)
<br />

A figura abaixo representa em cinza os pontos do ecossistema do Open Banking que a Plataforma irá lhe apoiar:

![Imagem 2](https://raw.githubusercontent.com/Alextnetto/tecban-documentation/main/Images/imagem_2.png)

## 3.2. Arquitetura

![Imagem 3](https://raw.githubusercontent.com/Alextnetto/tecban-documentation/main/Images/imagem_3.png)

### 3.2.1. Visão de Serviços

![Imagem 4](https://raw.githubusercontent.com/Alextnetto/tecban-documentation/main/Images/imagem_4.png)

### 3.2.2. Arquitetura de Referência

![Imagem 5](https://raw.githubusercontent.com/Alextnetto/tecban-documentation/main/Images/imagem_5.png)

## 3.3. Integração com instituições financeiras

O diagrama a seguir mostra as interfaces necessárias entre a Tecban e a IF.

![Imagem 6](https://raw.githubusercontent.com/Alextnetto/tecban-documentation/main/Images/imagem_6.png)

É de responsabilidade da IF expor duas APIs:

**AIS Server** - Essa API deve ser implementada pela IF para que a Tecban possa expor esses serviços as TPPs. Devem estar de acordo com a especificação OpenAPI 3.0 disponibilizada pela Tecban. Vide seção xxx.

Funcionalidades:
  * accounts
  * balances
  * transactions
  * customer
  * direct-debits
  * scheduled-payments
  * standing-orders
  * offers
  * beneficiaries

**PIS Server** - Essa API deve ser implementada pela IF para que a Tecban possa expor serviços de pagamento para TPPs. Devem estar de acordo com a especificação OpenAPI 3.0 disponibilidada pela Tecban. Vide seção xxx.

Funcionalidades:
  * payments
  * payments-consent

É de responsabilidade da IF chamar as APIs da Tecban de acordo com o fluxo definido nos diagramas de sequência em xxx.

Devem ser chamados dois serviços existentes na plataforma Open Banking da Tecban:

**Authorization Server** - devem ser chamados pela IF no final de suas viagens de autorização.
A interface permite que um ASPSP desenvolva a interface do usuário para PSUs sem ter que lidar com as complexidades de OIDC e FAPI e sem ter que obter um entendimento completo das restrições impostas pela FAPI.

Funcionalidades:
  * auth
  * auth-confirm
  * auth-fail

**Consent Server** - deve ser chamado pela IF para localizar, modificar e excluir consentimentos.

Funcionalidades:
  * consents
  * psu


## 3.4. Conectores Com a plataforma de Open Banking

A TecBan possui um padrão próprio para integração e oferece a possibilidade de customização do formato de troca de mensagens com as instituições financeiras. 

## 3.5. Conectores para gerenciamento do consentimento (Implementação TecBan)

Este seção fornece a especificação para as APIs fornecidas pela TecBan para gerenciamento de consentimento.

Essas APIs são implementadas pela TecBan e devem ser chamadas pelo banco para localizar, modificar e excluir consentimentos.

![Imagem 7](https://raw.githubusercontent.com/Alextnetto/tecban-documentation/main/Images/imagem_7.png)

***Para detalhamento dos campos consultar arquivo [Consent Manager APIs.yaml](https://tecban.stoplight.io/docs/open-banking/Consent%20Manager%20APIs.yaml)**

## 3.6. Conectores para o servidor de autorização (Implementação TecBan)

Este documento fornece a especificação para as APIs de autorização.
Essas APIs são implementadas pela TecBan e devem ser chamadas pelo banco no final de suas jornadas de autorização.

![Imagem 8](https://raw.githubusercontent.com/Alextnetto/tecban-documentation/main/Images/imagem_8.png)

***Para detalhamento dos campos consultar o arquivo [Headless Heimdall APIs.yaml](https://tecban.stoplight.io/docs/open-banking/Headless%20Heimdall%20APIs.yaml)**

## 3.7. Conectores para dados do cliente (2º Fase) (Implementação Banco)

APIs que devem ser implementadas pelos bancos para expor informações de contas os parceiros.

![Imagem 9](https://raw.githubusercontent.com/Alextnetto/tecban-documentation/main/Images/imagem_9.png)

***Para detalhamento dos campos consultar [Bank Connect AIS APIs.yaml](https://tecban.stoplight.io/docs/open-banking/Bank%20Connect%20AIS%20APIs.yaml)**

![Imagem 10](https://raw.githubusercontent.com/Alextnetto/tecban-documentation/main/Images/imagem_10.png)

## 3.8. Conectores para iniciação de pagamentos (3º Fase) (Implementação Banco)

Este documento fornece as especificações para que as instituições iniciadoras de pagamento possam utilizer a plataforma

Essas APIs devem ser implementadas pelos bancos para que a TecBan possa fornecer recursos de iniciação de pagamento para os Terceiros

![Imagem 11](https://raw.githubusercontent.com/Alextnetto/tecban-documentation/main/Images/imagem_11.png)

***Para detalhamento dos campos consultar o [Bank Connect PIS.yaml](https://tecban.stoplight.io/docs/open-banking/Bank%20Connect%20PIS.yaml)**

![Imagem 12](https://raw.githubusercontent.com/Alextnetto/tecban-documentation/main/Images/imagem_12.png)

## 3.9. Relatórios e Logs

A ser especificado.

## 3.10. Proposta Jornada do usuário

Consultar o Guia [Jornadas de usuário.pdf](https://github.com/Alextnetto/tecban-documentation/blob/main/Jornadas%20de%20usuário.pdf), produzido pelo Grupo de Trabalho do Open Banking e aprovado pelo Banco Central.

## 3.11. Utilização do Swagger (OpenAPI 3)

Para visualizar o detalhamento dos campos que deseja consultar no swagger, basta acessar no [link](https://editor.swagger.io/).
Selecione “File/Import File” para importar os arquivos yml disponíveis juntamente com essa Especificação Técnica Funcional.

## 3.12. Esquema Swagger Tecban

 * **Formato date-time ( GMT +0 )**

Os swaggers da TecBan utilizam o padrão GMT + 0 nos campos com o formato “date-time”.
Dessa forma, ao consumir as APIs da TecBan utilizar esse esquema definido no swagger.
<br />
Exemplo:

![Imagem 13](https://raw.githubusercontent.com/Alextnetto/tecban-documentation/main/Images/imagem_13.png)

# 4. Monitoração

Os ambientes produtivos são monitorados 24x7 por ferramentas de última geração que avisam imediatamente os operadores do centro de controle que conta com uma equipe técnica especializada para o pronto atendimento.

![Imagem 14](https://raw.githubusercontent.com/Alextnetto/tecban-documentation/main/Images/imagem_14.png)

O processo de monitoria conta com 4 níveis de suporte em caso de falha ou erro das API´s

![Imagem 15](https://raw.githubusercontent.com/Alextnetto/tecban-documentation/main/Images/imagem_15.png)

# 5. Segurança
## 5.1. Introdução


A segurança é um item primordial para garantir a viabilidade da solução. A partir disso, os requisitos abaixo devem tratar as possíveis ameaças relacionadas:
**Especificação de utilização de comunicação cifrada via HTTPs TLS1.2 com cifras fortes** (TLS_DHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_DHE_RSA_WITH_AES_256_GCM_SHA384 ou
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 ou superiores). 

**Repetição de mensagem** – deve garantir que mensagens repetidas não sejam aceitas pelo Host TecBan
Mesmo que os dados sejam capturados, o mesmo comando não deve funcionar com tentativas de reenvio. (Possível fraude)
Mensagens duplicadas enviadas por bug do sistema não devem ser processadas. (Erro de programação)

**Acesso não autorizado** – a segurança deve garantir que o acesso só seja concedido se o usuário (IF) possuir credenciais válidas e permissão de acordo com as politicas de segurança definidas pela TecBan.

**Garantia de origem** – as aplicações deverão garantir a origem através de validação de assinatura digital.

## 5.2. Segurança nas APIs

Segurança é fundamental para integração com nossas APIs, utilizamos elementos de segurança como autenticação e autorização.
Para autorização será necessário que o parceiro gere um token no padrão JWT (JSON Web Tokens).

## 5.3. Geração do Token JWT

Em breve iremos divulgar a documentação da geração do token.

## 5.4. Conectividade - Integração via internet ou API Gateway Privado (Link Dedicado ou VPN)

Para as Instituições Financeiras que ingressarem na rede Banco24Horas® será analisado o modelo de conectividade com a TecBan, que poderá envolver a contratação de link físico dedicado ou utilização de VPN. 

Durante o projeto deverá ser compartilhado com a TecBan os IPs que irão chamar as APIs para para autorização das chamadas.
	

Para as Instituições Financeiras que já ingressaram no Banco24Horas® haverá uma avaliação sobre o uso do link já existente.

![Imagem 16](https://raw.githubusercontent.com/Alextnetto/tecban-documentation/main/Images/imagem_16.png)

## 5.5. Certificado Digital

O parceiro deve gerar dois certificados, sendo um para o ambiente de homologação e outro para o ambiente de produção. A chave pública do certificado deve ser compartilhada com a TecBan da seguinte forma: A chave de homologação pode ser enviada para a equipe do projeto, e a chave de Produção deve ser enviada pelo e-mail de um representante cadastrado da IF para a área de relacionamento da TecBan.

Nossa recomendação para geração do certificado digital, é utilizar certificados com data de validade máxima de 1 ano e padrão RSA 2048.


As mensagens sem assinatura digital do seu conteúdo ou cuja a assinatura não corresponda ao certificado supracitado devem ser desconsideradas.

# 6. Ambiente Sandbox

Para auxiliar nos fluxos iniciais de testes, disponibilizaremos um ambiente de Sandbox no decorrer do projeto. 

Este ambiente é completamente separado do ambiente de Produção. Nenhum dado é compartilhado entre os ambientes.
O ambiente Sandbox permite exercitar as chamadas sem as validações de segurança como certificado e assinatura, sendo um contato inicial com as APIs.

# 7. Premissas e Restrições

Ao consumir as APIs da TecBan, a IF deverá enviar todos os campos respectivos ao date-time no padrão GMT+0.

# 8. Histórico de Alterações do Documento

| Versão | Data       | Autor                        | Alteração                          |
|--------|------------|------------------------------|------------------------------------|
| 1.0    | 23/02/2021 | Josué Jofre e Luiz Bonnarder | Criação do documento               |
| 1.1    | 15/03/2021 | Josué Jofre                  | Adicionado referência ao documento |
| 1.2    | x/03/2021  | Alexandro T. Netto           | Documentação no Stoplight          |

# 9. Documentos de apoio

| Versão                      | Descrição                                                         |
|-----------------------------|-------------------------------------------------------------------|
| Versão 2.2 Lançamento 26.4  | [Bank Connect PIS.yaml](https://tecban.stoplight.io/docs/open-banking/Bank%20Connect%20PIS.yaml)                                            |
| Versão 2.2 Lançamento 30.1  | [Bank Connect AIS APIs.yaml](https://tecban.stoplight.io/docs/open-banking/Bank%20Connect%20AIS%20APIs.yaml)                                       |
| Versão 2.2 Lançamento 26.4  | [Consent Manager APIs.yaml](https://tecban.stoplight.io/docs/open-banking/Consent%20Manager%20APIs.yaml)                                        |
| Versão 2.2 Lançamento 26.4  | [Headless Heimdall APIs.yaml](https://tecban.stoplight.io/docs/open-banking/Headless%20Heimdall%20APIs.yaml)                                       |
| Versão 1.0                  | Plano de disaster recovery, nome do documento [Open_Banking_DR.doc](https://github.com/Alextnetto/tecban-documentation/blob/main/Open_Banking_DR.doc) |
| Versão 1.01.01 - 05/03/2021 | [Jornadas de usuário.pdf](https://github.com/Alextnetto/tecban-documentation/blob/main/Jornadas%20de%20usuário.pdf)                                           |