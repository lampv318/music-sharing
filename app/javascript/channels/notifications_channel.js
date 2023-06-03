import consumer from "./consumer"

consumer.subscriptions.create("NotificationsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $('#popup-notification').modal('show')
    $("#by-user").html(data.message);
    $("#title").html(data.message);
  }
});
