/**
 * 
 **/
function myFunction() {
    var inpObj = document.getElementById("id1");
    if (!inpObj.checkValidity()) {
        document.getElementById("demo").innerHTML = inpObj.validationMessage;
    } else {
        document.getElementById("demo").innerHTML = "Input OK";
    }
}

function validateText(id){
    if($("#"+id).val()==null || $("#"+id).val()==""){
        alert("Validation error");
        return false;
    }
}

$(document).ready(
    function()
    {
        $("#Register_submit_btn").click(function(){
            validateText("first_name");
        });
    }

);


function isEmpty(elemValue, field){
    if(elemValue=="" || elemValue==null){
        alert("You cannot have " + field + " field empty");
        return true;
    }
    else{
        return false;
    }
}

function isAlphebatic(elemValue){
    var exp = /^[a-zA-Z]+$/;
    if(!isEmpty(elemValue, "Customer_name"))
    {
        if(elemValue.match(exp)) {
            return true;
        }
        else
        {
            alert("Enter only text for your First Name");
            return false;
        }
    }
    else{
        return false;}
}

function isAlphaNumeric(elemValue){
    var exp = /^[0-9a-zA-Z]+$/;
    if(!isEmpty(elemValue, "Customer_name"))
    {
        if(elemValue.match(exp))
        {
            return true;
        }
        else
        {
            alert("Enter only text for your Address");
            return false;
        }
    }
    else{
        return false;
    }
}



function emailValidation(elemValue)
{
    if (!isEmpty(elemValue, "email"))
    {
        var atops = elemValue.indexOf("@");
        var dotops = elemValue.indexOf(".");

        if (atops < 1 || dotps + 2 >= elemValue.length || atops + 2 > dotops)
        {
            alert("Enter a valid email address");
            return false;
        }
        else
        {
            return true;
        }
    }
    else
    {
        return false;
    }
}



function formValidate() {
    var Customer_name = document.forms["myform"]["Customer_name"].value;
    var email = document.forms["myform"]["email"].value;
    var category1 = document.forms["myform"]["category1"].value;
    var category2 = document.forms["myform"]["category2"].value;
    var browser = document.forms["myform"]["browser"].value;


    if (isAlphebatic(Customer_name))
        if(emailValidation(email))
            return true;
        else
            return false;
    else
        return false;


}
