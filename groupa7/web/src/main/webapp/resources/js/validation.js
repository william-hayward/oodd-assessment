function validate(){
    let fromcardno = document.forms["transactionform"]["cardno"].value;
    let fromcardname = document.forms["transactionform"]["cardfromname"].value;
    let fromcardexpdate = document.forms["transactionform"]["cardfromexpdate"].value;
    let fromcardcvv = document.forms["transactionform"]["cardfromcvv"].value;
    
    let error = false;
    let result = "";
    
    // if from card fields are empty
    
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
    
    //if field does not meet required length
    
    if(fromcardno.length < 16){
        error = true;
        result += "Please enter your full card number <br>";
    }
    
    if(fromcardcvv.length < 3){
        error = true;
        result += "Please enter your full CVV code <br>";
    }
    
    if(fromcardexpdate.length < 5){
        error = true;
        result += "Please enter your cards expiry date in the format MM/YY <br>";
    }

    document.getElementById("erroroutput").innerHTML = result;
    return !error;
};