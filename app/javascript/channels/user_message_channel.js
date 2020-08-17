import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  // const user_message_element = document.getElementByClassName('message-sent');
  // const user_message_id = user_message_element.getAttribute('data-user-message-id');
  console.log(consumer.subscriptions)

  consumer.subscriptions.subscriptions.forEach((subscription) => {
    consumer.subscriptions.remove(subscription)
  })

  consumer.subscriptions.create({ channel: "UserMessageChannel", user_message_id: "hello" }, {
    connected() {
      console.log("connected to " + 'shubham')
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      console.log("Recieving:")
      console.log(data)
    }
  });
})
