/* ============ FATOS ============ */
:- ['database.pl'].


/* ============ REGRAS ============ */

%% relacao(?Param1, ?Param2, ?F)
%% F/2 é uma relacao entre Param1 e Param2.
%% :- meta_predicate relacao(?, ?, 2).
relacao(Param1, Param2, F) :-
    member(F, [estado_da_regiao_, capital_de, estado_de]),
    call(F, Param1, Param2), !.


%% estado_de(?Capital, ?NomeEstado)
%% "o estado de Capital é NomeEstado"
%% NomeEstado é o estado onde reside a cidade Capital
estado_de(Capital, NomeEstado) :-
    capital_de(NomeEstado, Capital).


%% capital_de(?NomeEstado, ?Capital)
%% "a capital de NomeEstado é Capital"
%% o estado de nome NomeEstado tem a cidade Capital como capital.
capital_de(NomeEstado, Capital) :-
    estado_da_regiao(_, [NomeEstado, _, Capital]), !.


%% estado(?NomeEstado)
%% "é um estado do Brasil"
%% o estado com nome NomeEstado é do Brasil.
estado(NomeEstado) :- estado(NomeEstado, _).

%% estado(?NomeEstado, ?SiglaEstado)
%% "NomeEstado tem sigla SiglaEstado"
%% o estado com nome NomeEstado e sigla SiglaEstado é do Brasil.
estado(NomeEstado, SiglaEstado) :-
    estado_da_regiao(_, [ NomeEstado, SiglaEstado, _ ]).

%% estado(?NomeEstado, ?SiglaEstado, ?Capital)
%% "NomeEstado tem sigla SiglaEstado e capital Capital"
%% o estado com nome NomeEstado, sigla SiglaEstado e capital Capital é do Brasil.
estado(NomeEstado, SiglaEstado, Capital) :-
    estado_da_regiao(_, [ NomeEstado, SiglaEstado, Capital ]).


%% estado_da_regiao(?Regiao, ?Estado)
%% "o estado da Regiao é Estado"
%% o Estado (lista tipo [nome, sigla, capital]) está em Regiao.
estado_da_regiao(Regiao, Estado) :-
    regiao(Regiao, EstadosECapitais),
    estado_da_regiao_(EstadosECapitais, Estado).

estado_da_regiao_([], _) :- fail.
estado_da_regiao_([EstadoCurr|_], EstadoCurr).
estado_da_regiao_([_|Proximos], Estado) :- estado_da_regiao_(Proximos, Estado). % FIXME sempre false quando não para no fail


%% regiao(?Regiao)
%% "é uma Regiao do Brasil"
%% retorna true se Regiao é uma das regiões existentes no Brasil.
regiao(Regiao) :- regiao(Regiao, _).

%% regiao(?Regiao, -Dados)
%% Dados é uma lista de estados que pretencem a Regiao.
regiao(Regiao, Dados) :-
    regioes_estados(Regioes),
    regiao(Regiao, Regioes, Dados), !.

%% regiao(?Regiao, +List, -Dados)
%% Dados é uma lista de estados que pretencem a Regiao. E List é a lista de regiões.
regiao(Regiao, [RegiaoCurr|OutrasRegioes], Dados) :-
    secondOf(RegiaoCurr, Dados), firstOf(RegiaoCurr, Regiao);
    regiao(Regiao, OutrasRegioes, Dados).




/* ========== LIST LIB  ========== */

%% firstOf(+List, ?First)
firstOf([First|_], First).

%% secondOf(+List, ?Second).
secondOf([_, Second|_], Second).

%% indexOf(+List, +Element, +Index)
indexOf([Element|_], Element, 0) :- !.
indexOf([_|Tail], Element, Index):-
    indexOf(Tail, Element, Index1),
    !,
    Index is Index1+1.

%% remove_elem(+List, +Element, -Result)
remove_elem([], _, []).
remove_elem([Element | Rest], Element, Result) :-
    !,
    remove_elem(Rest, Element, Result).
remove_elem([X | Rest], Element, [X | Result]) :-
    remove_elem(Rest, Element, Result).

list_nonempty([], false).
list_nonempty([_|T], true) :-
    length(T, _).
