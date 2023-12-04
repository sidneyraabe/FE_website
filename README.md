# FE_website
Satirical Flat Earth website for Human Interface Computing Kent course
Access here: https://sidneyraabe.github.io/FE_website/home.html

## Deployment
Deployed through GitHub pages. All static pages are functional, except for the chat page, which depends on a local server instance, detailed below.

## Running The Chat
The Chat function is only available through the use of Express and WebSocket packages.



### Step 1:
Open terminal, navigate to the base directory.
Install the required packages:

```
npm install express ws
```

This will create and populate a new folder, *node_modules*.

### Step 2:
Run the server:
```
node server.js
```

A confirmation message will appear in the console indicating that the server is running. 

### Step 3:
Navigate to the chat page, (we recommend Live Server VSCode extension for ease of use), and copy the same page URL into as many separate tabs or windows desired. 

Any sent message (green) will appear as a received message (grey) in the other connected tabs.
