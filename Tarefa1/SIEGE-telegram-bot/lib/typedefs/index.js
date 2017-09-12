/**
 * Para manipular as consultas.
 * @typedef {(query: Promise) => void} AsyncCallback
 */

/**
 * Para representar um objeto que será
 * utilizado como interface entre o swipl-stdio
 * e o telegram bot, afim de generelizar as
 * execuções das consultas.
 * @typedef PropertiesQueryHandler
 * @type {object}
 * @property {(args?:object) => string} consulta - Função que recebe os parâmetros da query e retorna a query formatada.
 * @property {(query:promise) => promise} controlador - Função async que controladrá a saída do swi prolog e definirá 'resp'.
 */
