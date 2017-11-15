 var html = document.querySelector("html");
if(html.offsetWidth>780){
var rem,oW = 780;
}else{
var rem,oW = html.offsetWidth;   
}
rem = oW>=640?100:oW/6.4;
html.style.fontSize = rem + "px";

var div = document.createElement("div");
div.style.width = "6.4rem";
html.appendChild(div);
var divoW = div.offsetWidth;

if(divoW!=oW){
   rem = rem * oW/divoW;
   html.style.fontSize = rem + "px";
}
html.removeChild(div);