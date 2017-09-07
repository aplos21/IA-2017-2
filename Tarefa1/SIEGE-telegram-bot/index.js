/********************************************************/
require('dotenv').config()
// https://github.com/telegraf/telegraf/blob/master/docs/context.md#telegraf-context
const Telegraf = require('telegraf')
const { memorySession } = Telegraf
const app = new Telegraf(process.env.BOT_TOKEN)
/********************************************************/

// app.use(Telegraf.log())


// https://github.com/telegraf/telegraf/blob/master/examples/example-bot.js
// app.use(memorySession())

/*
app.use((ctx, next) => {
  const start = new Date()
  return next().then(() => {
    const ms = new Date() - start
    console.log('[::] response time %sms', ms)
  })
})
*/


require('./src/bot')(app)
