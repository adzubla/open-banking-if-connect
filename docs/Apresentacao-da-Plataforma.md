# Apresentação do Open Banking

- [1. Visão Geral](#especificação-plataforma-de-open-banking)
- [2. Identificação do Documento](#1-identificação-do-documento)
- [3. Definições e Abreviaturas](#2-definições-e-abreviaturas)
- [4. Visão Geral](#3-visão-geral)



# 1. Visão Geral

A solução da TecBan foi projetada para permitir a entrada das instituições financeiras de forma segura e eficiente no ecossistema de open banking brasileiro. Ao Aderir essa solução, os bancos conseguirão focar os seus recursos tecnológicos e capital humano em projetos que gerem valor para os seus clientes e acionistas, ao passo que a Tecban se encarrega de manter a instituição compliance perante as demandas regulatórias.


A solução  Open Banking as a Service TecBan foi criada a partir da união das melhores práticas de open banking desenvolvidas no Reino Unido, com o conhecimento do mercado brasileiro de serviços financeiros da Tecban, a qual atua com muita expertise nesse segmento


# 2. Plataforma de Open Banking

Os bancos precisam de uma plataforma especializada para realizar a exposição de APIs, de maneira segura e fazer certo as coisas difíceis.
Os 6 pilares da Plataforma de Open Banking da TecBan, representam a solução para o problema acima.

![Imagem 1](../images/imagem_1.jpg)

![Imagem 1](../images/imagem_3.jpg)


# 3 Papeis e Responsabilidade

A figura abaixo representa em cinza os pontos do ecossistema do Open Banking que a Plataforma irá lhe apoiar:

![Imagem 1](../images/imagem_2.jpg)

# 4. Arquitetura

![Imagem 1](../images/imagem_5.jpg)


# 4.1. Desenho dos serviços

![Imagem 1](../images/imagem_4.jpg)




## 3.11. Utilização do Swagger (OpenAPI 3)

Para visualizar o detalhamento dos campos que deseja consultar no swagger, basta acessar no [link](https://editor.swagger.io/).
Selecione “File/Import File” para importar os arquivos yml disponíveis juntamente com essa Especificação Técnica Funcional.

## 3.12. Esquema Swagger Tecban

 * **Formato date-time ( GMT +0 )**

Os swaggers da TecBan utilizam o padrão GMT + 0 nos campos com o formato “date-time”.
Dessa forma, ao consumir as APIs da TecBan utilizar esse esquema definido no swagger.
<br />
Exemplo:

![Imagem 13](../images/imagem_13.jpg)



# 8. Histórico de Alterações do Documento

| Versão | Data       | Autor                        | Alteração                          |
|--------|------------|------------------------------|------------------------------------|
| 1.0    | 23/02/2021 | Josué Jofre e Luiz Nugnes    | Criação do documento               |
| 1.1    | 15/03/2021 | Josué Jofre                  | Adicionado referência ao documento |
| 1.2    | 31/03/2021 | Alexandro T. Netto           | Documentação no Stoplight          |
| 1.2    | 06/04/2021 | Luiz Gustavo Nugnes          | Adequação à proposta comercial     |

# 9. Documentos de apoio

| Versão                      | Descrição                                                         |
|-----------------------------|-------------------------------------------------------------------|
| Versão 2.2 Lançamento 26.4  | [Bank Connect PIS.yaml](https://docs.sfa.tecban.com.br/docs/open-banking-if-connect/Bank%20Connect%20PIS.yaml)                                            |
| Versão 2.2 Lançamento 30.1  | [Bank Connect AIS APIs.yaml](https://docs.sfa.tecban.com.br/docs/open-banking-if-connect/Bank%20Connect%20AIS%20APIs.yaml)                                       |
| Versão 2.2 Lançamento 26.4  | [Consent Manager APIs.yaml](https://docs.sfa.tecban.com.br/docs/open-banking-if-connect/Consent%20Manager%20APIs.yaml)                                        |
| Versão 2.2 Lançamento 26.4  | [Headless Heimdall APIs.yaml](https://docs.sfa.tecban.com.br/docs/open-banking-if-connect/Headless%20Heimdall%20APIs.yaml)                                       |
| Versão 1.0                  | Plano de disaster recovery, nome do documento [Open_Banking_DR.doc](https://docs.sfa.tecban.com.br/docs/open-banking-if-connect/Open_Banking_DR.doc) |
| Versão 1.01.01 - 05/03/2021 | [Jornadas de usuário.pdf](https://docs.sfa.tecban.com.br/docs/open-banking-if-connect/Jornadas%20de%20usuário.pdf)                                           |