//var lis=document.querySelectorAll('#h li a');
//
//
//for(var i =0; i<lis.length; i++){
//    lis[i].addEventListener("click",function(){
//        lis[0].classList.remove("active");
//        lis[1].classList.remove("active");
//        lis[2].classList.remove("active");
//        lis[3].classList.remove("active");
//        lis[4].classList.remove("active");
//        lis[5].classList.remove("active");
//        this.classList.add("active");
//    });
//    
//};

var request;  
function sendInfo(url)  
{   
var url=url;  
  console.log(url);
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try  
{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();  
}  
catch(e)  
{  
alert("Unable to connect to server");  
}  
}  
  
function getInfo(){  
if(request.readyState==4){  
var val=request.responseText,
    s=document.getElementById('profilebar');  
       s.innerHTML=val;
}  
}


// file chose front

const realFileBtnFront = document.getElementById("real-file-front");
const customBtnFront = document.getElementById("custom-button-front");

customBtnFront.addEventListener("click", function() {
  realFileBtnFront.click();
});

realFileBtnFront.addEventListener("change", function() {
  readIMGFront(this);
});

function readIMGFront(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#preview-front').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }




// file chose back

const realFileBtn = document.getElementById("real-file");
const customBtn = document.getElementById("custom-button");

customBtn.addEventListener("click", function() {
  realFileBtn.click();
});

realFileBtn.addEventListener("change", function() {
  readIMG(this);
});

function readIMG(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#preview').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

