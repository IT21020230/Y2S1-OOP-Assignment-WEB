
function validateUpdate(){
	
const username = document.getElementById("username");
const password = document.getElementById("password");
const email = document.getElementById("email");

    //Fill empty fields
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