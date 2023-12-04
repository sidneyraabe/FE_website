const express = require('express');
const http = require('http');
const WebSocket = require('ws');

const port = 6969;
const app = express();
const server = http.createServer(app);
const wss = new WebSocket.Server({ server });

wss.on('connection', (ws) => {
    ws.on('message', (message) => {
        // Broadcast the received message to all clients
        wss.clients.forEach((client) => {
            if (client !== ws && client.readyState === WebSocket.OPEN) {
                // Check if the message is a Blob
                if (message instanceof Buffer) {
                    // Handle the Blob here or convert it to a string
                    const binaryData = Buffer.from(message).toString();
                    client.send(binaryData);
                } else {
                    // If it's not a Blob, send it as is
                    client.send(message);
                }
            }
        });
    });
});


server.listen(port, function () {
  console.log(`Server is listening on ${port}!`);
});
