# Conectividade


Para as Instituições Financeiras que ingressarem na rede Banco24Horas® será analisado o modelo de conectividade com a TecBan, que poderá envolver a contratação de link físico dedicado ou conectividade via internet. 
	

Para as Instituições Financeiras que já ingressaram no Banco24Horas® haverá uma avaliação sobre o uso do link já existente.


![Representação dos modelos de conectividade possíveis](../images/Conectividade_2.png)

> ## FAQ sobre conectividade:                      

#### 1. Quais são as opções de conectividade?
##### R: São 3 modelos disponíveis, sendo: Internet, Link dedicado e Link dedicado RTM.

#### 2. Quantos links são necessários se optarmos pelo link dedicado?
##### R: São 3 links para garantir a alta disponibilidade, no caso da instituição optar por usar apenas 2 será necessário assinar uma carta de risco.

#### 3. Posso utilizar a conexão via internet e depois migrar para um link dedicado?
##### R: Sim é uma prática bem comum, para atender prazos agressivos ou simplesmente iniciar a integração da forma mais simples possível muitos parceiros utilizam essa estratégia.

#### 4. O uso da VPN é uma opção para esse produto?
##### R: Não, por ser uma tecnologia mais antiga e não agregar em segurança, já que o Mtls já faz o papel de assegurar a origem e destino.

#### 5. Preciso utilizar o protocolo MTLS em todos os modelos de conectividade?
##### R: Sim, a plataforma de Open Banking da TecBan nasceu atendendo aos padrões de segurança da regulação, remover o Mtls seria um downgrade de segurança, e não recomendamos essa prática.

#### 6. Gostaria de aceitar chamadas somente dos IPs da TecBan, é possível?
##### R: Sim, segue abaixo nossos IPs fixos de saída da AWS (Conectividade via internet), para que você possa por exemplo configurar estes IPs em uma camada WAF.
- IP de Produção 177.71.135.59
- IP de Desenvolvimento 18.229.67.128
- IP de homologação 177.71.137.212

#### 7. Qual a banda necessária para suportar a solução?
##### R: Depende da previestimativa de volumetria, mas para te apoiar nessa análise tenha em mente que uma mensagem possui um tamanho em média de 2KB.

#### 8. Quais os endereços para instalação dos links e procedimento?
Datacenter TecBan - UOL/DIVEO (Principal)
Endereço: Av. Ceci, 1850 – (Área2, Cage 8 e 9)
Barueri SP
CEP 06460-120

Datacenter TecBan - VIVO (Principal 2)
Av. Marcos Penteado de Ulhôa Rodrigues, 1690
Santana de Parnaíba - SP
CEP 06543-001

Datacenter TecBan - CETEM (DR)
Endereço: Rua São Vicente, 237 1º Andar
Bela Vista - São Paulo/SP CEP 01314-010

Para realizar o estudo de viabilidade nos Datacenters TecBan, esta visita técnica conjunta com a operadora, pode ser realizado através de agendamento prévio de 48 horas, informando o nome e RG dos possíveis técnicos para a solicitação de liberação de acesso. A visita será acompanhada pela TecBan para disponibilização de espaço nos racks e demais requisitos técnicos.
O agendamento da visita técnica é realizado com a equipe TecBan  Centro de Gerenciamento de Redes – CGR, através de email ou telefone: cgr@TecBan.com.br – 11 4196-8421.

