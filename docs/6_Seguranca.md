# Segurança

**Documentação em atualização**

- [1. Armazenamento de chaves criptográficas (Cloud HSM)](#1-armazenamento-de-chaves-criptográficas-cloud-hsm)
- [2. Geração de certificado por parte da IF](#2-geração-de-certificado-por-parte-da-if)
- [3. Validade dos Certificados Digitais TecBan](#3-validade-dos-certificados-digitais-tecban)


Para consultar os requisitos de segurança do Open Banking Brasil, acesse [aqui](https://openbanking-brasil.github.io/areadesenvolvedor/#seguranca).


# 1. Armazenamento de chaves criptográficas (Cloud HSM)

Todas as chaves criptográficas do sistema são armazenadas no AWS CloudHSM, um Hardware Security Module (HSM – Módulo de segurança de hardware) baseado na nuvem que permite armazenar com total segurança as suas próprias chaves de criptografia na Nuvem AWS. Com o CloudHSM, gerenciamos chaves de criptografia usando HSMs validados pelo FIPS 140-2 nível 3. 

# 2. Geração de certificado por parte da IF

A IF deve gerar dois certificados com algoritmo de assinatura SHA-256 ou superior e chave RSA-2048 ou superior, e compartilhar a chave pública com a TecBan.
Um certificado será utilizado no ambiente não produtivo e o outro no ambiente produtivo.

O certificado para o ambiente não produtivo pode ser enviado para o e-mail _Grupo_OpenBanking_TI@tecban.com.br.

O certificado para o ambiente produtivo deve ser enviado por um representante previamente cadastrado do banco, para o e-mail openfinance@tecban.com.br com cópia para _Grupo_Seg_STR@tecban.com.br

É importante ressaltar que somente a chave pública pode ser compartilhada, caso a chave privada por engano seja enviada junto da pública o certificado deve ser desconsiderado devido a exposição de segurança e um novo certificado deve ser gerado.


# 3. Validade dos Certificados Digitais TecBan 

Os Certificados Digitais TecBan possuem **validade máxima de 1 ano**. 
A TecBan irá notificar a IF quanto a troca dos Certificados Digitais para programar a troca. É importante que a instituição trate a versão do certiticado.

 



