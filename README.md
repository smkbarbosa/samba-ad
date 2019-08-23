# CHECK USERS

Objetivo: Verificar se os usuários fazem parte de determinado grupo no Active Directory.

Nosso AD importa os usuários e na descrição dos cargos é passado o atributo: professor, técnico e aluno. Para inserir nos respectivos grupos do Active Directory, o script verifica se os usuários que possuem o atributo especificado já estão inseridos no grupo, se não, insere-os.

Exemplo de uso:
```terminal
./check_users.sh aluno
```
