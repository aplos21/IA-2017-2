
/**
 * qual a capital de Estado?
 * @param {string} Estado
 * @return {string} Saída em 'NomeCapital'
 */
const q1 = (Estado) => `capital(${Estado}, NomeCapital)`

/**
 *
 * @return {string} Saída em 'Capital'
 */
const q2 = () => `capital(brasil, Capital)`

/**
 *
 * @param {string} Estado
 * @param {string} Municipio
 * @return {string} Retorno boolean
 */
const q3 = (Estado, Municipio) => `capital(${Estado}, ${Municipio})`

/**
 *
 * @return {string} Saída em 'Existe'
 */
const q4 = () => 'findall(E, capital(E,E), L), list_nonempty(L, Existe)'

/**
 *
 * @param {string} Municipio
 * @return {string} Saída em 'NomeEstado', se a consulta der true
 */
const q5 = (Municipio) => `capital(NomeEstado, ${Municipio})`

/**
 *
 * @param {string} Estado
 * @param {string} Municipio
 * @return {string} Retorno boolean
 */
const q6 = (Estado, Municipio) => `capital(${Estado}, ${Municipio})`

/**
 *
 * @param {string} Municipio
 * @return {string} Retorno boolean
 */
const q7 = (Municipio) => `capital(_, ${Municipio})`

/**
 *
 * @return {string} Saída em 'Estado' e 'QtdMunicipios'
 */
const q8 = () => `estados_municipios(_, E), first(E, Estado-QtdMunicipios)`

/**
 *
 * @return {string} Saída em 'Estado' e 'QtdMunicipios'
 */
const q9 = () => `estados_municipios(_, E), last(E, Estado-QtdMunicipios)`

/**
 *
 * @param {string} Regiao
 * @return {string} Saída em 'ListaEstados'
 */
const q10 = (Regiao) => `findall(E, estado(E,_,${Regiao},_), ListaEstados)`

/**
 *
 * @param {string} Numero
 * @return {string} Saída em 'ListaRegioes'
 */
const q11 = (Numero) => `findall(R, (regiao(R, Q), Q =< ${Numero}), ListaRegioes)`


/**
 *
 * @return {string} Saída em 'QtdEstados'
 */
const q12 = () => `findall(QtdEstados, regiao(_, QtdEstados), L), sum_list(L, QtdEstados)`


/**
 *
 * @param {string} Regiao
 * @return {string} Saída em 'QtdEstados'
 */
const q13 = (Regiao) => `regiao(${Regiao}, QtdEstados)`

/**
 *
 * @param {string} Estado
 * @return {string} Saída em 'QtdMunicipios'
 */
const q14 = (Estado) => `municipios(${Estado}, L), length(L, QtdMunicipios)`

/**
 *
 * @param {string} Municipio
 * @return {string} Saída em 'Estado'
 */
const q15 = (Municipio) => `municipio(${Municipio}, Estado)`

/**
 *
 * @param {string} Estado
 * @param {string} Regiao
 * @return {string} Retorno boolean
 */
const q16 = (Estado, Regiao) => `estado(${Estado}, _, ${Regiao}, _)`

/**
 *
 * @param {string} Estado
 * @return {string} Saída em 'Regiao'
 */
const q17 = (Estado) => `estado(${Estado}, _, Regiao, _)`

/**
 *
 * @param {string} Municipio
 * @return {string} Saída em 'Regiao'
 */
const q18 = (Municipio) => `municipio(${Municipio}, Estado), estado(Estado, _, Regiao, _)`

/**
 *
 * @param {string} Estado
 * @return {string} Saída em 'Tamanho'
 */
const q19 = (Estado) => `tamanho(${Estado}, Tamanho)`

/**
 *
 * @return {string} Saída em 'MenorEstado', extra: 'MenorArea'
 */
const q20 = () => `menor_area(MenorArea, MenorEstado)`

/**
 *
 * @return {string} Saída em 'MaiorEstado', extra: 'MaiorArea'
 */
const q21 = () => `maior_area(MaiorArea, MaiorEstado)`

/**
 *
 * @return {string} Saída em 'TamanhoTotal'
 */
const q22 = () => `tamanho(brasil, TamanhoTotal)`

/**
 *
 * @return {string} Saída em 'MaiorEstado' e 'MenorEstado'
 */
const q23 = () => `maior_area(MaiorArea, MaiorEstado), menor_area(MenorArea, MenorEstado)`


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
