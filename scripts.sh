#!/bin/bash

# Criando a pasta 'diretórios' e os subdiretórios dentro dela
mkdir -p /diretórios/publico
mkdir -p /diretórios/adm
mkdir -p /diretórios/ven
mkdir -p /diretórios/sec

# Criando grupos de usuários
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

# Criando usuários e adicionando aos grupos correspondentes
# Usuários do grupo GRP_ADM
useradd -m carlos
useradd -m maria
useradd -m joao
usermod -a -G GRP_ADM carlos
usermod -a -G GRP_ADM maria
usermod -a -G GRP_ADM joao

# Usuários do grupo GRP_VEN
useradd -m debora
useradd -m sebastiana
useradd -m roberto
usermod -a -G GRP_VEN debora
usermod -a -G GRP_VEN sebastiana
usermod -a -G GRP_VEN roberto

# Usuários do grupo GRP_SEC
useradd -m josefina
useradd -m amanda
useradd -m rogeria
usermod -a -G GRP_SEC josefina
usermod -a -G GRP_SEC amanda
usermod -a -G GRP_SEC rogeria

# Definindo senhas para os usuários
echo "Senha para usuário carlos:"
passwd carlos
echo "Senha para usuário maria:"
passwd maria
echo "Senha para usuário joao:"
passwd joao
echo "Senha para usuário debora:"
passwd debora
echo "Senha para usuário sebastiana:"
passwd sebastiana
echo "Senha para usuário roberto:"
passwd roberto
echo "Senha para usuário josefina:"
passwd josefina
echo "Senha para usuário amanda:"
passwd amanda
echo "Senha para usuário rogeria:"
passwd rogeria

# Atribuindo permissões nos diretórios conforme especificado

# 1. Para o diretório /diretórios/publico
chmod 777 /diretórios/publico

# 2. Para os diretórios específicos de cada grupo
# Usuários do grupo GRP_ADM
chown -R :GRP_ADM /diretórios/adm
chmod -R 770 /diretórios/adm

# Usuários do grupo GRP_VEN
chown -R :GRP_VEN /diretórios/ven
chmod -R 770 /diretórios/ven

# Usuários do grupo GRP_SEC
chown -R :GRP_SEC /diretórios/sec
chmod -R 770 /diretórios/sec

# Definindo permissões para diretórios de departamentos que não pertencem

# Usuários do grupo GRP_ADM
chmod -R o-rwx /diretórios/ven
chmod -R o-rwx /diretórios/sec

# Usuários do grupo GRP_VEN
chmod -R o-rwx /diretórios/adm
chmod -R o-rwx /diretórios/sec

# Usuários do grupo GRP_SEC
chmod -R o-rwx /diretórios/adm
chmod -R o-rwx /diretórios/ven

# Mensagem de conclusão
echo "Configuração concluída."

