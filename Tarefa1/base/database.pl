/*
regiao(?Regiao, ?Estado)
- eh uma Regiao do Brasil que contem o Estado.
*/
regiao('centro-oeste', 'distrito federal').
regiao('centro-oeste', 'goiás').
regiao('centro-oeste', 'mato grosso').
regiao('centro-oeste', 'mato grosso do sul').

regiao('nordeste', 'alagoas').
regiao('nordeste', 'bahia').
regiao('nordeste', 'ceará').
regiao('nordeste', 'maranhão').
regiao('nordeste', 'paraíba').
regiao('nordeste', 'pernambuco').
regiao('nordeste', 'piauí').
regiao('nordeste', 'rio grande do norte').
regiao('nordeste', 'sergipe').

regiao('norte', 'acre').
regiao('norte', 'amapá').
regiao('norte', 'amazonas').
regiao('norte', 'pará').
regiao('norte', 'rondônia').
regiao('norte', 'roraima').
regiao('norte', 'tocantins').

regiao('sudeste', 'espírito santo').
regiao('sudeste', 'minas gerais').
regiao('sudeste', 'rio de janeiro').
regiao('sudeste', 'são paulo').

regiao('sul', 'paraná').
regiao('sul', 'rio grande do sul').
regiao('sul', 'santa catarina').


/*
estado(?Estado, ?Sigla)
- eh um Estado do Brasil.
*/
estado('distrito federal', 'df').
estado('goiás', 'go').
estado('mato grosso', 'mt').
estado('mato grosso do sul', 'ms').

estado('alagoas', 'al').
estado('bahia', 'ba').
estado('ceará', 'ce').
estado('maranhão', 'ma').
estado('paraíba', 'pb').
estado('pernambuco', 'pe').
estado('piauí', 'pi').
estado('rio grande do norte', 'rn').
estado('sergipe', 'se').

estado('acre', 'ac').
estado('amapá', 'ap').
estado('amazonas', 'am').
estado('pará', 'pa').
estado('rondônia', 'ro').
estado('roraima', 'rr').
estado('tocantins', 'to').

estado('espírito santo', 'es').
estado('minas gerais', 'mg').
estado('rio de janeiro', 'rj').
estado('são paulo', 'sp').

estado('paraná', 'pr').
estado('rio grande do sul', 'rs').
estado('santa catarina', 'sc').


/*
capital(?Capital, ?Estado)
- eh Capital de um Estado brasileiro.
*/
capital('rio branco', 'acre').
capital('macapá', 'amapá').
capital('manaus', 'amazonas').
capital('belém', 'pará').
capital('porto velho', 'rondônia').
capital('boa vista', 'roraima').
capital('palmas', 'tocantins').

capital('maceió', 'alagoas').
capital('salvador', 'bahia').
capital('fortaleza', 'ceará').
capital('são luís', 'maranhão').
capital('joão pessoa', 'paraíba').
capital('recife', 'pernambuco').
capital('teresina', 'piauí').
capital('natal', 'rio grande do norte').
capital('aracaju', 'sergipe').

capital('curitiba', 'paraná').
capital('porto alegre', 'rio grande do sul').
capital('florianópolis', 'santa catarina').

capital('vitória', 'espírito santo').
capital('belo horizonte', 'minas gerais').
capital('rio de janeiro', 'rio de janeiro').
capital('são paulo', 'são paulo').

capital('brasília', 'distrito federal').
capital('goiânia', 'goiás').
capital('cuiabá', 'mato grosso').
capital('campo grande', 'mato grosso do sul').
