/**
 * Inicializa o bot e as relações entre os sistemas.
 */

// vide https://www.airpair.com/javascript/posts/using-es6-harmony-with-nodejs

// t.me/SIEGE_BR_bot.

/********************************************/
const dotenv = require('dotenv').config()
const Telegraf = require('telegraf') // https://github.com/telegraf/telegraf/blob/6fd8e1c160e3095b49619e7c731e28637afee868/docs/context.md#telegraf-context
const brain = require('./src/models/brain')

const { Extra, Markup  } = require('telegraf')
const bot = new Telegraf(process.env.BOT_TOKEN)
/********************************************/

// bot.use(Telegraf.log())

bot.command('start', (ctx) => ctx.reply('Opa! Faça algumas perguntas 😃'))


// --------------- //
bot.startPolling()
//---------------- //
