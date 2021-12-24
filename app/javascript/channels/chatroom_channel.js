import consumer from "./consumer"

const ChatroomChannel = consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to the chat room!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log("recieving")
    //console.log(data.content)
    $('#message-container').append(data.content)
    
  }

});

export default ChatroomChannel;
