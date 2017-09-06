/* ============ FATOS ============ */
:- ['database/regioes',
    'database/estados',
    'database/municipios'].


/* ============ REGRAS ============ */

%% regiao(?Nome)
regiao(Nome) :- regiao(Nome, _).
%% regioes(-ListaRegioes)
regioes(ListaRegioes) :- findall(R, ( regiao(R) ), ListaRegioes).

%% estado(?Nome)
estado(Nome) :- estado(Nome, _, _).
%% estado(?Nome, ?Sigla)
estado(Nome, Sigla) :- estado(Nome, Sigla, _).




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
