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
estado(?Estado, ?Sigla) -> eh estado
- eh um Estado do Brasil e tem uma Sigla.
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
capital(?Estado, ?Capital) -> capital do
- eh Capital de um Estado brasileiro.
*/
capital('acre', 'rio branco').
capital('amapá', 'macapá').
capital('amazonas', 'manaus').
capital('pará', 'belém').
capital('rondônia', 'porto velho').
capital('roraima', 'boa vista').
capital('tocantins', 'palmas').

capital('alagoas', 'maceió').
capital('bahia', 'salvador').
capital('ceará', 'fortaleza').
capital('maranhão', 'são luís').
capital('paraíba', 'joão pessoa').
capital('pernambuco', 'recife').
capital('piauí', 'teresina').
capital('rio grande do norte', 'natal').
capital('sergipe', 'aracaju').

capital('paraná', 'curitiba').
capital('rio grande do sul', 'porto alegre').
capital('santa catarina', 'florianópolis').

capital('espírito santo', 'vitória').
capital('minas gerais', 'belo horizonte').
capital('rio de janeiro', 'rio de janeiro').
capital('são paulo', 'são paulo').

capital('distrito federal', 'brasília').
capital('goiás', 'goiânia').
capital('mato grosso', 'cuiabá').
capital('mato grosso do sul', 'campo grande').
