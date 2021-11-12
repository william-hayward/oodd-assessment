
function validate(){
    let fromcardno = document.forms["transactionform"]["cardno"].value;
    let fromcardname = document.forms["transactionform"]["cardfromname"].value;
    let fromcardexpdate = document.forms["transactionform"]["cardfromexpdate"].value;
    let fromcardcvv = document.forms["transactionform"]["cardfromcvv"].value;
    
    let tocardno = document.forms["transactionform"]["cardto"].value;
    let tocardname = document.forms["transactionform"]["cardtoname"].value;
    let tocardexpdate = document.forms["transactionform"]["cardtoexpdate"].value;
    let tocardcvv = document.forms["transactionform"]["cardtocvv"].value;

    let error = false;
    let result = "";
    
    //if from card fields are empty
    if(fromcardno.trim() == ""){
        result += "Please enter your card number <br>";
        error = true;
    }

    if(fromcardname.trim() == ""){
        result += "Please enter the name on your card <br>";
        error = true;
    }

    if(fromcardexpdate.trim() == ""){
        error = true;
        result += "Please enter your cards expiry date <br>";

    }

    if(fromcardcvv.trim() == ""){
        error = true;
        result += "Please enter your cards CVV <br>";
    }
    
    //if tocard fields are empty
     if(tocardno.trim() == ""){
        result += "Please enter the card number you wish to make a transaction to <br>";
        error = true;
    }

    if(tocardname.trim() == ""){
        result += "Please enter the name on the card you wish to make a transaction to  <br>";
        error = true;
    }

    if(tocardexpdate.trim() == ""){
        error = true;
        result += "Please enter the expiry date on the card you wish to make a transaction to <br>";

    }

    if(tocardcvv.trim() == ""){
        error = true;
        result += "Please enter the CVV on the card you wish to make a transaction to <br>";
    }
    
    //if field does not meet required length
    
    if(fromcardno.length < 16){
        error = true;
        result += "Please enter your full card number <br>";
    }
    
    if(tocardno.length < 16){
        error = true;
        result += "Please enter the full card number on the card you wish to make a transaction to<br>";
    }
    
    if(fromcardcvv.length < 3){
        error = true;
        result += "Please enter your full CVV code <br>";
    }
    
    if(tocardcvv.length < 3){
        error = true;
        result += "Please enter the full CVV on the card you wish to make a transaction to <br>";
    }
    
    if(fromcardexpdate.length < 5){
        error = true;
        result += "Please enter your cards expiry date in the format MM/YY <br>";
    }
    
    if(tocardexpdate.length < 5){
        error = true;
        result += "Please enter the expirty date of the card in the format MM/YY that you wish to make a transaction to <br>";
    }
    
    
    
    






    document.getElementById("erroroutput").innerHTML = result;
    return !error;






};