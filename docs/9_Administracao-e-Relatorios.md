# Administração e Relatórios

- [1. Dashboard Inicial](#1-dashboard-inicial)
- [2. Relatórios de utilização das APIs](#2-relatórios-de-utilização-das-apis)
- [3. Gestão de Parceiros](#3-gestão-de-parceiros)
- [4. Autenticação via Auth0](#4-autenticação-e-federação-do-portal)
- [5. Segregação por Perfis de Acesso](#5-segregação-por-perfis-de-acesso)
- [6. Relatórios para o Banco central](#4)


A Plataforma de Open Banking da TecBan conta com um portal administrativo para controle de parceiros e relatórios, acesso à plataforma parametrizado para um melhor acompanhamento da equipe responsável pelo OpenBanking na Instituição Financeira.

# 1. Dashboard Inicial

O Dashboard inicial conta com uma visão geral da plataforma e link para as principais funcionalidades do sistema.

![Dashboard](../images/imagem_20.jpg)

# 2. Relatórios de utilização das APIs

Na [interface de relatório](https://admin.dev.ozoneapi-br.com/perry/report/report) os usuários podem consultar a utilização detalhada de todas as APIs do sistema.

![Utilização API](../images/imagem_19.jpg)


# 3. Gestão de Parceiros

A plataforma fornece uma gestão independente do diretório central para o [acesso de parceiros](https://admin.dev.ozoneapi-br.com/perry/software-statement/software-statements) estratégicos com acordos bilaterais para a gestão dos certificados e controle de acesso.

![Gestão de Parceiros](../images/imagem_18.jpg)


# 4. Autenticação e Federação do Portal

A Autenticação da plataforma utiliza o [Auth0](https://auth0.com/authentication) como Hub para conexão com qualquer gestor de identidade do utilizado pela instituição financeira.
- LDAP
- Active Directory
- SAML

![Autenticação](../images/imagem_21.png)

# 5. Segregação por Perfis de Acesso

Em contrução

# 6. Relatórios para o Banco central

Conforme a Resolução Conjunta nº 1 art. 33º - par. 1º o relatório deve abordar 5 temas:

- I - as demandas de clientes a respeito do compartilhamento registradas no período, segregando as decorrentes de fraudes das demais, com as providências adotadas para o seu tratamento;
- II - as demandas do canal de atendimento para a prestação de suporte técnico, segregando as relativas a indisponibilidade das interfaces dedicadas; 
- III - os incidentes relacionados com a violação da segurança dos dados e informações sobre serviços relacionados ao compartilhamento, bem como as medidas adotadas para a sua prevenção e solução 
- IV - os resultados dos testes de continuidade de negócios, considerando os cenários de indisponibilidade das interfaces utilizadas para o compartilhamento de que trata esta Resolução Conjunta;
- V - a quantidade de chamadas de interface no período, segregadas por cliente e por tipo de dado ou serviço compartilhado, bem como os indicadores referentes ao desempenho das interfaces usadas para o compartilhamento.

A TecBan não irá fornecer as informações para o tema I do relatório, pois o banco que possui as informações de seu canal de atendimento aos clientes.

Para os temas II, III, IV e V a TecBan irá enviar uma planilha ao representante do Banco para que juntamente com parte do banco o relatório possa ser enviado de forma completa. Conforme Resolução Conjunta nº 1 art. 33º o diretor responsável pelo compartilhamento deve enviar o relatório nas datas-bases de 30 de junho e 31 de dezembro. 

Conforme a Resolução Conjunta nº 1 art. 49º - inciso V a TecBan irá armazenar os dados dos temas II, III, IV e V pelo prazo de 5 anos, e fica a cargo do banco armazenar o tema I.
