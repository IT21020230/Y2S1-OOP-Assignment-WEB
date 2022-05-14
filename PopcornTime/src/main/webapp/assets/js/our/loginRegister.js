 //Fill empty fields
function validateLogin(){
    if(document.getElementById("username").value == ""){
        alert("Username cannot be empty!");
        return false;
    }
    
    if(document.getElementById("password").value == ""){
        alert("Password cannot be empty!");
        return false;
    }
    
}


function validateRegister(){
	
const username = document.getElementById("movify_user_login");
const password = document.getElementById("movify_password");
const email = document.getElementById("movify_user_email");

    //Fill empty fields
    if(email == "") {
		alert("Email must be filled");
        return false;	
	}
	if(username == null) {
		alert("Username must be filled");
        return false;	
	}
	if(password == null ) {
		alert("Password must be filled");
        return false;	
	}
	
	//Check fields are according to the given format
	if(username.value.length < 3) {
		alert("Username is too short");
        return false;	
	}
	if(username.value.length > 12){
        alert("Username is too long");
        return false;
    }
    
    if(password.value.length < 8){
        alert("Password is too short");
        return false;
    }
    if(password.value.length > 18){
        alert("Password is too long");
        return false;
    }

}