# Liquibase-bootstrap - Um projeto de base para iniciar a utilização do Liquibase

Este é um projeto que auxiliar a começar a utilizar o Liquibase.

# install-lb.sh

Esse script irá instalar o Liquibase se você ainda não o tiver instalado.

# liquibase.sh

Wrapper para o liquibase, que economiza alguns comandos, principalmente em um fluxo padrão de criação dos scripts de alteração, onde 
roda-se o script primeiramente no ambiente local.

# add-changelogs.sh

Esse script irá adicionar todos os arquivos SQL da pasta changelogs para o arquivo changelog.xml, que é o arquivo utilizado pelo liquibase.sh
