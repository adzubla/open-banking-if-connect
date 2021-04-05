# ASegurança
- [1. Padrões de Autenticação](#1)
  - [1.1 OAuth 2.0](#2)
  - [1.2 OpenID Connect 2.0](#3)
  - [1.3 Financial-grade API (FAPI)](#3)
  - [1.4 Client Initiated Backchannel Authentication (CIBA)](#4)

# 1. Padrões de Autenticação

O Financial-grade API (FAPI) define uma serie de regras de como utilizar o OAuth 2.0 e OpenID Connect, de acordo com um padrão seguro para o setor financeiro.

![Imagem 17](images/imagem_17.png)

## 1.1 OAuth 2.0
OAuth 2.0 é um framework que permite que um aplicativo de terceiros obtenha acesso limitado a um serviço HTTP, seja em nome de um proprietário de recurso orquestrando uma interação de aprovação entre o proprietário do recurso e o serviço HTTP ou permitindo que o terceiro aplicativo para obter acesso em seu próprio nome.

As especificações OAuth 2.0 são projetadas para oferecer suporte ao desenvolvimento de protocolos de autenticação e autorização. Ele fornece uma variedade de fluxos de mensagens padronizados baseados em JSON e HTTP; OpenID Connect os usa para fornecer serviços de identidade.

## 1.2 OpenID Connect 2.0

OpenID Connect 2.0 é um protocolo de autenticação interoperável baseado na família OAuth 2.0 de especificações. Ele usa fluxos de mensagens REST / JSON simplificados. O OpenID Connect 2.0 permite que os desenvolvedores autentiquem usuários em sites e aplicativos sem ter que possuir e gerenciar arquivos de senha.

Para criadores de aplicativos, o OpenID Connect 2.0 permite que o JavaScript baseado em navegador e aplicativos móveis nativos iniciem fluxos de entrada e recebam afirmações verificáveis sobre a identidade dos usuários conectados. Em termos simples, é uma resposta a “Qual é a identidade da pessoa que usa atualmente o navegador ou aplicativo nativo que está conectado?”

## 1.3 Financial-grade API (FAPI)

Financial-grade API (FAPI) é uma especificação liderada pelo setor finananceiro para esquemas de dados JSON, protocolos de segurança e privacidade para oferecer suporte a casos de uso para contas bancárias comerciais e de investimento, bem como contas de seguro e cartão de crédito.

FAPI visa fornecer diretrizes de implementação específicas para serviços financeiros online serem adotados por meio do desenvolvimento de um modelo de dados REST/JSON protegido por um perfil OAuth altamente seguro. O perfil de segurança da API de nível financeiro pode ser aplicado a serviços online em qualquer área de mercado que requeira um nível mais alto de segurança do que o fornecido pelo OAuth padrão ou OpenID Connect.

Os desenvolvedores FinTech podem acelerar o Secure Open Banking, por exemplo:

Aplicativos que usam um modelo de dados seguro baseado em padrões (JSON) para níveis de acesso a dados financeiros armazenados em contas.
Aplicativos que usam uma interface de programa baseada em padrões (REST) para compartilhamento de dados financeiros entre bancos, instituições e terceiros.
Controles de segurança de aplicativos e usuários e configurações de privacidade a serem implementados de forma consistente com padrões abertos (OAuth) e provedores (OpenID Connect).

## 1.4 Client Initiated Backchannel Authentication (CIBA)

O Financial-grade API (FAPI) inclui uma especificação de autenticação de backchannel iniciada pelo cliente (CIBA) para oferecer suporte a um método seguro de desacoplamento de casos de uso de autenticação e autorização para reduzir os riscos associados à engenharia social ou ameaça interna.

CIBA Core é uma nova especificação escrita pelo MODRNA Working Group da OpenID Foundation. A especificação adiciona três fluxos de autorização. O fluxo do código de autorização tradicional e o fluxo implícito são categorizados como “fluxo de redirecionamento”, enquanto os fluxos CIBA são categorizados como “fluxo desacoplado”. Fluxo desacoplado significa que o dispositivo que acessa a API e o dispositivo onde ocorre a autenticação do usuário e a confirmação do consentimento são distintos. por exemplo:

Aproveitando uma sessão fortemente autenticada "DE" um dispositivo inteligente para conceder autorização "PARA" outro dispositivo.
Pague COM seu telefone, relógio ou terminal / quiosque de ponto de venda ou qualquer outro tipo de dispositivo inteligente A um terceiro por meio de notificação PUSH.
Permitir que um agente de call center ou consultor financeiro acesse uma conta em vez de usar perguntas baseadas no conhecimento (por exemplo, nome de solteira da mãe).

# 1. Introdução

A segurança é um item primordial para garantir a viabilidade da solução. A partir disso, os requisitos abaixo devem tratar as possíveis ameaças relacionadas:
**Especificação de utilização de comunicação cifrada via HTTPs TLS1.2 com cifras fortes** (TLS_DHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_DHE_RSA_WITH_AES_256_GCM_SHA384 ou
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 ou superiores). 

**Repetição de mensagem** – deve garantir que mensagens repetidas não sejam aceitas pelo Host TecBan
Mesmo que os dados sejam capturados, o mesmo comando não deve funcionar com tentativas de reenvio. (Possível fraude)
Mensagens duplicadas enviadas por bug do sistema não devem ser processadas. (Erro de programação)

**Acesso não autorizado** – a segurança deve garantir que o acesso só seja concedido se o usuário (IF) possuir credenciais válidas e permissão de acordo com as politicas de segurança definidas pela TecBan.

**Garantia de origem** – as aplicações deverão garantir a origem através de validação de assinatura digital.

# 2. Segurança nas APIs

Segurança é fundamental para integração com nossas APIs, utilizamos elementos de segurança como autenticação e autorização.
Para autorização será necessário que o parceiro gere um token no padrão JWT (JSON Web Tokens).

# 3. Geração do Token JWT

Em breve iremos divulgar a documentação da geração do token.

# 6. Certificado Digital

O parceiro deve gerar dois certificados, sendo um para o ambiente de homologação e outro para o ambiente de produção. A chave pública do certificado deve ser compartilhada com a TecBan da seguinte forma: A chave de homologação pode ser enviada para a equipe do projeto, e a chave de Produção deve ser enviada pelo e-mail de um representante cadastrado da IF para a área de relacionamento da TecBan.

Nossa recomendação para geração do certificado digital, é utilizar certificados com data de validade máxima de 1 ano e padrão RSA 2048.


As mensagens sem assinatura digital do seu conteúdo ou cuja a assinatura não corresponda ao certificado supracitado devem ser desconsideradas.