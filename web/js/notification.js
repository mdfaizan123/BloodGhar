var id= document.getElementById("id").value;
var wsUri= "ws://localhost:8083/BloodGhar/socketServerEndpoint/"+id;
var websocket=new WebSocket (wsUri);

websocket.onopen = function(message) { onOpen(message); };
websocket.onerror = function(message) { onError(message); };
websocket.onclose = function(message) { onClose(message); };

websocket.onmessage = function(message){
    var jsonData = JSON.parse(message.data);
        if(jsonData.type==="message"){
            messageUrl="SocketMessage?m_id="+jsonData.m_id;
            document.getElementById("ntfn").style.color = "#ff0000";
        }
        
      
    console.log(jsonData.message)
};
function onOpen(message) {
    console.log("Connected to " + wsUri);
}

function onClose(message){
   websocket.send("disconnected");
}
function onError(message){
    websocket.send("error");
}