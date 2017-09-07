module.exports = initializeBot

/*************************************************/
// vide https://www.airpair.com/javascript/posts/using-es6-harmony-with-nodejs
// t.me/SIEGE_BR_bot.
require('../lib/stringUtils')

const brain = require('./brain')
const { Extra, Markup, reply  } = require('telegraf')
const defaultReplyOptions = Extra.HTML().notifications(false).webPreview(false)
/*************************************************/



/**
 * @param {Telegraf} bot
 */
function initializeBot(bot){

  bot.command('start', reply('Opa!!'))

  // TODO loop para adicionar todos os comandos do Brain
  // ou, apenas um comando .hears

  // Wow! RegEx
  bot.hears(/reverse (.+)/, ({ match, reply }) => {
    return reply(match[1].split('').reverse().join(''))
    /*
    return ctx.replyWithPhoto({
      source: '/example/cat.jpeg',
      caption: 'bandeira da xx'
    })
    */
  })



  // --------------- //
  bot.startPolling()
  //---------------- //
}


