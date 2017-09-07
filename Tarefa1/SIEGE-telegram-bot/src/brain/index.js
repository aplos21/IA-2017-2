/**
 * Organiza perguntas e respostas.
 */

const qq = require('./questions_and_queries')

class Brain {

  get(conective){
    return qq[conective]
  }

}


module.exports = new Brain()
