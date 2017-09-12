<img src="http://icomp.ufam.edu.br/professores/images/ufam.png" width="150" align="right">


### Tarefa I - SIEGE (Sistema Inteligente de Ensino de Geografia)
> 18/08/2017 ⇒ 12/09/2017

----------------------------------------

**Curso:** Ciência da Computação <br>
**Professor:** José Francisco Netto <br>
**Aluno:** Micael Levi -- 21554923 <br>

----------------------------------------



## [SIEGE-telegram-bot/src/controllers/prolog/database](SIEGE-telegram-bot/src/controllers/prolog/database)

Os fatos disponíveis nos programas dispostos neste diretório são:
> - `regiao(?Nome, ?QuantidadeEstados)`
> - `estado(?Nome, ?Sigla, ?NomeRegiao, ?NomeCapital)`
> - `tamanhos(-EstadosEAreas:list(NomeEstado-Area))`
> - `municipio(?Nome, ?NomeEstado)`

Pensando nos fatos em termos de tabela, as relações de integridade referencial ficam da seguinte forma:
<img alt="http://erdplus.com" src="SIEGE-telegram-bot/src/prolog-controller/database/diagrama-integridade-referencial.png" width="780">


-------------

# TODO
<!-- https://pt.wikipedia.org/wiki/Geografia_do_Brasil -->

## 5 temas escolhidos e possíveis perguntas:
<!--
https://servicodados.ibge.gov.br/api/docs/localidades
http://www.geonames.org/childrenJSON?geonameId=3469034
-->

<!-- http://www.suapesquisa.com/geografia/estados_capitais_brasil.htm -->
1. [ ] *Capitais dos Estados do Brasil*

<!-- https://pt.wikipedia.org/wiki/Lista_de_bandeiras_do_Brasil -->
<!-- https://pt.wikipedia.org/wiki/Unidades_federativas_do_Brasil -->
2. [ ] *Estados e Regiões do Brasil* (Brasil Político)
	- Qual a bandeira de um estado
	- Qual o mapa político do país

3. [ ] *Estados e Tamanho Territorial*

4. [ ] *Estados e Contingente Populacional*
	- Qual a população de um estado
	- Qual a população do país

<!--
https://pt.wikipedia.org/wiki/Lista_de_estados_fronteiri%C3%A7os_do_Brasil
https://pt.wikipedia.org/wiki/Lista_de_pa%C3%ADses_lim%C3%ADtrofes_do_Brasil
http://www.suapesquisa.com/geografia/estados_capitais_brasil.htm
-->
5. [ ] *Limites e Fronteiras dos Estados do Brasil*
	- Quais cidades realizam fronteiras com quais países e em qual km
	- Quais estados realizam fronteiras com quais países
	- Quais regiões realizam fronteiras



<!-- implementar!! -->
# Perguntas que serão respondidas

## *Capitais dos Estados Brasileiros*
1.	[x] Qual é a capital de `Estado`?
2.	[x] Qual é a capital do Brasil?
3.	[x] A cidade `Municipio` é capital do `Estado`?
3.	[x] A cidade `Municipio` é capital de `Estado`?
4.	[x] Existe algum estado cuja capital tem o mesmo nome do estado?
5.	[x] `Municipio` é a capital de qual estado?
6.	[x] `Municipio` é a capital de `Estado`?
6.	[x] `Municipio` é a capital do `Estado`?
7.	[x] `Municipio` é a capital de algum estado?


## *Estados e Regiões*
8.	[x] Qual é o estado que tem mais cidades?
9.	[x] Qual é o estado que tem menos cidades?
10.	[x] Quais são os estados que compõem a região `Regiao`?
11.	[x] Quais são as regiões que possuem até `Numero` estados?
12.	[x] Quantos estados tem o Brasil?
13. [x] Quantos estados a região `Regiao` tem?
14. [x] Quantas cidades o estado de `Estado` tem?
14. [x] Quantas cidades o estado do `Estado` tem?
15. [x] A cidade `Municipio` está em qual estado?
16.	[x] O estado do `Estado` fica na região `Regiao`?
16.	[x] O estado de `Estado` fica na região `Regiao`?
17.	[x] `Estado` fica em qual região?
18. [x] `Municipio` fica em qual região?


## *Tamanho Territorial*
19. [x] Qual é o tamanho territorial do `Estado`?
19. [x] Qual é o tamanho territorial de `Estado`?
20. [x] Qual é o estado de menor tamanho?
21. [x] Qual é o estado de maior tamanho?
22. [x] Qual é o tamanho territorial do Brasil?
23. [x] Quais são os estados de maior e menor tamanho?


## *Contingente Populacional*
24.	[ ] Qual é a população do `Estado`? **(sem dados)**
24.	[ ] Qual é a população de `Estado`? **(sem dados)**
25.	[ ] Qual é a população da região `Regiao`? **(sem dados)**
26.	[ ] Qual é o estado com maior população? **(sem dados)**
27.	[ ] Qual é o estado com menor população? **(sem dados)**
28.	[ ] Qual é a população do `Municipio`? **(sem dados)**
29.	[ ] Existem estados com população inferior a `Numero` habitantes? **(sem dados)**

## *Limites e Fronteiras dos Estados Brasileiros*
30.	[ ] Que estados fazem fronteira com o estado `Estado`? **(sem dados)**
31.	[ ] Qual é o estado que faz fronteira com mais estados? **(sem dados)**
32.	[ ] Qual é o estado que faz fronteira com menos estados? **(sem dados)**
33.	[ ] Quais são os estados que são banhados pelo mar? **(sem dados)**
34.	[ ] Quais são as capitais brasileiras que ficam em ilhas? **(sem dados)**
35.	[ ] Existe algum estado que faz fronteira com apenas um estado? **(sem dados)**
36.	[ ] Descreva um caminho rodoviário entre o estado do `Estado1` e `Estado2`, sem sair das fronteiras do Brasil. **(sem dados)**
36.	[ ] Descreva um caminho rodoviário entre o estado de `Estado1` e `Estado2`, sem sair das fronteiras do Brasil. **(sem dados)**




# Consultas para as perguntas <small>(implementadas)</small>
> - O símbolo '+' indica que a variável (que segue) deve ser uma entrada, i.e., ter valor.
> - As querys terminadas com ponto final já estão no formato exato, i.e., estão prontas para serem executadas.

| no. | query | saída |
|:----|:------|------:|
| 1   | `capital(+Estado, NomeCapital)`                                             | __NomeCapital__                  |
| 2   | `capital(brasil, Capital).`                                                 | __Capital__                      |
| 3   | `capital(+Estado, +Municipio)`                                              | _boolean_                        |
| 4   | `findall(E, capital(E,E), Quais), list_nonempty(Quais, Existe).`            | __Existe__                       |
| 5   | `capital(NomeEstado, +Municipio)`                                           | __NomeEstado__                   |
| 6   | `capital(+Estado, +Municipio)`                                              | _boolean_                        |
| 7   | `capital(_, +Municipio)`                                                    | _boolean_                        |
| 8   | `estados_municipios(_, E), first(E, Estado-QtdMunicipios).`                 | __Estado__, __QtdMunicipios__    |
| 9   | `estados_municipios(_, E), last(E, Estado-QtdMunicipios).`                  | __Estado__, __QtdMunicipios__    |
| 10  | `findall(E, estado(E,_,+Regiao,_), ListaEstados)`                           | __ListaEstados__                 |
| 11  | `findall(R, (regiao(R, Q), Q =< +Numero), ListaRegioes)`                    | __ListaRegioes__                 |
| 12  | `findall(QtdEstados, regiao(_, QtdEstados), L), sum_list(L, QtdEstados).`   | __QtdEstados__                   |
| 13  | `regiao(+Regiao, QtdEstados)`                                               | __QtdEstados__                   |
| 14  | `municipios(+Estado, Municipios), length(Municipios, QtdMunicipios)`        | __QtdMunicipios__                |
| 15  | `municipio(+Municipio, Estado)`                                             | __Estado__                       |
| 16  | `estado(+Estado, _, +Regiao, _)`                                            | _boolean_                        |
| 17  | `estado(+Estado, _, Regiao, _)`                                             | __Regiao__                       |
| 18  | `municipio(+Municipio, Estado), estado(Estado, _, Regiao, _)`               | __Regiao__                       |
| 19  | `tamanho(+Estado, Tamanho)`                                                 | __Tamanho__                      |
| 20  | `menor_area(MenorArea, MenorEstado).`                                       | __MenorEstado__                  |
| 21  | `maior_area(MaiorArea, MaiorEstado).`                                       | __MaiorEstado__                  |
| 22  | `tamanho(brasil, TamanhoTotal).`                                            | __TamanhoTotal__                 |
| 23  | `maior_area(MaiorArea, MaiorEstado), menor_area(MenorArea, MenorEstado).`   | __MaiorEstado__, __MenorEstado__ |



<!--
# Descrição da Tarefa

O objetivo é criar um sistema programado em `Prolog` que auxilie o ensino e aprendizagem de Geografia do Brasil. <br>
Devendo abranger, pelo menos, 5 tópicos. <br>
A interface pode ser feita empregando-se `XPCE/Prolog` ou outra linguagem.


# Documentação
www.swi-prolog.org/pldoc/

## Predicados

```
argumento de entrada: +
argumento de saída: -
argumento de entrada/saída: ?
```

- **length**(_?List, ?Int_) <br>
`True` if Int represents the number of elements in List. <br>
This predicate is a true relation and can be used to find the length of a list or produce a list (holding variables) of length Int. <br>
The predicate is non-deterministic, producing lists of increasing length if List is a partial list and Int is unbound. <br>
This predicate fails if the tail of List is equivalent to Int. <br>
It raises errors if:
  - Int is bound to a non-integer.
  - Int is a negative integer.
  - List is neither a list nor a partial list. This error condition includes cyclic lists.


# Como Usar

## Instalação

### Exemplo de Uso

-->

## License
MIT: http://micalevisk.mit-license.org/
