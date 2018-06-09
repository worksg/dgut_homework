/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function checkPassword(form){
    var password=form[form.id+":password"].value;
    var passwordConfirm=form[form.id+":passwordConfirm"].value;
    if(password==passwordConfirm) form.submit();
    else alert("两次输入的密码不匹配");
}

