:- encoding(utf8).

/* ============ FATOS ============ */
:- ['regioes',
    'estados',
    'tamanhos',
    'municipios'].


/* ========================== REGRAS ========================== */

% OPERATORS http://www.swi-prolog.org/pldoc/man?section=operators
% :- op(700, xfy, [capital_de]).
% capital_de(NomeCapital, NomeEstado) :- capital(NomeEstado, NomeCapital).


%% regiao(?Nome)
%% Nome é o nome de uma região que existe no Brasil
regiao(Nome) :- regiao(Nome, _).

%% regioes(-ListaRegioes)
%% lista das regiões que existem no Brasil
regioes(ListaRegioes) :- findall(R, regiao(R, _), ListaRegioes).


%% estado(?Nome)
%% Nome é o nome de um estado brasileiro
estado(Nome) :- estado(Nome, _, _, _).

%% estados_municipios(-EstadosMunicipios)
%% lista de pares entre estados e seus municípios
estados_municipios(EstadosMunicipios) :-
    findall((E-M), municipio(M,E), Pairs),
    group_pairs_by_key(Pairs, EstadosMunicipios).

%% estados_municipios(-EstadosMunicipios, -EstadosQtdMunicipios)
%% lista de pares entre estados e seus municípios;
%% e lista de pares do tipo (Estado-QtdMunicipios) ordenado por QtdMunicipios
estados_municipios(EstadosMunicipios, EstadosQtdMunicipios) :-
    estados_municipios(EstadosMunicipios),
    map_pairs_list(EstadosMunicipios, E),
    sort(2, @>, E, EstadosQtdMunicipios).

%% municipios(+NomeEstado, -ListaMunicipios:list(NomeEstado-Municipios))
%% Lista os municípios que estão delimitados pelo estado de nome NomeEstado
municipios(NomeEstado, ListaMunicipios) :-
    estados_municipios(PairsAgrupados),
    member(NomeEstado-ListaMunicipios, PairsAgrupados).

%% capital(?NomeEstado, NomeCapital)
%% O munícipio que é capital de NomeEstado é NomeCapital
capital(NomeEstado, NomeCapital) :- estado(NomeEstado, _, _, NomeCapital).
capital('brasil', 'brasília').


%% tamanho(+NomeEstado, -Area)
%% Area é o tamanho territorial (em km^2) do estado de nome NomeEstado
tamanho('brasil', Area)   :- tamanhos(Areas), somarAreas(Areas, Area), !.
tamanho(NomeEstado, Area) :- tamanhos(L), tamanho_(NomeEstado, Area, L).
tamanho_(NomeEstado, Area, [ (NomeEstado-Area) | _ ]) :- !.
tamanho_(NomeEstado, Area, [ _ | T ])                 :- tamanho_(NomeEstado, Area, T), !.
tamanho_(_, _, [])                                    :- false.

somarAreas(L, Total) :- somarAreas_(0, L, Total).
somarAreas_(Total, [], Total)     :- !.
somarAreas_(N, [(_-Area)|Tail],Y) :- N1 is Area + N, somarAreas_(N1, Tail, Y), !.

maior_area(Area, Estado) :-
    tamanhos(L),
    last(L, (Estado-Area)).

menor_area(Area, Estado) :-
    tamanhos(L),
    first(L, (Estado-Area)).







/* ========== LIST LIB  ========== */

%%
map_pairs_list(JoinedPairs, Lengths) :- maplist(list_length, JoinedPairs, Lengths).

%% list_length(Pair)
%% mapeia um par Key-List para Key-(length(List), List)
list_length(Key-List, Key-Length) :- length(List, Length).

%% first(+List, ?First)
first([First|_], First).

%% second(+List, ?Second).
second([_, Second|_], Second).

%% indexOf(+List, +Element, +Index)
indexOf([Element|_], Element, 0) :- !.
indexOf([_|Tail], Element, Index):-
    indexOf(Tail, Element, Index1),
    !,
    Index is Index1+1.

%% remove_elem(+List, +Element, -Result)
remove_elem([], _, []).
remove_elem([Element | Rest], Element, Result) :- !, remove_elem(Rest, Element, Result).
remove_elem([X | Rest], Element, [X | Result]) :- remove_elem(Rest, Element, Result).

%% list_nonempty(+List, -Response)
list_nonempty([], false).
list_nonempty([_|T], true) :- length(T, _).
