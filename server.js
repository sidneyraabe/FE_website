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
                let styledMessage;

                try {
                    const parsedMessage = JSON.parse(message);
                    // Check if the parsed message is an object
                    if (typeof parsedMessage === 'object') {
                        styledMessage = JSON.stringify(parsedMessage);
                    } else {
                        // If the parsed message is not an object, assume it's a string and include a class
                        styledMessage = JSON.stringify({ class: 'important', content: parsedMessage });
                    }
                } catch (error) {
                    // If parsing fails, assume message is a string and include a class
                    styledMessage = JSON.stringify({ class: 'important', content: message });
                }

                // Send the styled message to the client
                client.send(styledMessage);
            }
        });
    });
});


server.listen(port, function () {
    console.log(`Server is listening on ${port}!`);
});
