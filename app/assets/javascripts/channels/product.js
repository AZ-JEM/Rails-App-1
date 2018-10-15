 // Exercise 6.13 : ActionCable
App.product = App.cable.subscriptions.create("ProductChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $('.alert.alert-info').show();
    // Exercise 6.14
    // console.log(data.comment.body);
    // console.log(data);
    $('.product-reviews').prepend(data.comment);
    $('#average-rating').attr('data-score', data.average_rating);
    refreshRating();
  },

  // Exercise 6.14
  listen_to_comments: function() {
    return this.perform('listen', {
      product_id: $("[data-product-id]").data("product-id")
    });
  }
});

// Exercise 6.14
$(document).ready( function() {
  App.product.listen_to_comments();
  console.log("document ready...");
});
