/**
 * Organiza perguntas e respostas.
 */

const qq = require('./questions_and_queries')

/**
 * Define um texto já classificado.
 * Com metadados para facilitar o processamento
 * da informação textual.
 * @class Brain
 * @property {xx} xx
 */
class Brain {
  /**
   * @method Brain#get
   * @param {string} conective
   */
  get(conective) {
    return qq[conective]
  }
}

//========================//
module.exports = new Brain()
//========================//
