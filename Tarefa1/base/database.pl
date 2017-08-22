/**
 * regioes_estados(-List).
 *
 * List está tipo: [REGIAO, [ [ESTADO, SIGLA, CAPITAL] ] ]
 * A lista abaixo tem 5 elementos. Cada um é
 * uma lista de tamanho 2 que obedece o formato:
 * o primeiro elemento é o nome de uma região brasileira,
 * o segunto elemento é uma lista de estados que estão nesta região.
 * Cada elemento dessa lista (de estados) é uma lista de tamanho 3
 * que obedece o formato:
 * o primeiro é o nome de um estado,
 * o segundo é a sua sigla e o terceiro é o nome da sua capital.
 *
 * OBS: todos os nomes estão em minúsculo.
 */
regioes_estados([
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
