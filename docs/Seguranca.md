# Segurança

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