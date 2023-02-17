Selecionando o maior codigo:
SELECT MAX(codigo) FROM `aluno` 

Selecionando o menor codigo:
SELECT MIN(codigo) FROM `aluno` 

Conta a quantidade de codigo:
SELECT COUNT(codigo) FROM `aluno` 

Soma os campos codigo:
SELECT SUM(codigo) FROM `aluno` 


Mostra a media de codigo:
SELECT SUM(codigo)/COUNT(codigo) FROM `aluno`

Mostra os alunos da disciplina
SELECT a.codigo, a.nome, d.codigo, d.cod_aluno, d.nome_disciplina
FROM aluno a, disciplina d
WHERE a.codigo = d.cod_aluno AND a.nome LIKE 'a%'
ORDER BY (a.nome) ASC;