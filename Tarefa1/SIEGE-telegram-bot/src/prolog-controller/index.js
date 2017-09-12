/* eslint semi: 2 */
/* eslint-disable no-await-in-loop, no-cond-assign */

// --------------------------------- //
require('../../lib/typedefs');
const swipl = require('swipl-stdio');
// --------------------------------- //

/**
 * Define um texto já classificado.
 * Com metadados para facilitar o processamento
 * da informação textual.
 * @class PrologController
 */
class PrologController {

  /**
   *
   * @param {string} pathInitialProgram
   */
  constructor(pathInitialProgram) {
    this.pathInitialProgram = pathInitialProgram.trim();
  }

  /**
   *
   * @param {string} query
   * @param {AsyncCallback} cb
   */
  executeQuery(query, cb) {
    if (typeof cb !== 'function') throw TypeError('"cb" must be an callback');
    return executeQuery(this.pathInitialProgram, query, cb)
          .catch((err) => { throw Error('[executequery]', err); });
  }

  /**
   *
   * @param {PropertiesQueryHandler} queryHandler
   * @param {object} [queryInputs={}]
   */
  executeQueryWithHandler(queryHandler, queryInputs = {}) {
    return this.executeQuery(queryHandler.consulta(queryInputs), queryHandler.controlador);
  }

}

/**
 *
 * @param {string} initialProgram
 * @param {string} strQuery
 * @param {AsyncCallback} callback
 */
async function executeQuery(initialProgram, strQuery, callback) {
  const engine = new swipl.Engine();
  const call   = await engine.call(`consult('${initialProgram}')`);
  if (!call) throw Error('Consult Failed!');

  let response;
  const query = await engine.createQuery(strQuery);
  try {
    response = await callback(query);
  } finally {
    await query.close();
  }

  engine.close();
  return response;
}


// ===================================== external ===================================== //

/*
const { PATH_MAIN_PL, querys } = require('./config');
const plg = new PrologController(PATH_MAIN_PL);

// ==== in-line
plg.executeQuery( 'append([1], [1,2], L)', async (query) => {
  let result;
  while (result = await query.next()) {
    console.log( result );
  }
});
*/


/* ======== testando
plg.executeQueryWithHandler(querys.q2).then((r) => {
  console.log(r);
});

plg.executeQueryWithHandler(querys.q3, { Estado: 'amazonas', Municipio: 'manaus' }).then((r) => {
  console.log(r);
});
*/
