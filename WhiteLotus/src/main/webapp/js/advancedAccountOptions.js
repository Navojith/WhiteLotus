
function togglePwdChange() {
  var x = document.getElementById('changePwd');
  var btn = document.getElementById('pwdChangeRequestBtn');
  var y = document.getElementById('hiddenCompartmentAdvancedOptions');
  if (x.style.display === "none") {
    x.style.display = "block";
    y.style.boxShadow = "0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)";
    btn.style.background= "#d6111e";
  	btn.style.color= "white"; 
  } else {
    x.style.display = "none";
    y.style.boxShadow = "none";
    btn.style.background= "#1c1c1c";
  	btn.style.color= "#d6111e";
  }
} 

function toggleDeleteAccount() {
  var x = document.getElementById('deleteAccount');
  var btn = document.getElementById('deleteAccountRequestBtn');
  var y = document.getElementById('hiddenCompartmentAdvancedOptions');
  if (x.style.display === "none") {
    x.style.display = "block";
    y.style.boxShadow = "0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)";
    btn.style.background= "#d6111e";
  	btn.style.color= "white"; 
  } else {
    x.style.display = "none";
    y.style.boxShadow = "none";
    btn.style.background= "#1c1c1c";
  	btn.style.color= "#d6111e";
  }
} 


function toggleProfilePicChane() {
  var x = document.getElementById('uploadProfilePic');
  var btn = document.getElementById('ChangeProfilePicRequestBtn');
  var y = document.getElementById('hiddenCompartmentAdvancedOptions');
  if (x.style.display === "none") {
    x.style.display = "block";
    y.style.boxShadow = "0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)";
    btn.style.background= "#d6111e";
  	btn.style.color= "white"; 
  } else {
    x.style.display = "none";
    y.style.boxShadow = "none";
    btn.style.background= "#1c1c1c";
  	btn.style.color= "#d6111e";
  }
}