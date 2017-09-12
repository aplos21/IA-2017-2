require('../../lib/typedefs')
const { listToArray } = require('../../lib/utils/object_utils');

/**
 * qual é a capital de Estado
 * @type {PropertiesQueryHandler}
 */
const q1 = {
  consulta: Estado => `capital(${Estado}, NomeCapital)`,
  controlador: async (query) => {
    const result = await query.next()
    return { nomeCapital: result.NomeCapital }
  }
}

/**
 * qual é a capital do Brasil
 * @type {PropertiesQueryHandler}
 */
const q2 = {
  consulta: () => 'capital(brasil, Capital)',
  controlador: async (query) => {
    const result = await query.next()
    return { capital: result.Capital }
  }
}

/**
 * a cidade Municpio é capital do/de Estado
 * @type {PropertiesQueryHandler}
 */
const q3 = {
  consulta: ({ Estado, Municipio }) => `capital(${Estado}, ${Municipio})`,
  controlador: async (query) => {
    const result = await query.next()
    return !!result
  }
}

/**
 * existe algum estado cuja capital tem o mesmo nome do Estado
 * @type {PropertiesQueryHandler}
 */
const q4 = {
  consulta: () => 'findall(E, capital(E,E), Quais), list_nonempty(Quais, Existe)',
  controlador: async (query) => {
    const result = await query.next()
    return { quais: listToArray(result.Quais), existe: !!result.Existe }
  }
}

/**
 * Municipio é a capital de qual estado
 * @type {PropertiesQueryHandler}
 */
const q5 = {
  consulta: ({ Municipio }) => `capital(NomeEstado, ${Municipio})`,
  controlador: async (query) => {
    const result = await query.next()
    return { nomeEstado: result.NomeEstado }
  }
}

/**
 * Municipio é a capital do/de Estado
 * @type {PropertiesQueryHandler}
 */
const q6 = {
  consulta: ({ Estado, Municipio }) => `capital(${Estado}, ${Municipio})`,
  controlador: async (query) => {
    const result = await query.next()
    return !!result
  }
}

/**
 * Municipio é a capital de algum estado
 * @type {PropertiesQueryHandler}
 */
const q7 = {
  consulta: ({ Municipio }) => `capital(Estado, ${Municipio})`,
  controlador: async (query) => {
    const result = await query.next()
    return { estado: result.Estado }
  }
}

/**
 * qual é o estado que tem mais cidades
 * @type {PropertiesQueryHandler}
 */
const q8 = {
  consulta: () => 'estados_municipios(_, E), first(E, Estado-QtdMunicipios)',
  controlador: async (query) => {
    const result = await query.next()
    return { estado: result.Estado, qtdMunicipios: result.QtdMunicipios }
  }
}

/**
 * qual é o estado que tem menos cidades
 * @type {PropertiesQueryHandler}
 */
const q9 = {
  consulta: () => 'estados_municipios(_, E), last(E, Estado-QtdMunicipios)',
  controlador: async (query) => {
    const result = await query.next()
    return { estado: result.Estado, qtdMunicipios: result.QtdMunicipios }
  }
}

/**
 * quais são os estados que compõem a regiao Regiao
 * @type {PropertiesQueryHandler}
 */
const q10 = {
  consulta: ({ Regiao }) => `findall(E, estado(E,_,${Regiao},_), ListaEstados)`,
  controlador: async (query) => {
    const result = await query.next()
    return { listaEstados: listToArray(result.ListaEstados) }
  }
}

/**
 * quais são as regiões que possuem até Numero estados
 * @type {PropertiesQueryHandler}
 */
const q11 = {
  consulta: ({ Numero }) => `findall(R, (regiao(R, Q), Q =< ${Numero}), ListaRegioes)`,
  controlador: async (query) => {
    const result = await query.next()
    return { listaRegioes: listToArray(result.ListaRegioes) }
  }
}

/**
 * quantos estados tem o Brasil
 * @type {PropertiesQueryHandler}
 */
const q12 = {
  consulta: () => 'findall(QtdEstados, regiao(_, QtdEstados), L), sum_list(L, QtdEstados)',
  controlador: async (query) => {
    const result = await query.next()
    return { qtdEstados: result.QtdEstados }
  }
}

/**
 * quantos estados a região Regiao tem
 * @type {PropertiesQueryHandler}
 */
const q13 = {
  consulta: ({ Regiao }) => `regiao(${Regiao}, QtdEstados)`,
  controlador: async (query) => {
    const result = await query.next()
    return { qtdEstados: result.QtdEstados }
  }
}

/**
 * quantas cidades o estado do/de Estado tem
 * @type {PropertiesQueryHandler}
 */
const q14 = {
  consulta: ({ Estado }) => `municipios(${Estado}, Municipios), length(Municipios, QtdMunicipios)`,
  controlador: async (query) => {
    const result = await query.next()
    return { municipios: listToArray(result.Municipios), qtdMunicipios: result.QtdMunicipios }
  }
}

/**
 * a cidade Municipio está em qual estado
 * @type {PropertiesQueryHandler}
 */
const q15 = {
  consulta: ({ Municipio }) => `municipio(${Municipio}, Estado)`,
  controlador: async (query) => {
    const result = await query.next()
    return { estado: result.Estado }
  }
}

/**
 * o estado do/de Estado fica na região Regiao
 * @type {PropertiesQueryHandler}
 */
const q16 = {
  consulta: ({ Estado, Regiao }) => `estado(${Estado}, _, ${Regiao}, _)`,
  controlador: async (query) => {
    const result = await query.next()
    return !!result
  }
}

/**
 * Estado fica em qual região
 * @type {PropertiesQueryHandler}
 */
const q17 = {
  consulta: ({ Estado }) => `estado(${Estado}, _, Regiao, _)`,
  controlador: async (query) => {
    const result = await query.next()
    return { regiao: result.Regiao }
  }
}

/**
 * Municipio fica em qual regiao
 * @type {PropertiesQueryHandler}
 */
const q18 = {
  consulta: ({ Municipio }) => `municipio(${Municipio}, Estado), estado(Estado, _, Regiao, _)`,
  controlador: async (query) => {
    const result = await query.next()
    return { estado: result.Estado, regiao: result.Regiao }
  }
}

/**
 * qual é o tamanho territorial do/de estado
 * @type {PropertiesQueryHandler}
 */
const q19 = {
  consulta: ({ Estado }) => `tamanho(${Estado}, Tamanho)`,
  controlador: async (query) => {
    const result = await query.next()
    return { tamanho: result.Tamanho }
  }
}

/**
 * qual é o estado de maiior tamanho
 * @type {PropertiesQueryHandler}
 */
const q20 = {
  consulta: () => 'menor_area(MenorArea, MenorEstado)',
  controlador: async (query) => {
    const result = await query.next()
    return { menorArea: result.MenorArea, menorEstado: result.MenorEstado }
  }
}

/**
 * qual é o estado de menor tamanho
 * @type {PropertiesQueryHandler}
 */
const q21 = {
  consulta: () => 'maior_area(MaiorArea, MaiorEstado)',
  controlador: async (query) => {
    const result = await query.next()
    return { maiorArea: result.MaiorArea, maiorEstado: result.MaiorEstado }
  }
}

/**
 * qual é o tamanho territorial do Brasil
 * @type {PropertiesQueryHandler}
 */
const q22 = {
  consulta: () => 'tamanho(brasil, TamanhoTotal)',
  controlador: async (query) => {
    const result = await query.next()
    return { tamanhoTotal: result.TamanhoTotal }
  }
}

/**
 * quais são os estados de maior e menor tamanho
 * @type {PropertiesQueryHandler}
 */
const q23 = {
  consulta: () => 'maior_area(MaiorArea, MaiorEstado), menor_area(MenorArea, MenorEstado)',
  controlador: async (query) => {
    const result = await query.next()
    return { maiorEstado: result.MaiorEstado, maiorArea: result.MaiorArea, menorEstado: result.MenorEstado, menorArea: result.MenorArea }
  }
}


// ------------ //
module.exports = {
  q1,
  q2,
  q3,
  q4,
  q5,
  q6,
  q7,
  q8,
  q9,
  q10,
  q11,
  q12,
  q13,
  q14,
  q15,
  q16,
  q17,
  q18,
  q19,
  q20,
  q21,
  q22,
  q23
}
// ------------ //
