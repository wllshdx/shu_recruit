function checkForm() {
    let newmima1 = document.getElementById("xinmima").value;
    let newmima2 = document.getElementById("zaiqueren").value;
    let len = newmima1.length;
    if (len < 6 || len > 16) {
        alert("新密码长度必须大于等于6位，小于等于16位！");
        return false;
    } else if (newmima1 !== newmima2) {
        alert("两处新密码不相同！");
        return false;
    }

    console.log(newmima1);
    console.log(newmima2);
}