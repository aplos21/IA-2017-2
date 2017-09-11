
// ----------------------------------------------- //
const { PATH_MAIN_PL, querys } = require('./config');
const swipl  = require('swipl-stdio');
const engine = new swipl.Engine();
// ----------------------------------------------- //

(async () => {
  const c = await engine.call(`consult('${PATH_MAIN_PL}')`)
  if (!c) {
    throw Error('Call failed')
  }

  const query = await engine.createQuery( querys.q23() )

  try {
    let result;
    while (result = await query.next()) {
      console.log(
        listToArray(result)
      )
    }
  } finally {
    await query.close()
  }

  engine.close()
})().catch(err => console.log(err))


//============================================== lib ==============================================//

/**
 * Recupera todas as chaves de um objeto.
 * @param {object} obj
 * @return {array} As chaves em um array unidimensional
 */
function getValuesOf(obj){
  return Object.keys(obj).reduce((acum, curr) => acum.concat(obj[curr]), []);
}

/**
 * Recupera todas as chaves do objeto
 * em um array, recursivamente.
 * @param {object} obj
 * @param {array} [arr=[]]
 * @return {array}
 */
function flattenObject(obj, arr = []){
  const valores = getValuesOf(obj);
  return valores.reduce((acum, curr) => {
    if (typeof curr === 'object') return flattenObject(curr, acum);
    else acum.push(curr);
    return acum;
  }, arr);
}


/**
 * Exclusivo para o 'swipl-stdio',
 * converte uma lista retornada pela query prolog
 * em um array.
 * @param {object} listAsObj - A representação da lista em objetos
 * @return {array} A lista como array do JS
 */
function listToArray(listAsObj){
  const list = flattenObject(listAsObj)
  list.splice(-1)
  return list
}
