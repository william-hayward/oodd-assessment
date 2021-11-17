let loggedinrefund = document.forms["transactionform"]["isloggedin"].value;
let loggedinadmin = document.forms["adminform"]["isloggedin"].value;
let loggedinurl = document.forms["urlform"]["isloggedin"].value;
// get the loggedinproperties isloggedin value here

// if loggedinrefund or loggedinproperties has "true", then dont display the login form but show the properties & refund form 
if (loggedinrefund == "false" || loggedinadmin == "false" || loggedinurl == "false") {
    document.getElementById("adminforms").style.display = "none";
} else {
    document.getElementById("adminlogin").style.display = "none";
};

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
        document.forms["adminlogin"]["isloggedin"].value = "true";
        document.forms["transactionform"]["isloggedin"].value = "true";
    }
});
