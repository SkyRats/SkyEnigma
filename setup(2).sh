#!/usr/bin/env bash
#
# Assassinato na POLI-USP — gerador do repositorio (versao investigativa)
# Rode este script uma vez.   Uso:  bash setup.sh
#
set -euo pipefail

RAIZ="assassinato-poli"
[ -e "$RAIZ" ] && { echo "A pasta '$RAIZ' ja existe. Apague antes de rodar."; exit 1; }
command -v zip >/dev/null 2>&1 || { echo "Instale o 'zip': sudo apt install zip"; exit 1; }

echo "Montando o campus da POLI-USP..."

# ---------------------------------------------------------------------------
# ESTRUTURA  (varios predios; nada disso e revelado ao jogador)
# ---------------------------------------------------------------------------
for d in \
  campus/predio_da_eletrica/sala_da_turma \
  campus/predio_da_eletrica/laboratorio \
  campus/predio_da_eletrica/corredor \
  campus/predio_da_eletrica/secretaria \
  campus/predio_da_eletrica/almoxarifado \
  campus/bienio/sala_de_aula \
  campus/bienio/atletica \
  campus/bienio/xerox \
  campus/predio_da_mecanica/oficina \
  campus/predio_da_mecanica/sala_de_aula \
  campus/predio_da_civil/canteiro \
  campus/predio_da_civil/sala_de_aula \
  campus/citi/recepcao \
  campus/citi/coworking \
  campus/bandejao \
  campus/arquivo_morto/caixa_a \
  campus/arquivo_morto/caixa_b ; do
  mkdir -p "$RAIZ/$d"
done
cd "$RAIZ"

# ===========================================================================
# README.md
# ===========================================================================
cat > README.md <<'EOF'
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
fora do repositorio — Instagram @ceuratos.
Senhas: letra minuscula, sem acento.


## Solucao

Mande no grupo "Encontrei o assassino" com nome e sobrenome.
3 chances. Chute errado queima chance. Prove antes de acusar.


## Creditos

Inspirado no "Command Line Murders" de Noah Veltman.
Adaptado para a POLI-USP / @ceuratos.
EOF

# ===========================================================================
# inicio  — enredo puro, ZERO caminho de pasta
# ===========================================================================
cat > inicio <<'EOF'
=============================================================
        BOLETIM DE OCORRENCIA - POLICIA DO TERMINAL
=============================================================

CASO: morte de CATATAU
LOCAL: campus da Escola Politecnica da USP
QUANDO: noite de uma terca-feira

-------------------------------------------------------------

Catatau cursava Engenharia da Computacao. Tinha a mente mais
afiada da turma e uma lingua que nao poupava ninguem. Quem e
brilhante demais acumula inimigos sem perceber.

A pericia despejou TODO o material do caso no campus digital.
Nao existe indice. Nao existe mapa. Nao existe ninguem pra te
dizer por onde comecar. Detetive de verdade levanta a propria
pista.

O QUE SE SABE:
- O corpo foi achado na na sala da engenharia da computação...
- A pericia deixou um laudo nessa sala, descrevendo o que o
  assassino fez e que marcas deixou.
- Existem oito suspeitos. As fichas deles nao usam nomes, e
  sim codigos. Os nomes verdadeiros estao guardados a parte,
  trancados.
- Varias listas oficiais foram apreendidas: registro de
  catraca, mapa de cadeiras da turma, controle academico,
  controle academico. Cada fonte, sozinha, nao acusa ninguem.

O QUE VOCE PRECISA FAZER:
Explorar o campus, encontrar o laudo, encontrar as fichas e
encontrar as listas. Depois CRUZAR tudo: so o cruzamento das
listas faz um unico codigo sobrar. Esse codigo, ligado ao
nome verdadeiro, e o seu assassino.

AVISO DO DELEGADO:
Tem suspeito que mente o proprio curso. Tem suspeito que
parece encaixar e nao e. Nao confie numa fonte so, cruze
tudo. E nao chute: sao 3 chances.

O Catatau conta com voce. Comece a procurar.
EOF

# ===========================================================================
# LAUDO DA PERICIA  — descreve o metodo, sem citar pasta nem dar comando
# ===========================================================================
cat > campus/predio_da_eletrica/sala_da_turma/laudo_da_pericia.txt <<'EOF'
LAUDO DA PERICIA - SALA DA TURMA DE ENG. COMPUTACAO
====================================================

Houve luta. O assassino saiu as pressas. Tres fontes de prova, cruzadas entre si, isolam uma unica
pessoa entre os oito suspeitos fichados.

ATENCAO: nenhuma das tres fontes abaixo, sozinha, aponta um
culpado. Varias pessoas batem com uma ou duas. So quem
sobrevive as TRES e o assassino. E preciso cruzar.

-------------------------------------------------------------
FONTE 1 - DESCRICAO FISICA (das testemunhas)
Tres testemunhas, ouvidas separadamente, viram quem fugiu.
O retrato falado combinado: pessoa de oculos presos por
cordao no pescoco, com bigode, e de aparencia muito cuidada,
do tipo vaidoso e bem vestido.
As fichas dos suspeitos trazem essas caracteristicas em texto.
Cuidado: "barba" nao e "bigode"; quem so tem barba nao bate.
Cuidado: quem fez cirurgia e nao usa mais oculos nao bate.

FONTE 2 - TURMA DO CATATAU
O assassino e da PROPRIA turma do Catatau, Eng. Computacao.
Existe um mapa de cadeiras da turma. CUIDADO: ha suspeito que
mente o proprio curso. Confirme cada nome da turma cruzando o
mapa de cadeiras com o controle academico oficial. So vale
quem o documento oficial confirma como sendo da computacao.

FONTE 3 - JANELA DO CRIME
O crime ocorreu entre 18h50 e 19h10. O log da catraca registra
entrada e saida de cada matricula no predio. So interessa quem
ESTAVA DENTRO durante essa janela inteira: entrou antes de
18h50 e saiu depois de 19h10. Quem entrou e saiu fora dessa
janela nao e suspeito — inclusive quem tinha treino ou outro
compromisso na hora.

-------------------------------------------------------------
COMO O CASO SE RESOLVE

As fichas usam codigos (SUSPEITO-01 a SUSPEITO-08), nunca
nomes. Algumas listas oficiais usam codigo; outras usam o
NUMERO DE MATRICULA. Existe um documento que liga codigo,
matricula e nome — mas esse esta trancado.

O caminho: a cada fonte, descarte os codigos que nao batem.
Comece pelas fichas, va eliminando, confira na fonte seguinte.
Quando so um codigo sobreviver as tres fontes, voce achou o
assassino — em codigo. Use entao a tabela trancada para
revelar o nome verdadeiro.

Documentos oficiais (catraca, controle academico) valem mais
que o que um suspeito declara sobre si mesmo.
EOF

# a "cena" tambem tem uma pista da 1a senha, indireta
cat > campus/predio_da_eletrica/sala_da_turma/objetos_recolhidos.txt <<'EOF'
OBJETOS RECOLHIDOS NA CENA
---------------------------
- copo plastico, sem digitais uteis
- folha amassada com rabiscos de codigo-fonte
- um cordao de oculos partido (ja citado no laudo)
- pegadas de calcado de SOLA LISA, tipo social, no po do chao

Observacao da pericia sobre as pegadas: a sola lisa NAO
corresponde ao calcado de quem fugiu. As cameras de seguranca,
em outro ponto do predio, registraram o calcado real do
fugitivo. Esse calcado real importa: e a senha de uma das
trancas. Procure o registro das cameras.
EOF

# ===========================================================================
# FICHAS DOS SUSPEITOS  — so CODIGO, descricao em prosa, sem nome
# guardadas numa pasta de arquivo morto (jogador acha explorando)
# ===========================================================================
F="campus/arquivo_morto/caixa_a"

cat > "$F/ficha_SUSPEITO-01.txt" <<'EOF'
FICHA DE SUSPEITO - ARQUIVO RESERVADO
======================================
CODIGO: SUSPEITO-01

Pessoa de oculos presos por cordao no pescoco. Mantem um
bigode espesso e aparado. Sobre o estilo: anda sempre de
bermuda gasta, camiseta velha de evento e chinelo de dedo.
Visual relaxado, nunca foi de se arrumar.

Vinculo com a vitima: convivia de perto, mesma turma.
EOF

cat > "$F/ficha_SUSPEITO-02.txt" <<'EOF'
FICHA DE SUSPEITO - ARQUIVO RESERVADO
======================================
CODIGO: SUSPEITO-02

Usa oculos com cordao de seguranca. Quanto a pelos faciais:
tem barba cheia e fechada, do tipo lenhador. E barba inteira,
sem bigode recortado a parte. Vaidoso, muito bem vestido,
costuma ser o mais elegante do ambiente.

Vinculo com a vitima: trabalhavam juntos em laboratorio.
EOF

cat > "$F/ficha_SUSPEITO-03.txt" <<'EOF'
FICHA DE SUSPEITO - ARQUIVO RESERVADO
======================================
CODIGO: SUSPEITO-03

Tem bigode marcante e e bastante estiloso, das pessoas mais
bem montadas do predio. Porem fez cirurgia de correcao visual
no ano passado e desde entao nao usa oculos de grau — logo,
nao usa cordao de oculos.

Vinculo com a vitima: vivia discutindo nota com o Catatau.
EOF

cat > "$F/ficha_SUSPEITO-04.txt" <<'EOF'
FICHA DE SUSPEITO - ARQUIVO RESERVADO
======================================
CODIGO: SUSPEITO-04

Usa oculos presos por cordao. Tem bigode forte. E o mais
vaidoso e estiloso de todos os suspeitos. No quesito
aparencia, bate com tudo que as testemunhas descreveram.

Declara ser da turma de Eng. Computacao. ATENCAO: o que o
suspeito declara sobre o proprio curso nao e prova. Confira
no controle academico oficial.
EOF

cat > "$F/ficha_SUSPEITO-05.txt" <<'EOF'
FICHA DE SUSPEITO - ARQUIVO RESERVADO
======================================
CODIGO: SUSPEITO-05

Usa oculos com cordao. Tem um bigode fino. Sobre o estilo:
anda de moletom amassado todos os dias, cabelo por pentear,
nenhuma vaidade. Passa despercebido no corredor.

Vinculo com a vitima: sentava longe, quase nao se falavam.
EOF

cat > "$F/ficha_SUSPEITO-06.txt" <<'EOF'
FICHA DE SUSPEITO - ARQUIVO RESERVADO
======================================
CODIGO: SUSPEITO-06

Usa oculos com cordao, tem bigode e e bem estiloso. Tres
caracteristicas que batem com as testemunhas.

Declara ser da turma de Eng. Computacao. ATENCAO: confira o
curso no controle academico oficial antes de qualquer coisa.
EOF

cat > "$F/ficha_SUSPEITO-07.txt" <<'EOF'
FICHA DE SUSPEITO - ARQUIVO RESERVADO
======================================
CODIGO: SUSPEITO-07

Usa oculos com cordao e e elegante, sempre bem vestido. O
rosto, porem, e completamente raspado: sem barba e sem
bigode, pele lisa.

Vinculo com a vitima: eram amigos, sem desavenca conhecida.
EOF

cat > "$F/ficha_SUSPEITO-08.txt" <<'EOF'
FICHA DE SUSPEITO - ARQUIVO RESERVADO
======================================
CODIGO: SUSPEITO-08

Usa oculos presos por cordao no pescoco. Tem bigode marcante,
desenhado, sem barba ao redor dele. E vaidoso e muito bem
vestido, do tipo que chama atencao quando passa.

Vinculo com a vitima: tinha atrito conhecido com o Catatau.
EOF

# pista textual: o que cada marca elimina, mas SEM dar codigo de assassino
cat > campus/citi/recepcao/sintese_testemunhas.txt <<'EOF'
SINTESE DOS DEPOIMENTOS - RECEPCAO DO CITI
-------------------------------------------
Cruzando as tres testemunhas, a pessoa que fugiu tinha, ao
mesmo tempo: oculos com cordao + bigode (de verdade, nao
barba) + aparencia vaidosa e estilosa.

Compare isso com as oito fichas. Varias fichas batem em uma
ou duas dessas coisas. Anote APENAS os codigos cujas fichas
batem nas TRES de uma vez. Essa e a sua primeira lista.
EOF

# ===========================================================================
# LISTAS OFICIAIS  — as fontes a cruzar (codigo x matricula)
# ===========================================================================

# F5 parcial publica: codigo <-> matricula  (o NOME nao esta aqui!)
cat > campus/predio_da_eletrica/secretaria/codigos_e_matriculas.txt <<'EOF'
TABELA CODIGO x MATRICULA  (controle academico - parte publica)
----------------------------------------------------------------
Esta tabela liga cada CODIGO de suspeito ao numero de
matricula. O NOME verdadeiro do aluno NAO esta aqui: nomes
ficam no documento trancado.

codigo        matricula
-----------   ---------
SUSPEITO-01   40118
SUSPEITO-02   40231
SUSPEITO-03   40347
SUSPEITO-04   50412
SUSPEITO-05   40559
SUSPEITO-06   60688
SUSPEITO-07   40703
SUSPEITO-08   40815
EOF

# F1: mapa de cadeiras da turma do catatau (usa CODIGO)
cat > campus/predio_da_eletrica/sala_da_turma/mapa_de_cadeiras.txt <<'EOF'
MAPA DE CADEIRAS - TURMA DE ENG. COMPUTACAO DO CATATAU
-------------------------------------------------------
Codigos com cadeira fixa NESTA turma (e portanto com cracha
de acesso ao predio da eletrica):

SUSPEITO-01
SUSPEITO-02
SUSPEITO-03
SUSPEITO-05
SUSPEITO-07
SUSPEITO-08

Quem nao esta nesta lista nao e da turma do Catatau, mesmo
que diga ser. Confirme cruzando com o controle academico.
EOF

# controle academico oficial (curso por matricula) - desmascara mentirosos
cat > campus/predio_da_eletrica/secretaria/controle_academico.txt <<'EOF'
CONTROLE ACADEMICO OFICIAL - POLI-USP
--------------------------------------
Curso de cada matricula. Documento oficial: vale mais que a
declaracao do proprio suspeito.

matricula   curso
---------   --------------------------
40118       engenharia da computacao
40231       engenharia da computacao
40347       engenharia da computacao
50412       engenharia mecanica
40559       engenharia da computacao
60688       engenharia civil
40703       engenharia da computacao
40815       engenharia da computacao

Nota da secretaria: duas matriculas acima NAO sao de Eng.
Computacao, apesar de seus donos as vezes se dizerem "da
computacao". O papel oficial nao mente.
EOF

# F2 + F3: log da catraca (usa MATRICULA, com horarios)
cat > campus/predio_da_eletrica/corredor/log_catraca.txt <<'EOF'
LOG DA CATRACA - PREDIO DA ELETRICA - TERCA-FEIRA
--------------------------------------------------
A catraca so abre para cracha de aluno da Eng. Computacao.
Cada linha: matricula, entrada, saida.

matricula   entrada   saida
---------   -------   -------
40231       17:05     18:20
40118       18:32     20:11
40347       18:40     19:55
40703       18:41     18:49
40559       18:45     20:30
40815       18:48     19:14

Lembrete da pericia: a janela do crime e 18h50-19h10. Para
ser suspeito de verdade, a matricula tem que ter ENTRADO antes
de 18h50 E so ter SAIDO depois de 19h10 — ou seja, estar
dentro do predio durante a janela inteira.
EOF

# ===========================================================================
# RUIDO (~80 arquivos) + obfuscacao das pistas de senha
# ===========================================================================
gera_ruido () {
  local pasta="$1" prefixo="$2" qtd="$3" i
  for i in $(seq 1 "$qtd"); do
    cat > "${pasta}/${prefixo}_${i}.txt" <<EOF
DOCUMENTO ADMINISTRATIVO ${prefixo} N${i}
-------------------------------------------
Papelada de rotina da POLI-USP. Irrelevante para o caso.
Nem ficha, nem lista, nem pista. Siga investigando.
EOF
  done
}
gera_ruido campus/predio_da_eletrica/laboratorio  experimento    8
gera_ruido campus/predio_da_eletrica/almoxarifado inventario     6
gera_ruido campus/predio_da_eletrica/secretaria   oficio         6
gera_ruido campus/bienio/sala_de_aula             prova_velha    8
gera_ruido campus/bienio/xerox                    apostila       7
gera_ruido campus/predio_da_mecanica/oficina      ordem_servico  7
gera_ruido campus/predio_da_mecanica/sala_de_aula lista_exerc    6
gera_ruido campus/predio_da_civil/canteiro        relatorio_obra 7
gera_ruido campus/predio_da_civil/sala_de_aula    trabalho       6
gera_ruido campus/citi/recepcao                   protocolo      5
gera_ruido campus/citi/coworking                  reserva_sala   5
gera_ruido campus/bandejao                        cardapio       4
gera_ruido campus/arquivo_morto/caixa_b           processo       8

# OBFUSCACAO 1: cameras com a pista da senha no fim de arquivo longo
{
  echo "REGISTRO DAS CAMERAS DE SEGURANCA - PREDIO DA ELETRICA"
  echo "======================================================="
  echo "Transcricao quadro a quadro. Documento longo."
  echo ""
  for i in $(seq 1 360); do
    printf "quadro %04d  | corredor vazio, sem movimento relevante\n" "$i"
  done
  echo ""
  echo "quadro 0361  | 19:13 - pessoa desce a escada quase correndo"
  echo "quadro 0362  | 19:13 - ajeita o cordao dos oculos no pescoco"
  echo "quadro 0363  | 19:13 - pes nitidos: a pessoa fugiu de TENIS."
  echo "             | (nao era chinelo, nao era sapato social)"
  echo "             | ESSE CALÇADO É A SENHA DE UMA TRANCA ."
  for i in $(seq 364 470); do
    printf "quadro %04d  | saida do predio vazia, sem movimento\n" "$i"
  done
} > campus/predio_da_eletrica/corredor/cameras_seguranca.txt

# OBFUSCACAO 2: pista da senha 2 perdida no meio de uma lista enorme
{
  echo "MURAL DE RECADOS DO BIENIO"
  echo "=========================="
  for i in $(seq 1 150); do
    echo "recado $i: vende-se apostila usada, procurar o CA."
  done
  echo "recado 151: [RECADO DA POLICIA] uma das trancas tem a senha"
  echo "            publicada na PRIMEIRA postagem do instagram"
  echo "            @ceuratos. so existe la fora."
  for i in $(seq 152 280); do
    echo "recado $i: vende-se apostila usada, procurar o CA."
  done
} > campus/bienio/xerox/mural_de_recados.txt

# OBFUSCACAO 3: arquivo de nome enganoso explica a senha do zip final
cat > campus/predio_da_mecanica/oficina/tabela_de_torque.txt <<'EOF'
TABELA DE TORQUE DA OFICINA
----------------------------
(nome de papelada chata, de proposito)

Recado da pericia escondido aqui:

A ultima tranca guarda os NOMES verdadeiros dos suspeitos.
A senha dela e um numero por extenso, em minusculo.

Esse numero e a quantidade de matriculas que, segundo o LOG
DA CATRACA, estiveram dentro do predio durante a janela
inteira do crime (entrou antes de 18h50 e saiu depois de
19h10). Conte com cuidado, comparando entrada e saida linha
a linha. Escreva o numero por extenso.
EOF

# armadilhas de grep ingenuo
cat > campus/bienio/xerox/lista_de_compras.txt <<'EOF'
lista de compras do centro academico
- cafe, copos, canetas, papel
- um bigode falso pra festa a fantasia (NAO e pista)
- oculos de brinde sem grau (sem cordao)
nao e ficha de suspeito.
EOF
cat > campus/predio_da_civil/sala_de_aula/conto_literario.txt <<'EOF'
conto para a aula de portugues
"o homem de bigode e oculos era elegante e misterioso..."
ficcao. nao e ficha. so confunde quem usa grep sem pensar.
EOF

# ===========================================================================
# TRANCAS  (3 zips; senhas deduzidas)
#  1) tranca_um.zip      senha: tenis    (calcado nas cameras)
#  2) tranca_dois.zip    senha: skyrats  (Instagram @ceuratos)
#  3) tranca_tres.zip    senha: quatro  (4 matriculas na janela do crime)
# ===========================================================================

# tranca_um: orienta o cruzamento, sem dar resposta
TMP="$(mktemp -d)"
cat > "$TMP/orientacao_de_cruzamento.txt" <<'EOF'
ORIENTACAO DE CRUZAMENTO - INTELIGENCIA DA POLICIA
---------------------------------------------------
Voce abriu a primeira tranca. Bom. Agora o metodo:

Trabalhe com TRES fontes, afunilando:

 FONTE 1 - as fichas dos suspeitos. Anote os codigos cujas
           fichas batem, ao mesmo tempo, em: oculos com
           cordao + bigode de verdade (nao barba) + estilo
           vaidoso. Varias fichas batem em uma ou duas
           coisas; poucas batem nas tres.

 FONTE 2 - a turma do Catatau. O mapa de cadeiras lista
           codigos; o controle academico lista cursos por
           matricula. Confronte os dois: ha suspeito que se
           diz da computacao sem ser. Dos codigos da FONTE 1,
           descarte quem nao for confirmado na turma.

 FONTE 3 - o log da catraca. Traduza os codigos restantes
           para matricula (ha uma tabela para isso) e veja
           quem estava DENTRO do predio na janela do crime
           (entrou antes de 18h50, saiu depois de 19h10).

Ao fim das tres fontes sobra um unico codigo: o assassino.
Nao precisa de comando exotico — `grep`, `sort` e `uniq`,
bem usados, dao conta de filtrar e conferir cada passo.


EOF
( cd "$TMP" && zip -q -P tenis tranca_um.zip orientacao_de_cruzamento.txt )
mv "$TMP/tranca_um.zip" campus/predio_da_eletrica/almoxarifado/tranca_um.zip
rm -rf "$TMP"

# tranca_dois: estreita mais, ainda sem nome
TMP="$(mktemp -d)"
cat > "$TMP/nota_da_testemunha.txt" <<'EOF'
NOTA DA TESTEMUNHA PROTEGIDA
-----------------------------
Segunda tranca aberta. Falta pouco.

Confirmo pelo que vi: quem subiu para a sala do Catatau e
ficou la durante a janela do crime era da turma dele, tinha
bigode (nao barba), oculos no cordao e era o mais arrumado
da sala.

Isso — caracteristicas, turma confirmada no controle
academico e presenca no log da catraca — deixa um unico
CODIGO de pe.

Mas codigo nao se entrega na delegacia: a policia quer NOME.
O nome de cada codigo esta na ultima tranca. A senha dela e
o numero de matriculas que estavam dentro do predio durante
a janela inteira do crime, por extenso, em minusculo. O
arquivo de nome 'tabela_de_torque', na oficina da mecanica,
explica como contar.
EOF
( cd "$TMP" && zip -q -P skyrats tranca_dois.zip nota_da_testemunha.txt )
mv "$TMP/tranca_dois.zip" campus/citi/coworking/tranca_dois.zip
rm -rf "$TMP"

# tranca_tres: a tabela final codigo<->nome
TMP="$(mktemp -d)"
cat > "$TMP/identidades_reveladas.txt" <<'EOF'
=============================================================
        IDENTIDADES REVELADAS - ARQUIVO LACRADO
=============================================================
Tabela oficial que liga cada codigo de suspeito ao nome real.
So abra isto quando ja tiver o CODIGO do assassino — senao o
nome nao significa nada.

codigo        nome verdadeiro
-----------   -----------------------
SUSPEITO-01   Guanambi
SUSPEITO-02   Lucas Casado
SUSPEITO-03   Gustavo
SUSPEITO-04   Dudu Gonzalez
SUSPEITO-05   Gui Santos
SUSPEITO-06   Felps
SUSPEITO-07   Vini CCO
SUSPEITO-08   Jorge

Pegue o codigo que sobreviveu ao cruzamento das tres fontes
e leia o nome ao lado. Esse e o assassino do Catatau.

Mande no grupo: "Encontrei o assassino" com o nome e o
sobrenome. O nome completo e a senha da proxima etapa.
=============================================================
EOF
( cd "$TMP" && zip -q -P quatro tranca_tres.zip identidades_reveladas.txt )
mv "$TMP/tranca_tres.zip" campus/bandejao/tranca_tres.zip
rm -rf "$TMP"

# ===========================================================================
# GABARITO DO MONITOR  (APAGUE antes de publicar para os calouros)
# ===========================================================================
cat > GABARITO_MONITOR.txt <<'EOF'
=============================================================
   GABARITO - SOMENTE O MONITOR. NAO PUBLICAR.
   Apague este arquivo antes de subir o repo para os calouros.
=============================================================

ASSASSINO: SUSPEITO-08 = Jorge

AS TRES FONTES QUE O JOGADOR PRECISA CRUZAR:

FONTE 1 - fichas que batem nas 3 caracteristicas das
          testemunhas (oculos+cordao, bigode de verdade,
          estiloso):
   passam -> S04, S06, S08
   (S01 e S05 nao sao estilosos; S02 e S07 sem bigode, so
    barba/rosto raspado; S03 fez cirurgia, nao usa oculos)

FONTE 2 - turma do Catatau, confirmada no controle academico
          oficial (mapa_de_cadeiras cruzado com
          controle_academico):
   turma de verdade -> S01, S02, S03, S05, S07, S08
   (S04 e Eng. Mecanica, matricula 50412;
    S06 e Eng. Civil, matricula 60688;
    os dois se dizem da computacao, o oficial desmente)

FONTE 3 - matriculas dentro do predio na janela 18h50-19h10,
          traduzidas para codigo pela tabela:
   catraca:  40118 (18:32-20:11) dentro -> S01
             40231 (17:05-18:20) fora
             40347 (18:40-19:55) dentro -> S03
             40703 (18:41-18:49) fora
             40559 (18:45-20:30) dentro -> S05
             40815 (18:48-19:14) dentro -> S08
   dentro da janela -> S01, S03, S05, S08

CRUZAMENTO  FONTE 1 ∩ FONTE 2 ∩ FONTE 3:
   F1 = {S04, S06, S08}
   F2 = {S01, S02, S03, S05, S07, S08}
   F3 = {S01, S03, S05, S08}
   F1 ∩ F2 = {S08}   (S04 e S06 caem: nao sao da turma)
   ∩ F3    = {S08}   (confirma)
   => UNICO: SUSPEITO-08 -> Jorge

POR QUE CADA SUSPEITO CAI:
   S01 Guanambi      - nao e estiloso            (FONTE 1)
   S02 Lucas Casado  - barba, nao bigode         (FONTE 1)
   S03 Gustavo       - cirurgia, sem oculos      (FONTE 1)
   S04 Dudu Gonzalez - Eng. Mecanica             (FONTE 2)
   S05 Gui Santos    - anda de moletom           (FONTE 1)
   S06 Felps         - Eng. Civil                (FONTE 2)
   S07 Vini CCO      - sem bigode + fora da janela (F1 e F3)
   S08 Jorge         - passa nas 3 -> CULPADO

SENHAS DAS TRANCAS:
  tranca_um.zip   -> tenis
     (cameras_seguranca.txt, quadro 0363, no fim do arquivo
      longo: o fugitivo estava de tenis)
  tranca_dois.zip -> skyrats
     (primeira postagem do @ceuratos; publique "skyrats" la)
  tranca_tres.zip -> quatro
     (matriculas dentro do predio durante a janela inteira
      18h50-19h10, ou seja entrou antes de 18:50 e saiu depois
      de 19:10: 40118, 40347, 40559, 40815 = 4 matriculas.
      40231 saiu 18:20 e 40703 saiu 18:49 -> ambas fora.)

OBSERVACAO SOBRE A FONTE 3 (codigos vs matriculas):
   as 4 matriculas acima viram S01, S03, S05, S08 pela tabela
   codigos_e_matriculas.txt. Note que S08 (Jorge, 40815) entrou
   18:48 e saiu 19:14 — colado na janela, mas dentro.
EOF

cd ..
TOTAL=$(find "$RAIZ" -type f | wc -l)
echo ""
echo "Pronto! Campus criado em '$RAIZ' com $TOTAL arquivos."
echo "Lembre: APAGUE GABARITO_MONITOR.txt antes de publicar."
echo "Para jogar:  cd $RAIZ  &&  cat inicio"
echo ""
