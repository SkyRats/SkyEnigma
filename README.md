Assassinato na POLI-USP
=======================

         _________________________
        |  .-----------------.    |
        |  |    POLI - USP    |    |
        |  |  [ INTERDITADO ] |    |
        |  |_________________|     |
        |   ||             ||      |
        ~~~~ fita da policia ~~~~~~~~

CATATAU, estudante de Engenharia da Computacao, foi encontrado
morto no campus. Baixinho, brilhante, lingua afiada. A policia
nao tem suspeito. Tem voce.


## Como jogar

Abra um terminal, entre na pasta do caso e leia o arquivo de
abertura. Ele se chama `inicio`. NAO use editor de texto:
isto e uma investigacao por linha de comando.

Este caso e DIFICIL de proposito. Regras do jogo:

- Ninguem vai te dizer em que pasta entrar. O campus se explora
  sozinho. Aprenda a listar e a procurar.
- Nenhum arquivo diz "o assassino e fulano". O nome dos
  suspeitos esta separado das descricoes: as fichas usam
  CODIGOS (tipo SUSPEITO-03). Descobrir QUAL codigo e o
  culpado e so metade do trabalho; ligar o codigo a um nome
  e a outra metade.
- Nenhuma pista isolada acusa alguem. A verdade so aparece no
  CRUZAMENTO de varias listas diferentes. Voce vai ter que
  comparar arquivos, nao so le-los.
- Pistas enganam. Documento oficial vale mais que a palavra
  de um suspeito. Cruze tudo antes de cravar um nome.

Conhecer os suspeitos na vida real NAO ajuda: o nome do
culpado nao esta escrito em lugar nenhum ate voce resolver
o caso inteiro.


## Ferramentas

Investigue cada uma com `man <comando>` (saia com `q`):

    ls   cd   cat   head   tail   wc   sort   uniq   grep   find   unzip

Este caso se resolve afunilando: cada pista descarta
suspeitos, ate sobrar um. `grep` e `sort` bem usados fazem
todo o trabalho pesado.


## Trancas

Ha 3 arquivos `.zip` com senha, escondidos pelo campus.
Nenhuma senha esta escrita: todas se deduzem. Uma delas mora
fora do repositorio 


## Solucao

Mande no grupo "Encontrei o assassino" com nome e sobrenome.
3 chances. Chute errado queima chance. Prove antes de acusar.


## Creditos

Inspirado no "Command Line Murders" de Noah Veltman.
Adaptado para a POLI-USP / @ceuratos.
