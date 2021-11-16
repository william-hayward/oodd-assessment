document.getElementById("adminforms").style.display = "none";

document.getElementById("adminlogin").addEventListener("submit", event=>{
    event.preventDefault();

    let adminusername = document.forms["adminlogin"]["adminusername"].value;
    let adminpassword = document.forms["adminlogin"]["adminpassword"].value;

    let error = false;
    let result = "";
    
    //checking the username and password are correct
    if (adminusername.trim() != "admin"){
        result += "The username you have entered is invalid <br>";
        error = true;
    }
    
    if(adminpassword.trim() != "admin"){
        result += "The password you have entered is invalid <br>";
        error = true;
    }
    
    document.getElementById("erroroutput").innerHTML = result;
    
    if (!error) {
        document.getElementById("adminforms").style.display = "block";
        document.getElementById("adminlogin").style.display = "none";
    }
});
