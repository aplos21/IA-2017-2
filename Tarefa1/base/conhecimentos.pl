/* ============ FATOS ============ */
:- ['database.pl'].


/* ============ REGRAS ============ */

%% estados_da_regiao(+Regiao, -Estados)
% lista os estados que estaod associados a Regiao.
estados_da_regiao(Regiao, Estados) :- findall(Estado, ( regiao(Regiao, Estado) ), Estados).

%% relacao(?P1, ?P2, ?F) -> F eh uma relacao entre P1 e P2
relacao(P1, P2, F) :-
    member(F, [regiao, estado, capital]),
    call(F, P1, P2).


/*
%% capital_de(?E, ?C) -> a cidade C eh capital do estado E
capital_de('amazonas', 'manaus').
capital_de('ceará', 'xx').
*/
/*
regioes(['norte', 'nordeste', 'centro-oeste', 'sul', 'sudeste']).

%% lista de [REGIAO, [ [ESTADO, SIGLA, CAPITAL] ] ]
regs([
    [ 'norte', [
            ['acre', 'ac', 'rio branco'],
            ['amapá', 'ap', 'macapá'],
            ['amazonas', 'am', 'manaus'],
            ['pará', 'pa', 'belém'],
            ['rondônia', 'ro', 'porto velho'],
            ['roraima', 'rr', 'boa vista'],
            ['tocantins', 'to', 'palmas']
        ]
    ],
    [ 'nordeste', [
            ['alagoas', 'al', 'maceió'],
            ['bahia', 'ba', 'salvador'],
            ['ceará', 'ce', 'fortaleza'],
            ['maranhão', 'ma', 'são luís'],
            ['paraíba', 'pb', 'joão pessoa'],
            ['pernambuco', 'pe', 'recife'],
            ['piauí', 'pi', 'teresina'],
            ['rio grande do norte', 'rn', 'natal'],
            ['sergipe', 'se', 'aracaju']
        ]
    ],
    [ 'sul', [
            ['paraná', 'pr', 'curitiba'],
            ['rio grande do sul', 'rs', 'porto alegre'],
            ['santa catarina', 'sc', 'florianópolis']
        ]
    ],
    [ 'sudeste', [
            ['espírito santo', 'es', 'vitória'],
            ['minas gerais', 'mg', 'belo horizonte'],
            ['rio de janeiro', 'rj', 'rio de janeiro'],
            ['são paulo', 'sp', 'são paulo']
        ]
    ],
    [ 'centro-oeste', [
            ['distrito federal', 'df', 'brasília'],
            ['goiás', 'go', 'goiânia'],
            ['mato grosso', 'mt', 'cuiabá'],
            ['mato grosso do sul', 'ms', 'campo grande']
        ]
    ]
]).

estados([
    'acre',
    'alagoas',
    'amapá',
    'amazonas',
    'bahia',
    'ceará',
    'espírito santo',
    'distrito federal',
    'goiás',
    'maranhão',
    'mato grosso',
    'mato grosso do sul',
    'minas gerais',
    'paraná',
    'paraíba',
    'pará',
    'pernambuco',
    'piauí',
    'rio grande do norte',
    'rio grande do sul',
    'rio de janeiro',
    'rondônia',
    'roraima',
    'santa catarina',
    'sergipe',
    'são paulo',
    'tocantins'
]).

capitais([
]).
*/





%% get_estados(?Regiao, -Estados)
% obter etado por regiao.
% Regiao: String - nome da regiao desejada.
% Estados: List - lista de lista com elementos tipo [estado, ]
% get_estados(Regiao, Estados) :-
    % regs([[Regiao, Estados]]).

/*
%% capital(+C)
% retorna true se C for uma capital.
% capital(C) :- capital_de(_, C).
capital(C) :-
    capitais(Capitais),
    member(C, Capitais).


%% estado(+E)
% retorna true se E for um estado.
% estado(E) :- capital_de(E, _).
estado(E) :-
    estados(Estados),
    member(E, Estados).

%% regiao(+R)
% retorna true se R for uma regiao.
regiao(R) :-
    regioes(Regioes),
    member(R, Regioes).
*/

/* ========== LIST LIB  ========== */

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
