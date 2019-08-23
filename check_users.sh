#! /bin/bash
# Checa e atualiza usuários nos grupos Alunos, Tecnicos e Professor
# no LDAP
# Data de Criação: 23/08/2019
# Samuel Barbosa  <samuel.barbosa@uft.edu.br>
# Jefferson Victor <jefferson.victor@uft.edu.br>

echo "Consultando Usuários existentes no grupo"
echo "."
echo ".."
echo "..."
echo "...."

sudo samba-tool group listmembers $@ > group_$@

echo "Consultado cargo dos usuários"
echo "."
echo ".."
echo "..."
echo "...."
echo "..."

sudo ldbsearch -H /var/lib/samba/private/sam.ldb title=$@ '(&(sAMAccountName))' | grep dn: | cut -d'=' -f2 | sed 's\,OU\\' > title_$@

echo "Comparando e limpando os duplicados"

grep -vf group_$@ title_$@ > clean_$@

input="clean_$@"

while IFS= read -r line
do
	sudo samba-tool group addmembers $@ $line
done < "$input"

echo "finalizado!"
