# Sandbox e Portal do Desenvolvedor

- [1. Sandbox](#1-sandbox)
- [2. Portal do Desenvolvedor](#2-portal-do-desenvolvedor)
- [3. Acesso a Sandbox](#3-acesso-a-sandbox)

# 1. Sandbox

![Dashboard](../images/imagem_26.png)

A fase de teste e homologação tem como finalidade garantir que os participantes que desejam operar no Ecossistema do Open Banking possam fazer isso de forma assertiva e segura. Isso inclui o suporte às instituições receptoras com a capacidade de testar seus produtos e serviços desde o lançamento, quanto nas atualizações, fornecendo uma série de ferramentas e infraestrutura no serviço de Diretório para garantir que seus produtos tenham sido testados tempestivamente antes de entrar em produção.
É obrigatório o teste e a homologação para instituição receptora e instituição transmissora. Instituições receptoras devem utilizar o serviço de Sandbox fornecido pelo Diretório.
As instituição transmissoras devem prover um ambiente de teste que possibilite as instituições receptoras autorizadas a realizarem testes de conexão e testes funcionais de seus produtos e serviços. Este recurso deve refletir ao máximo o ambiente de produção e deve fornecer o acesso aos desenvolvedores com os seguintes aspectos:

**Funcionalidade:** Deve incluir todas as funcionalidades da interface de produção relacionadas aos casos de uso. Deve funcionar de maneira equivalente ou representativa para a interface de produção, incluindo casos de uso negativos e códigos de erro.

**Segurança:** Deve utilizar o mesmo perfil de segurança das APIs em produção.

**On-boarding:** Deve replicar o processo de on-boarding das instalações de produção da instituição transmissora, incluindo o on-boarding e a troca de certificados para identificação e assinatura de mensagem.

**Certificados:** Deve permitir o uso de certificados de teste (que têm o mesmo formato/estrutura dos certificados de produção) de modo que as instituições receptoras possam replicar a funcionalidade relacionados à troca de certificados para identificação e assinatura de mensagens.

**Dados de teste:** Não deve incluir quaisquer dados reais de usuários finais. O volume e a variação dos dados devem ser suficientes para dar suporte a todos os testes técnicos e funcionais, incluindo paginação (onde for compatível com a interface dedicada).

**Contas de teste:** Deve fornecer para as instituições receptoras um número de contas de teste que habilitem a funcionalidade e o acesso aos dados que os usuários reais experimentarão na produção.

**Autenticação:** A instituição transmissora deve fornecer recurso que permita que as instituições receptoras testem os procedimentos de autenticação, inclusive em produção, utilizando suas próprias contas e/ou contas de teste.

**Disponibilidade e desempenho:** Não deve lidar com volumes de produção (ou seja, não deve ser usada por instituição transmissora ou instituição receptora para teste de estresse), no entanto, deve ter disponibilidade, capacidade, desempenho e outras características suficientes para facilitar a conexão eficaz e realista a testes funcionais da instituição receptora.

**Suporte:** A instalação deve ter um nível apropriado de suporte para permitir a comunicação de problemas ou questões por instituições receptoras para instituições transmissoras e fornecer soluções eficientes e eficazes.

**Documentação:** As instituições transmissoras devem publicar externamente um resumo das especificações da instalação de teste em seu site, incluindo detalhes de acesso e cobertura de teste.
Os testes devem garantir escopo mínimo para cobrir todos os casos de uso e de requisitos de segurança, evidenciados de forma que seja possível garantir que o processo de homologação foi efetuado.
Os testes para instituições receptoras devem acontecer em 3 etapas:

**Testes de integração:** Testes utilizando APIs de um Banco de exemplo no Sandbox do Diretório.

**Testes no Ecossistema:** Testes realizados no ecossistema apenas em Sandbox para validar novas funcionalidades ou melhorias.

**Testes de primeira ocorrência**: Testes baseados em acordos entre transmissoras e receptoras efetuados no ambiente de produção.
Ainda, recomenda-se que seja feito o teste de conformidade ao FAPI, disponível [aqui](https://openid.net/certification/fapi_op_testing/).


# 2. Portal do Desenvolvedor

A TecBan disponibiliza para os cliente um portal de desenvolvedor com toda a documentação das APIs e totalmente integrado com o Sandbox 

![OpenID](../images/imagem_24.jpg)


# 3. Acesso a Sandbox

O vídeo com explicação técnica sobre como se conectar no ambiente está disponível em : 


Português: https://patryk40.s3-sa-east-1.amazonaws.com/2020-07-02+08-51-59.mp4

Inglês: https://youtu.be/gNBZ1pTzw08


[Download das chaves de acesso ao nosso ambiente de Sandbox](https://1drv.ms/u/s!AmMxDxGhYOfggtZhGv78Fye8N8SIpg)
