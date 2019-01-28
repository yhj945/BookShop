function checkregisterform()
{
document.signup.usernamesignup.focus();
if(document.signup.usernamesignup.value=="")
{
alert("请输入用户名！");
document.signup.usernamesignup.focus();
return false;
}
if(document.signup.phonesignup.value == "")
{
alert("请输入电话！");
document.signup.phonesignup.focus();
return false;
}
if(document.signup.passwordsignup.value == "")
{
alert("请输入密码！");
document.signup.passwordsignup.focus();
return false;
}
if(document.signup.passwordsignup_confirm.value == "")
{
alert("请再次输入密码！");
document.signup.passwordsignup_confirm.focus();
return false;
}
else if(document.signup.passwordsignup_confirm.value != document.signup.passwordsignup.value)
{
alert("两次输入的密码不一致，请重新输入密码！");
document.signup.passwordsignup_confirm.focus();
}
return true;
}

function checkloginform()
{
document.login.username.focus();
if(document.login.username.value=="")
{
alert("请输入用户名！");
document.login.username.focus();
return false;
}
if(document.login.password.value == "")
{
alert("请输入密码！");
document.login.password.focus();
return false;
}
return true;
}


