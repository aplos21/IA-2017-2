/* ============ FATOS ============ */
:- ['database.pl'].


/* ============ REGRAS ============ */

%% regiao_de(?Capital, ?Regiao)
%% é Regiao de uma Capital.
% regiao_de(Capital, Regiao) :-

%% capital_de(?NomeEstado, ?Capital)
%% o estado de nome NomeEstado tem a cidade Capital como capital.
capital_de(NomeEstado, Capital) :-
    estado_da_regiao(_, [NomeEstado, _, Capital]), !.


%% estado(?NomeEstado)
%% o estado com nome NomeEstado é do Brasil.
estado(NomeEstado) :- estado(NomeEstado, _), !.
%% estado(?NomeEstado, ?SiglaEstado)
%% o estado com nome NomeEstado e sigla SiglaEstado é do Brasil.
estado(NomeEstado, SiglaEstado) :-
    estado_da_regiao(_, [ NomeEstado, SiglaEstado, _ ]), !.
%% estado(?NomeEstado, ?SiglaEstado, ?Capital)
%% o estado com nome NomeEstado, sigla SiglaEstado e capital Capital é do Brasil.
estado(NomeEstado, SiglaEstado, Capital) :-
    estado_da_regiao(_, [ NomeEstado, SiglaEstado, Capital ]), !.


%% estado_da_regiao(?Regiao, ?Estado)
%% o Estado (lista tipo [nome, sigla, capital]) está em Regiao.
estado_da_regiao(Regiao, Estado) :-
    regiao(Regiao, EstadosECapitais),
    estado_da_regiao_(EstadosECapitais, Estado).
estado_da_regiao_([EstadoCurr|Proximos], Estado) :-
    Estado = EstadoCurr;
    estado_da_regiao_(Proximos, Estado).
/* % versão que retorna apenas nome e sigla
estado_da_regiao_([[EstadoCurr, Sigla|_]|Proximos], EstadoESigla) :-
    flatten([EstadoCurr, Sigla], EstadoESigla);
    estado_da_regiao_(Proximos, EstadoESigla).
*/


%% regiao(?Regiao)
%% é uma Regiao do Brasil.
regiao(Regiao) :- regiao(Regiao, _).
%% regiao(?Regiao, -Dados)
%% Dados contém estados e capitais da Regiao.
regiao(Regiao, Dados) :-
    regioes_estados(Regioes),
    regiao(Regiao, Regioes, Dados).
%% regiao(?Regiao, +List, -Dados)
%% Dados contém estados e capitais da Regiao.
regiao(Regiao, [RCurr|OutrasRegioes], Dados) :-
    secondOf(RCurr, Dados), firstOf(RCurr, Regiao);
    regiao(Regiao, OutrasRegioes, Dados).


/*
%% relacao(?P1, ?P2, ?F) -> F é uma relacao entre P1 e P2
relacao(P1, P2, F) :-
    member(F, [regiao, estado, capital]),
    call(F, P1, P2).
*/

/*
is_list(X) :-
    var(X), !,
    fail.
is_list([]).
is_list([_|T]) :-
    is_list(T).
*/
/*//FAIL
existe_regiao(_, []).
existe_regiao(R, Regiao) :- not( is_list(Regiao) ), memberchk(R, [Regiao]).
existe_regiao(R, [H|T]) :- existe_regiao(R, H); existe_regiao(R, T).
% existe_regiao(R, [[Regiao, Dados]|ProximaRegiao]) :-
*/
% regs(DR), existe_regiao(_, DR)
% existe_regiao() :- regs(Regioes),
% existe_regiao([]).
% existe_regiao([H|T]) :- existe_regiao(T).
% existe_regiao(Q, [[_, Info]|_]) :-  Q=Info.


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


/*
:- use_module(library(http/json)).
:- use_module(library(http/json_convert)).

:- json_object coord(x:float, y:float).
:- json_object circle(center:coord/2).

test :-
  prolog_to_json(circle(coord(3.4, 5.6)), JSON_Object),
  format(user_output, '~w', JSON_Object).
*/
