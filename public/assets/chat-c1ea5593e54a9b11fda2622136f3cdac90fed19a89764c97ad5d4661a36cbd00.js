function printMessage(message) {
  $('#messages').append(message + "<br>");
}

$(function() {
    var chatChannel;
    var username;

    function setupChannel() {
        chatChannel.join().then(function(channel) {
            printMessage(username + ' joined the chat.');
        });

        chatChannel.on('messageAdded', function(message) {
            printMessage(message.author + ": " + message.body);
         });
    }

    var $input = $('#chat-input');
    $input.on('keydown', function(e) {
        if (e.keyCode == 13) {
            chatChannel.sendMessage($input.val());
            $input.val('');
        }
     });

     var name = document.getElementById("chat_name").textContent;

	$.post("/tokens", function(data) {
	    username = data.username;
	    var accessManager = new Twilio.AccessManager(data.token);
	    var messagingClient = new Twilio.IPMessaging.Client(accessManager);

	    messagingClient.getChannelByUniqueName(name).then(function(channel) {
	        if (channel) {
	            chatChannel = channel;
	            setupChannel();
	        } else {
	            messagingClient.createChannel({
	                uniqueName: name,
	                friendlyName: name })
	            .then(function(channel) {
	                chatChannel = channel;
	                setupChannel();
	            });
	        }
	    });
	});
});
