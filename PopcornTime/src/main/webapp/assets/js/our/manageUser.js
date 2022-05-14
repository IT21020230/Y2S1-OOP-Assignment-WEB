function validateAddUser(){

	const username = document.getElementById("username");
	const password = document.getElementById("password");
	    
    if(username.value.length < 3){
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