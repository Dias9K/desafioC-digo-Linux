#!/bin/bash

#Esse script tem como utilidade a criação de usuários e seus grupos, assim como seus
#respectivos diretórios e permissões. A fim de simular uma infraestrutura como código para
#que possa ser replicado em outras máquinas de forma automática, apenas executando o script.

#Criação dos diretórios
echo "Criando os diretórios..."
mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

#Criação dos grupos
echo "Criando os grupos dos usuários..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

#Criação dos usuários com o parâmetro -e no comando passwd, para que o próprio escolha sua senha
#Os usuários também já são designados aos seus respectivos grupos
echo "Criando os usuários do setor de administração..."
useradd carlos -m -s /bin/bash -G GRP_ADM
passwd carlos -e
useradd maria -m -s /bin/bash -G GRP_ADM
passwd maria -e
useradd joao -m -s /bin/bash -G GRP_ADM
passwd joao -e

echo "Criando os usuários do setor de vendas..."
useradd debora -m -s /bin/bash -G GRP_VEN
passwd debora -e
useradd sebastiana -m -s /bin/bash -G GRP_VEN
passwd sebastiana -e
useradd roberto -m -s /bin/bash -G GRP_VEN
passwd roberto -e

echo "Criando os usuários do setor do secretariado..."
useradd josefina -m -s /bin/bash -G GRP_SEC
passwd josefina -e
useradd amanda -m -s /bin/bash -G GRP_SEC
passwd amanda -e
useradd rogerio -m -s /bin/bash -G GRP_SEC
passwd rogerio -e

#Atribuindo o root como dono dos diretórios e dando permissões
echo "Nomeando root como dono dos diretórios e atribuindo as permissões dos mesmos..."
chmod 777 /publico
chown root:GRP_ADM /adm
chmod 770 /adm
chown root:GRP_VEN /ven
chmod 770 /ven
chown root:GRP_SEC /sec
chmod 770 /sec

echo "Encerrando..."
