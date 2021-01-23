//post get on scroll

var request; 
function sendInfo(urlLink)  
{   
var urlp=urlLink;  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try  
{  
request.onreadystatechange=getInfo;  
request.open("GET",urlp,true);  
request.send();  
}  
catch(e)  
{  
alert("Unable to connect to server");  
}  
}

function getInfo(){  
    if(request.readyState==4){  
        var val=request.responseText;
        var s=document.getElementById('s');  
        s.insertAdjacentHTML("beforebegin",val);
    }  
}



// file chose

const realFileBtn = document.getElementById("real-file");
const customBtn = document.getElementById("custom-button");
const customTxt = document.getElementById("custom-text");

customBtn.addEventListener("click", function() {
  realFileBtn.click();
});

realFileBtn.addEventListener("change", function() {
  if (realFileBtn.value) {
    customTxt.innerHTML = realFileBtn.value;
  } else {
    customTxt.innerHTML = "No file chosen.";
  }
});

// on scroll

window.addEventListener('scroll', () =>{
	const scrollable = document.documentElement.scrollHeight - window.innerHeight;
	const scrolled = window.scrollY;
        
	if(Math.ceil(scrolled)===scrollable){
            sendInfo("f");
	}
        const scrollable1=scrollable+1;
        if(Math.ceil(scrolled)===scrollable1){
            sendInfo("f");
	}
        
});
//document.body.addEventListener('click', this.printId);
//	function printId(e){
//    e = e || window.event;
//    e = e.target || e.srcElement;
//    console.log(e.id);
//}

//like share comment 
var p_id;
var url1;
var request1; 
function sendInfoPost(urlLink,id) 
{ 
p_id=id;
url1=urlLink;
var url=urlLink+"?p_id="+p_id;  
  
if(window.XMLHttpRequest){  
request1=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request1=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try  
{  
request1.onreadystatechange=getInfoLike;  
request1.open("GET",url,true);  
request1.send();  
}  
catch(e)  
{  
alert("Unable to connect to server");  
}  
}

function getInfoLike(){  
    if(request1.readyState==4){  
        var val=request1.responseText;
        if(url1==="AddLike" || url1==="RemoveLike"){
            var post_id=document.getElementById(p_id);  
            post_id.children[2].children[2].innerHTML=val;
        }
        else if(url==="GetComment"){
            
        }
    }   
}


  