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
- IP de homologação 18.229.67.128

