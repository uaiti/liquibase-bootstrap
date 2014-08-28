#!/bin/bash

help="
Utilização:
	./liquibase.sh --defaultsFile={ambiente}.properties [--changeLogFile={arquivo_changelog}] {comando} [{opções do comando}]
Onde:
	--defaultsFile = arquivo de configuração da conexão com o banco de dados
	--changeLogFile={arquivo_changelog} = Opcional. Se não for passado utiliza o arquivo changelog.xml. Indica qual o arquivo de changelog deve ser utilizado
	{comando} Um dos comandos do liquibase, como update, rollback, rollbackCount, etc
	{opcoes_do_comando} Quando o comando necessitar de alguma opção
"

# mostra a ajuda se não passar tudo
if [[ $# -eq 0 ]]; then
	echo -e "$help"
	exit
fi

# detecta os parametros
for i in $@; do
	item=`echo "$i" | cut -d '=' -f 1`
	if [[ "$item" == "--changeLogFile" ]]; then
		changelogfile=$i
	elif [[ "$item" == "--defaultsFile" ]]; then
		configfile=$i
	elif [[ -z "$command" ]]; then
		command=$i
	else
		options="$options "$i
	fi
done

# verifica quais comandos ficaram faltando
if [[ -z "$command" ]]; then
	echo -e "\033[31m Você precisa indicar qual o comando!\033[0m"
	exit 1
fi

if [[ -z "$configfile" ]]; then
	echo -e "\033[32m Iremos utilizar o arquivo local.properties. Se quiser utilizar outro, indique com a opção --defaultsFile \033[0m"
	configfile="--defaultsFile=local.properties"
	#echo "Você precisa indicar qual o arquivo de configuração (.properties)!"
	#exit 1
fi

if [[ -z "$changelogfile" ]]; then
	if [[ ! -f "changelog.xml" ]]; then
		echo -e "\033[31m Não foi informado um arquivo de changelog e não foi possível abrir o arquivo changelog.xml automaticamente \033[0m"
		exit 1
	fi
	changelogfile="--changeLogFile=changelog.xml"
fi

if [[ ! -f "liquibase/liquibase" ]]; then
	echo -e "\033[31m Você não tem instalado o liquibase. Tentei buscar em ./liquibase/liquibase. Execute o arquivo install-lb.sh.\033[0m"
	exit 1
fi

echo -e "-- \033[32m Lembre-se que se criou um novo arquivo você precisa executar o script add_changelog.php\033[0m";
#echo "./liquibase/liquibase $changelogfile $configfile $command $options"

./liquibase/liquibase $changelogfile $configfile $command $options
