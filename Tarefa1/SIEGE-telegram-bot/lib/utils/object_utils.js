/**
 * Recupera todas as chaves de um objeto.
 * @param {object} obj
 * @return {array} As chaves em um array unidimensional
 */
function getValuesOf(obj) {
  return Object.keys(obj)
               .reduce((acum, curr) => acum.concat(obj[curr]), []);
}

/**
 * Recupera todas as chaves do objeto
 * em um array, recursivamente, ou seja,
 * faz o mesmo para as chaves das chaves,
 * se estas forem objetos.
 * @param {object} obj
 * @param {array} [arr=[]]
 * @return {array}
 */
function flattenObject(obj, arr = []) {
  const valores = getValuesOf(obj);
  return valores.reduce((acum, curr) => {
    if (typeof curr === 'object') return flattenObject(curr, acum);
    acum.push(curr);
    return acum;
  }, arr);
}

/**
 * Utilitário exclusivo para o 'swipl-stdio';
 * converte uma lista retornada pela query prolog
 * em um array.
 * @method PrologController#listToArray
 * @param {object} listAsObj - A representação da lista em objetos
 * @return {string[]} A lista como array de string do JS
 */
function listToArray(listAsObj) {
  if (!listAsObj || typeof listAsObj !== 'object') return [];
  const list = flattenObject(listAsObj);
  list.splice(-1);
  return list;
}


module.exports = { getValuesOf, flattenObject, listToArray }
