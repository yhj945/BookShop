var c;
$(document).ready(function(){
    $("tr[name=changecolor]").each(function(i){
   		$(this).mouseover(
    function () {
        c = $(this).css("background-color");
        $(this).css("background", "#daf8f8");
        alert(c.val());
    })
    .mouseout(function () {
        $(this).css("background", c);
    });
  	})
});
var b;
$(document).ready(function(){
    $("td[name=changeInfo]").each(function(i){
   		$(this).mouseover(
    function () {
        b = $(this).css("background-color");
        $(this).css("background", "#dbdbfc");
        alert(b.val());
    })
    .mouseout(function () {
        $(this).css("background", b);
    });
  	})
});
var a;
$(document).ready(function(){
    $("td[name=tdcolor]").each(function(i){
   		$(this).mouseover(
    function () {
        a = $(this).css("background-color");
        $(this).css("background", "#20bbfc");
        alert(a.val());
    })
    .mouseout(function () {
        $(this).css("background", a);
    });
  	})
});