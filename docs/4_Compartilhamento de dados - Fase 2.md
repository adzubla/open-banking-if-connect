# Compartilhamento de Dados - Fase 2

Este documento descreve como é o fluxo para Compartilhamento de Dados entre as entidades abaixo:


![Fluxo de compartilhamento](../images/Macrofluxocompartilhamento.jpg)


•	IR – Instituição Receptora (TPP)

•	IT – Instituição Transmissora (Banco)


O diagrama de sequência a seguir mostra o fluxo de informações entre os três participantes da solução: Instituição Receptora, TecBan e Instituição Transmissora.

![Diagrama de sequência](../images/fluxo_compartilhamento.png)

Na **Instituição Transmissora**, são mostrados três componentes com as seguintes responsabilidades:

•	**App do Banco** – representa a camada de apresentação da IT. É responsável por receber as requisições da IR e mostrar a interface visual ao usuário.

•	**Servidor de Aplicação** – é o backend de serviços da IT. Efetua as operações de autenticação e consentimento. É responsável por acessar as APIS internas da plataforma OpenBanking da TecBan.

•	**Servidor de Recursos** – é a API de negócios da IT. É restrita a receber apenas as requisições vindas da plataforma OpenBanking da TecBan. Neste ponto a IT pode realizar a transação com confiança que todo o processo de consentimento foi verificado.

Esse é um modelo lógico, e a implementação concreta pela Instituição Transmissora pode ser diferente.

```
É de *responsabilidade da Instituição Transmissora* implementar essas APIs e realizar as chamadas das APIs da Tecban quando necessário, de acordo com o descrito neste documento.
```

Todas as APIs estão especificadas usando o padrão OpenAPI Specification 3 (OAS3).


**API implementada pela IT** | **API usada pela IT**
---------|----------
 Passo 3001 | Passo 3003
 Passo 6002 | Passo 3005
   | | Passo 4003
   | | Passo 4005
   | | Passo 5001


O passo 4001 do diagrama de sequência não é uma API, mas representa a jornada de consentimento do usuário, que deve ser implementada pela IT.

A comunicação entre APIs da **Tecban** e da **IT** deve ser realizada através de mTLS (certificate-based mutual Transport Layer Security) ou seja, ambos participantes precisam de certificados X.509 para se autenticar e estabelecer a conexão.

## Definições gerais

• **x-fapi-financial-id**

O header x-fapi-financial-id, quando presente, é um identificador único da instituição.
Este id é designado para a instituição pela Autoridade Central, quando ocorrer a adesão ao Open Banking Brasil.


• **x-fapi-interaction-id**

O header x-fapi-interaction-id, quando presente, é um identificador único da requisição e deve ser gerado pelo cliente quando chamar os endpoints. A TecBan responderá com o header x-fapi-interaction-id com o mesmo id da requisição.
O seu uso é opcional. Caso ele não esteja presente na requisição, a TecBan irá gerar um novo id para a resposta.

### Estágio 1

Neste estágio o cliente (IR) solicita um token para consentimento ao servidor de autorização.


##### (IR→TB) Passo 1000 POST /token

Cliente da **IR** se identifica a TecBan e determina o escopo desejado.

**Request (1000)**


```json
Path Params	
Query Params	
Headers	Content-Type: application/x-www-form-urlencoded
Authorization: Basic {{basicToken}}
Body	grant_type=client_credentials
scope=openid accounts
```



- **{{basicToken}}** é um valor codificado em base64 de \<clientID\>: \<clientSecret\>. É gerado pela TecBan para a IR durante o processo de adesão.
- **grant_type** é o tipo de autorização para obtenção do token de acesso. Neste passo, deve ter o valor “cliente_credentials”.
- **scope** é a lista de escopos (separados por espaço) que identifica os recursos que o cliente deseja acessar em nome do usuário.
No caso do fluxo de compartilhamento, deve ter o valor “openid accounts”.


##### Response (1001)

```json
Headers	Content-Type: application/json; charset=utf-8
Body	{
    "access_token": "b6b62919-5368-4cc2-ac4d-228d3208c7c4",
    "token_type": "Bearer",
    "expires_in": 3600
}
```


- **access_token: **é uma identificação a ser usada pelo cliente durante o processo de autenticação no estágio 2. Esse token está atrelado ao certificado do cliente usado para a conexão TLS.
- **token_type:** indica o tipo do token, que é Bearer (ao portador).
- **expires_in:** tempo de expiração do token em segundos.

 
### Estágio 2

O cliente (IR) usa o token obtido anteriormente para requisitar quais permissões ele necessita. Se a requisição for válida, será devolvido um id de consentimento com o status de “aguardando consentimento”. O consentimento só será efetivado ao final do estágio 5.

###### [IR→TB] Passo 2000 POST /account-access-consents

**IR** informa o access token a TecBan para obter um objeto de consentimento com as permissões desejadas.

```json
Request (2000)
Path Params	
Query Params	
Headers	Content-Type: application/json
Authorization: Bearer {{accessToken}}
x-fapi-financial-id: {{obParticipantId}}
x-fapi-interaction-id: {{interactionId}}
Body	{
    "Data": {
        "Permissions": [
            "ReadAccountsBasic",
            "ReadAccountsDetail"
        ],
        "TransactionFromDateTime": "2016-01-01T10:40:00+02:00",
        "TransactionToDateTime": "2025-12-31T10:40:00+02:00"
    }, 
    "Risk": {}
}
```

- **{{accessToken}}** é o token gerado no passo 1000, e deve ser usado antes do período de expiração.
- **{{obParticipantId}}** é o id único da IT. Corresponde ao campo “iss” do ID Token.
- **{{interactionId}}** é o identificador único global, gerado pelo cliente.
- O atributo **Data.Permissions** deve conter uma lista de permissões para as quais o cliente deseja o consentimento do usuário.
- Os atributos **Data.TransactionFromDateTime** e **Data.TransactionToDateTime** determinam o intervalo de tempo onde as operações de negócio das permissões se aplicam.

###### Response (2003)
```json
Headers	Content-Type: application/json; charset=utf-8
x-fapi-interaction-id: {{interactionId}}
Body	{
    "Data": {
        "Permissions": [
            "ReadAccountsBasic",
            "ReadAccountsDetail"
        ],
        "TransactionFromDateTime": "2016-01-01T10:40:00+02:00",
        "TransactionToDateTime": "2025-12-31T10:40:00+02:00",
        "ConsentId": "aac-73e58b12-97ac-4b0b-ac89-d126d2c526bf",
        "CreationDateTime": "2021-03-24T14:36:49.670Z",
        "Status": "AwaitingAuthorisation",
        "StatusUpdateDateTime": "2021-03-24T14:36:49.670Z"
    },
    "Risk": {},
    "Links": {
        "Self": "https://rs1.dev.ozoneapi-br.com/open-banking/v3.1/aisp/account-access-consents/aac-73e58b12-97ac-4b0b-ac89-d126d2c526bf"
    },
    "Meta": {}
}
```

- A resposta replica os campos presentes na requisição.
- **Data.ConsentId** é o id do consentimento criado. Ele será usado nos próximos passos do fluxo de compartilhamento.
- **Data.CreationDateTime** é a data da criação do consentimento.
- **Data.Status** indica o estado do consentimento, que neste passo deve ser “esperando pela autorização do usuário”.
- **Data.StatusUpdateDateTime** data de atualização do status do consentimento


 
### Estágio 3

No estágio 3 a IT conversa com a TecBan para confirmar a autenticação do usuário. Aqui a IT descobre o que a IR está requisitando.

###### [IR→IT] Passo 3001 GET /auth

IR consulta a IT para obter a URL de autenticação.
A IT responde com a URL que deve ser usada para o usuário se autenticar na IT.

###### Request (3001)
```json
Path Params	
Query Params	scope=openid accounts
alg=ps256
login_hint=foo
Headers	Authorization: Basic {{basicToken}}
Body
```	

- **scope** é o mesmo escopo usado no passo 1000.
- **alg** os algoritmos válidos são PS256, RS256, HS256 ou none. Para ser de compatível com FAPI o algoritmo deve ser “ps256”.
- **login_hint** quando o aplicativo sabe qual usuário está tentando autenticar, ele pode fornecer esse parâmetro como uma dica para o servidor de autenticação. Opcional.
- **{{basicToken}}** é o mesmo usado no passo 1000.

###### Response

Esta resposta ocorre depois que os passos 3003 e 3005 forem concluídos com sucesso.

```json
Headers	Content-Type: text/html; charset=utf-8
Body	https://examplebank.com.br/auth
?client_id={{client_id}}
&response_type=code
&scope=openid%20accounts
&request={{request_object}}
```

- {{client_id}} é o id recebido pelo parceiro quando se cadastra na plataforma.
- {{response_type}} é o valor “code” que indica que estamos no “Authorization Code Flow” do OpenId.
- {{scope}} é o request_scope com o protocolo de autenticação escopo da autenticação, para esse caso a autenticação é para ter acesso aos dados de contas.
- {{request}} é um JWT contendo o seguinte conteúdo:	

```json
JWT Header	{
  "alg": "none"
}
JWT
payload	{
  "aud": "https://auth1.dev.ozoneapi-br.com",
  "exp": 1617649685.175,
  "iss": "0603ab28-3f68-4ddd-8567-50d9eba73052",
  "scope": "openid accounts",
  "redirect_uri": "https://auth1.dev.ozoneapi-br.com/simple-redirect-url",
  "nonce": "88d2bdc2-b30a-4c42-9651-ad1d8544d736",
  "state": "e74bacb0-a7b0-4502-9c1e-0b902bbcfac3",
  "claims": {
    "id_token": {
      "openbanking_intent_id": {
        "value": "aac-e9ed7099-11db-412d-8870-a39467b3c457",
        "essential": true
      }
    }
  }
}
JWT Signature	HMACSHA256(
  base64UrlEncode(header) + "." +
  base64UrlEncode(payload),
  
your-256-bit-secret

) secret base64 encoded
```

- aud: o público do token.
- exp é a data de expiração do token em mili segundos.
- iss: o emissor do token. É o clientID usado para gerar o basicToken no passo 1000.
- scope é o request_scope com o protocolo de .
- redirect_uri é a uri de redirecionamento onde é exibido o UUID gerado
- nonce Número arbitrário, usada na segurança da requisição, para que seja impedido de requisições iguais, caracterizadas como ataque, sejam executadas com sucesso.
- state é passado na uri que retorna o UUID.
- id_token contém o valor do id da intenção.  o "value" dentro do "openbanking_intent_id" é o id do consentimento.



 
##### [IT→TB] Passo 3003 GET /auth

**IT **notifica a TecBan do início de uma autenticação para consentimento.
TecBan devolve informações do cliente e do token JWT.

###### Request (3003) 
```json
Path Params	
Query Params	client_id
response_type
scope
request
Headers	
Body	
```

- Os parâmetros passados neste passo 3003 são os mesmos recebidos no request do passo 3001.

###### Response (3004)
```json
Headers	Content-Type: application/json; charset=utf-8
Body	{
    "interaction": {
        "interactionId": "ee76c31d-41f7-45ac-8ab5-3f8bc2451fdd",
        "params": {
            "client_id": "0603ab28-3f68-4ddd-8567-50d9eba73052",
            "response_type": "code",
            "scope": "openid accounts",
            "request": "eyJhbGciOiJub25lIn0.eyJhdWQiOiJodHRwczovL2F1dGgxLmRldi5vem9uZWFwaS1ici5jb20iLCJleHAiOjE2MTY3Njg3ODMuMzcsImlzcyI6IjA2MDNhYjI4LTNmNjgtNGRkZC04NTY3LTUwZDllYmE3MzA1MiIsInNjb3BlIjoib3BlbmlkIGFjY291bnRzIiwicmVkaXJlY3RfdXJpIjoiaHR0cHM6Ly9hdXRoMS5kZXYub3pvbmVhcGktYnIuY29tL3NpbXBsZS1yZWRpcmVjdC11cmwiLCJub25jZSI6IjgxNTk2NGY5LWEzYmQtNGU0MS04OGQ5LTVlNTZiZjUwZWMyOSIsInN0YXRlIjoiM2YxY2NlODYtOWJkOC00M2ZkLTljYzgtNTQxNzEyNTE3NzlmIiwiY2xhaW1zIjp7ImlkX3Rva2VuIjp7Im9wZW5iYW5raW5nX2ludGVudF9pZCI6eyJ2YWx1ZSI6ImFhYy02MDA0OTNkYy1mODNjLTRlYzMtODY1Zi03MTc2MzAyOTc2YjgiLCJlc3NlbnRpYWwiOnRydWV9fX19.",
            "scopes": [
                "openid",
                "accounts"
            ],
            "aud": "https://auth1.dev.ozoneapi-br.com",
            "exp": 1616768783.37,
            "iss": "0603ab28-3f68-4ddd-8567-50d9eba73052",
            "redirect_uri": "https://auth1.dev.ozoneapi-br.com/simple-redirect-url",
            "nonce": "815964f9-a3bd-4e41-88d9-5e56bf50ec29",
            "state": "3f1cce86-9bd8-43fd-9cc8-54171251779f",
            "claims": {
                "id_token": {
                    "openbanking_intent_id": {
                        "value": "aac-600493dc-f83c-4ec3-865f-7176302976b8",
                        "essential": true
                    }
                }
            }
        },
        "claims": {},
        "client_id": "0603ab28-3f68-4ddd-8567-50d9eba73052",
        "status": "started",
        "_id": "605ded3afd098310ab7ebca2"
    },
    "tpp": {
        "clientId": "0603ab28-3f68-4ddd-8567-50d9eba73052",
        "tppId": "000015000000000000000001",
        "tppName": "Ozone Financial Technology Limited",
        "obieTppId": "0015800001041RHAAY",
        "softwareStatementId": "000016000000000000000004",
        "obieSoftwareStatementId": "HQuZPIt3ipkh33Uxytox1E",
        "obieSoftwareStatementName": "tpp2019-sandbox-1"
    }
}
```

- interaction.interectionId  é um identificador único gerado para essa requisição.
- interaction.params contém uma cópia dos dados do token JWT.
- tpp.tppId é o identificador da IR no sistema da TecBan.
- tpp.tppName é o nome da IR no sistema da TecBan.
- tpp.obieTppId é o identificador da IR no diretório central do OpenBanking.
- tpp.obieSoftwareStatementId é o id do Software Statement a ser usado pelo cliente.
- tpp.obieSoftwareStatementName é o nome do  Software Statement a ser usado pelo cliente.
- Os outros campos são os mesmos recebidos no response do passo 3002.


 
##### [IT→TB] Passo 3005 GET /consent/:consentId

IT consulta TecBan por detalhes do consentimento.

```json
Request (3005)
Path Params	:consentId
Query Params	
Headers	
Body
```	

- :consentId é o atributo Data.ConsentId retornado no passo 2003.

###### Response (3006)
```json
Headers	Content-Type: application/json; charset=utf-8
Body	{
    "consentType": "account-access-consents",
    "requestHeaders": {
        "host": "rs1.dev.ozoneapi-br.com",
        "self_uri": "https://rs1.dev.ozoneapi-br.com",
        "x-cert-dn": "CN=HQuZPIt3ipkh33Uxytox1E,OU=0015800001041RHAAY,O=OpenBanking,C=GB",
        "x-cert-fingerprint": "feea1cd9bb4adaa1931592e67c96910aa034df6a",
        "connection": "close",
        "content-length": "688",
        "content-type": "application/json",
        "x-fapi-financial-id": "e95ca244-9fae-42d9-900b-ac3fe47c2cec",
        "x-fapi-interaction-id": "a2a87785-b5b7-4f10-858e-cef42875d5f5",
        "authorization": "Bearer 483d2016-1c1d-4ca0-a67b-c9740da21dfc",
        "user-agent": "PostmanRuntime/7.26.10",
        "accept": "*/*",
        "cache-control": "no-cache",
        "postman-token": "ce79b6be-3605-4118-8f9e-f7698dba1a06",
        "accept-encoding": "gzip, deflate, br"
    },
    "request": {
        "Data": {
            "Permissions": [
                "ReadAccountsBasic",
                "ReadAccountsDetail",
                "ReadBalances",
                "ReadBeneficiariesBasic",
                "ReadBeneficiariesDetail",
                "ReadDirectDebits",
                "ReadTransactionsBasic",
                "ReadTransactionsCredits",
                "ReadTransactionsDebits",
                "ReadTransactionsDetail",
                "ReadProducts",
                "ReadStandingOrdersDetail",
                "ReadProducts",
                "ReadStandingOrdersDetail"
            ],
            "TransactionFromDateTime": "2016-01-01T10:40:00+02:00",
            "TransactionToDateTime": "2025-12-31T10:40:00+02:00"
        },
        "Risk": {}
    },
    "requestUrl": "https://rs1.dev.ozoneapi-br.com/open-banking/v3.1/aisp/account-access-consents",
    "consentBody": {
        "Data": {
            "Permissions": [
                "ReadAccountsBasic",
                "ReadAccountsDetail",
                "ReadBalances",
                "ReadBeneficiariesBasic",
                "ReadBeneficiariesDetail",
                "ReadDirectDebits",
                "ReadTransactionsBasic",
                "ReadTransactionsCredits",
                "ReadTransactionsDebits",
                "ReadTransactionsDetail",
                "ReadProducts",
                "ReadStandingOrdersDetail",
                "ReadProducts",
                "ReadStandingOrdersDetail"
            ],
            "TransactionFromDateTime": "2016-01-01T10:40:00+02:00",
            "TransactionToDateTime": "2025-12-31T10:40:00+02:00",
            "ConsentId": "aac-600493dc-f83c-4ec3-865f-7176302976b8",
            "CreationDateTime": "2021-03-26T14:16:20.829Z",
            "Status": "AwaitingAuthorisation",
            "StatusUpdateDateTime": "2021-03-26T14:16:20.829Z"
        },
        "Risk": {},
        "Links": {
            "Self": "https://rs1.dev.ozoneapi-br.com/open-banking/v3.1/aisp/account-access-consents/aac-600493dc-f83c-4ec3-865f-7176302976b8"
        },
        "Meta": {}
    },
    "tpp": {
        "clientId": "0603ab28-3f68-4ddd-8567-50d9eba73052",
        "tppId": "000015000000000000000001",
        "tppName": "Ozone Financial Technology Limited",
        "obieTppId": "0015800001041RHAAY",
        "softwareStatementId": "000016000000000000000004",
        "obieSoftwareStatementId": "HQuZPIt3ipkh33Uxytox1E",
        "obieSoftwareStatementName": "tpp2019-sandbox-1"
    }
}
```

- consentBody contém as informações do consentimento requisitado.


 
### Estágio 4

O estágio 4 a **IT** autentica o usuário e seleciona as contas que serão usadas no consentimento.

##### [IT→TB] Passo 4003 PATCH /consent/:consentId

Depois que o usuário já foi autenticado, a IT precisa atualizar os atributos do consentimento na TecBan.

```json
Request (4003)
Path Params	:consentId
Query Params	
Headers	Content-Type: application/json
Body	{
    "psuIdentifiers": {
        "userId": "{{userId}}"
    },

    "accountIds": {{accountIds}},
    "consentBody.Data.Status": "Authorised"
}
```
	

- :consentId é o atributo Data.ConsentId retornado no passo 2003.
- psuIdentifiers.userId é o identificador do usuário do serviço de pagamento (iss). ((esclarecer))
- accountIds é um array de id das contas.
- ConsentBody.Data.Status  é o status do consentimento.

###### Response (4004)
```json
Headers	
Body	1
```

- Response status 204 (No Content)

 
##### [IT→TB] Passo 4005 POST /auth/:interactionId/doConfirm

A IT confirma com a TecBan que o consentimento foi concedido pelo usuário.
A TecBan responde um HTTP redirect com um header de Location que deve ser usado no passo 5001 para a IT chamar a IR para que ela continue o fluxo.

##### Request (4005)
```json
Path Params	interactionId
Query Params	
Headers	Content-Type: application/x-www-form-urlencoded
Body	openbanking_intent_id= {{consentId}}
heimdall.suppressRefreshToken=false
heimdall.accessTokenValidity=3600
heimdall.refreshTokenValidity=7200
```

- interactionId é o parâmetro recebido no passo 3004 (AuthSuccessResponseInteraction. interactionId)
- openbanking_intent_id é o atributo Data.ConsentId retornado no passo 2003.
- [opcional] heimdall.suppressRefreshToken
- [opcional] heimdall.accessTokenValidity
- [opcional] heimdall.refreshTokenValidity

###### Response (4006)
Status 302 (Redirect)
```json
Path Params	
Query Params	
Headers	Location: tppdomain.com
Body	
```


 
### Estágio 5

IT informa o token de acesso para a IR acessar API.

##### [IT→IR] Passo 5001 Envio de redirecionamento

A IT chama a url que recebeu na resposta 4006, para que a IR continue o fluxo de compartilhamento.

Request (5001)
```json
Path Params	
Query Params	
Headers	
Body
```	

- Os parâmetros desta requisição devem ser os recebidos no passo 4006

Response
Status OK


##### [IR→TB] Passo 5003 POST /token

Request (5003)
```json
Path Params	
Query Params	
Headers	Content-Type: application/x-www-form-urlencoded
Authorization: Basic {{basicToken}}
Body	grant_type=authorization_code
scope=accounts
code={{authorizationCode}}
redirect_uri={{redirectUrl}}
```

- grant_type é o tipo de autorização para obtenção do token de acesso. Neste passo, deve ter o valor “authorization_code”.
- scope é o escopo da operação.
- code é o código de autorização recebido pela IR na chamada do passo 5001.
- redirect_uri é a URL do passo 5001.


###### Response (5004)
```json
Headers	Content-Type: application/json; charset=utf-8
Body	{
    "access_token": "6132399a-5ba7-4179-a2e9-2917d8817dcf",
    "expires_in": 388800,
    "token_type": "Bearer",
    "scope": "openid accounts",
    "state": "29154610-c821-4b74-bb8f-e89316febade",
    "refresh_token": "f1744c81-71ff-489c-ad8a-88e434160c47",
    "id_token": "eyJhbGciOiJQUzI1NiIsImtpZCI6InRiYyJ9.eyJvcGVuYmFua2luZ19pbnRlbnRfaWQiOiJhYWMtZjM5ZjExNDQtMTcyNi00N2QzLTllYjMtYTY2ZDA0MGZhMjk0IiwiaXNzIjoiaHR0cHM6Ly9hdXRoMS5kZXYub3pvbmVhcGktYnIuY29tIiwiYXVkIjoiMDYwM2FiMjgtM2Y2OC00ZGRkLTg1NjctNTBkOWViYTczMDUyIiwiaWF0IjoxNjE3MTA1MjY0LCJleHAiOjE2MTcxMDg4NjQsIm5vbmNlIjoiYjJmYjNjMjktZjU3NS00MmVkLTliMWEtYTZlNjM5NGNjNmFmIiwiYXV0aF90aW1lIjoxNjE3MTA1MjY0LCJhenAiOiIwNjAzYWIyOC0zZjY4LTRkZGQtODU2Ny01MGQ5ZWJhNzMwNTIiLCJyZWZyZXNoX3Rva2VuX2V4cGlyZXNfYXQiOjE2MjQ4ODEyNjQsImNfaGFzaCI6Ik5JbUJCbWYzTlFwZy16eWhwZzc1U3ciLCJzX2hhc2giOiJwVC1HeGhBd2FVR19oTVFKTTdkU0x3IiwiYWNyIjoidXJuOm9wZW5iYW5raW5nOnBzZDI6c2NhIn0.0Dmr6QClxj-aqZvuKq1YacRNvffOSM4-LO23zMLgphwmWgut4wfQQwtnLL7FkHymnaA7d7nDQfRPh0V0ANZBRmk7cRM9CbBFIk1zzfrv9BfP8JLe4V-9O5AWfiWUCQtB_U3WNq4Od31m8Gbm1Ahd2_vcg6dHO6pZxEedw-ZoqoDXMRjlYzde4gLIam59gHQ8-wxyuBovprNCkszgjl6KTvjK0phDRH2oUYAmhbZuby6Aka2jboSQapDSWSfdWKqueoFiWa_zW7AxB9PYdVpRuXmHl5VomkN55f7HggDOPOfOvlEgdBFUSu2MkfYcuEwcGq2ssTYcZB110Xhk9FwL-Q"
}
```

- access_token é o token de acesso do TPP
- expires_in é o tempo de expiração do token
- token_type é o tipo de token. Esse tipo faz parte do atributo Authorization que é enviado para validação do token Authorization: token_type access_token
- scope é o request_scope com o protocolo de autenticação
- state é passado na uri que retorna o UUID
- refresh_token é um token com expiração maior, para que caso o token principal expire, não seja necessário redirecionar novamente para a tela de login, mas seu uso é opcional
- id_token é o ID do token, é um JWT.


 
### Estágio 6

IR chama a API de negócio.

##### [IR→TB] Passo 6000 GET /accounts

Request (6000)
```json
Path Params	
Query Params	
Headers	Content-Type: application/json
Authorization: Bearer {{token-from-auth-code-grant-accounts}}
x-fapi-financial-id: {{obParticipantId}}
x-fapi-interaction-id: {{interactionId}}
Body	
```

- token-from-auth-code-grant-accounts é o token de resposta do servidor de autorização para o TPP. É o “access_token” do step 5004.

Response (6005)
```json
Headers	Content-Type: application/json; charset=utf-8
x-fapi-interaction-id: c1f8f49a-2e3b-44d2-8f8d-d653c2d79f67
Body	{
    "Data": {
        "Account": [
            { ... },
            { ... },
            { ... },
            { ... }
        ]
    },
    "Links": {
        "Self": "https://rs1.dev.ozoneapi-br.com/open-banking/v3.1/aisp/accounts"
    },
    "Meta": {
        "TotalPages": 1
    }
}
```

- Retornar os dados da(s) conta(s)

##### [TB→IT] Passo 6002 GET /accounts

```json
Request (6002)
Path Params	
Query Params	
Headers	
Body	
```

- Xxx xxxx

Response (6003)
Headers	
Body	

- Xxxx





