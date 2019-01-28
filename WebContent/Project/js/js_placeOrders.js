function checkOrders()
{
document.placeOrders.odaddress.focus();
if(document.placeOrders.odaddress.value=="")
{
alert("收货地址不能为空，请输入地址！");
document.placeOrders.odaddress.focus();
return false;
}
if(document.placeOrders.odname.value == "")
{
alert("收货人名字不能为空，请输入名字！");
document.placeOrders.odname.focus();
return false;
}
if(document.placeOrders.odphone.value=="")
{
alert("联系电话不能为空，请输入联系电话！");
document.placeOrders.odphone.focus();
return false;
}
if(document.placeOrders.code.value == "")
{
alert("邮政编码不能为空，请输入邮政编码！");
document.placeOrders.code.focus();
return false;
}
return true;
}