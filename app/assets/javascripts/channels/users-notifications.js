App.notifications = App.cable.subscriptions.create({
    channel: "NotificationChannel",
    room: "default"
}, {
    received: function (data) {
        console.log(data)
        if (data.activeUsers) {
            vue.activeUsers = data.activeUsers
            vue.guests = data.guests
        }
        if (data.newPost) {
            vue.newPost(data.newPost)
        }
    }
});