import consumer from "./consumer"

consumer.subscriptions.create("RateChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('Connected')
    this.send_current_rate()

  },

  disconnected() {
    // Called when the subscription has been terminated by the serverconsole.log('Connected')
    console.log('Disconnected')

  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    let block =  document.getElementById('rate')
    block.textContent = data
    block.dataset.value = data

  },

  send_current_rate() {
    return this.perform('send rate', { rate: document.getElementById('rate').dataset.value  })
  }

});
