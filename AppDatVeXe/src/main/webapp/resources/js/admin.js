$(document).ready(function () {

    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });

});
function checkInput(){
    //Create Line
    const lineName = document.getElementById('name');
    const startPlace = document.getElementById('startPlace');
    const endPlace = document.getElementById('endPlace');
    const price = document.getElementById('price');
    const distance = document.getElementById('distance');
    const time = document.getElementById('time');
    //line name
    if(lineName.value.trim() == ""){
        setErrorFor(lineName, 'Không được để trống tên tuyến');
        return false;
    }else {
        setSuccessFor(lineName);
    }
    //start Place
    if(startPlace.value.trim() == "Chọn điểm"){
        setErrorFor(startPlace, 'Yêu cầu chọn điểm bắt đầu');
        return false;
    }else {
        setSuccessFor(startPlace);
    }
    //end Place
    if(endPlace.value.trim() == "Chọn điểm"){
        setErrorFor(endPlace, 'Yêu cầu chọn điểm kết thúc');
        return false;
    }else {
        setSuccessFor(endPlace);
    }
    //price
    if(price.value.trim() == ""){
        setErrorFor(price, 'Nhập giá vé');
        return false;
    }else {
        setSuccessFor(price);
    }
    //distance
    if(distance.value.trim() == ""){
        setErrorFor(distance, 'Nhập quãng đường');
        return false;
    }else {
        setSuccessFor(distance);
    }
    //time
    if(time.value.trim() == ""){
        setErrorFor(time, 'Nhập thời gian dự kiến');
        return false;
    }else {
        setSuccessFor(time);
    }
}
function checkLineUpdateInput(id){
    const price = document.getElementById('priceUpdate-' + id);
    const distance = document.getElementById('distanceUpdate-'+ id);
    const time = document.getElementById('timeUpdate-'+ id);
    //price
    if(price.value.trim() == ""){
        setErrorFor(price, 'Nhập giá vé');
        return false;
    }else {
        setSuccessFor(price);
    }
    //distance
    if(distance.value.trim() == ""){
        setErrorFor(distance, 'Nhập quảng đường');
        return false;
    }else {
        setSuccessFor(distance);
    }
    //time
    if(time.value.trim() == ""){
        setErrorFor(time, 'Nhập thời gian dự kiến');
        return false;
    }else {
        setSuccessFor(time);
    }
}
function checkTripInput(){
    const tripName = document.getElementById('tripName');
    const tripLine = document.getElementById('tripLine');
    var startTrip = document.getElementById('startTrip');
    var endTrip = document.getElementById('endTrip');
    const blankSeat = document.getElementById('blankSeat');
    const tripDriver = document.getElementById('tripDriver');
    const extraChanges = document.getElementById('extraChanges');

    if(tripName.value.trim() == ""){
        setErrorFor(tripName, 'Không được để trống tên chuyến');
        return false;
    }else {
        setSuccessFor(tripName);
        if(tripLine.value.trim() == "Chọn tuyến"){
            setErrorFor(tripLine, 'Chọn tuyến');
            return false;
        }else {
            setSuccessFor(tripLine);
            if(startTrip.value.trim() == ""){
                setErrorForWithoutIcon(startTrip, 'Chọn thời gian khởi hành');
                return false;
            }else {
                setSuccessFor(startTrip);
                if(endTrip.value.trim() == ""){
                    setErrorForWithoutIcon(endTrip, 'Chọn thời gian kết thúc');
                    return false;
                }else if(compareDate(startTrip.value, endTrip.value) == false) {
                    setErrorForWithoutIcon(endTrip, 'Thời gian kết thúc phải sau thời gian khởi hành');
                    return false;
                }else {
                    setSuccessFor(endTrip);
                    if(blankSeat.value.trim() == ""){
                        setErrorFor(blankSeat, 'Nhập số lượng ghế trống');
                        return false;
                    }else
                    {
                        setSuccessFor(blankSeat)
                        if(tripDriver.value.trim() == 0){
                            setErrorFor(tripDriver, 'Chọn tài xế');
                            return false;
                        }else
                            {
                            setSuccessFor(tripDriver)
                                if(extraChanges.value.trim() == ""){
                                    setErrorFor(extraChanges, 'Nhập phụ thu. Nếu không có phụ thu nhập 0');
                                    return false;
                                }else{
                                    setSuccessFor(extraChanges);
                                }
                        }
                    }
                }
            }
        }
    }
    
}
function checkTripUpdate(id){
    const blankSeat = document.getElementById('blankSeatUpdate-'+id);
    const tripDriver = document.getElementById('driverUpdate-'+id);
    const extraChanges = document.getElementById('extraChangesUpdate-'+id);

    //blankSeat
    if(blankSeat.value.trim() == ""){
        setErrorFor(blankSeat, 'Nhập số ghế trống');
        return false;
    }else {
        setSuccessFor(blankSeat);
    }
    //driver
    if(tripDriver.value.trim() != ""){
        setSuccessFor(tripDriver);
    }
    //extraChange
    if(extraChanges.value.trim() == ""){
        setErrorFor(extraChanges, 'Nhập phụ thu');
        return false;
    }else {
        setSuccessFor(extraChanges);
    }
}
function checkPlaceInput(){
    const placeName = document.getElementById('placeName');
    const placePicture = document.getElementById('placePicture');

    //placeName
    if(placeName.value.trim() == ""){
        setErrorFor(placeName, 'Nhập tên địa điểm');
        return false;
    }else {
        setSuccessFor(placeName);
    }
    //placePicture
    if(placePicture.value.trim() == ""){
        setErrorForWithoutIcon(placePicture, 'Chọn ảnh minh họa');
        return false;
    }else {
        setSuccessFor(placePicture);
    }
}
function checkPlaceUpdate(id){
    const placePicture = document.getElementById('placePictureUpdate'+id);

    //placePicture
    if(placePicture.value.trim() == ""){
        setErrorForWithoutIcon(placePicture, 'Chọn ảnh minh họa');
        return false;
    }else {
        setSuccessFor(placePicture);
    }
}
function checkUserInput(){
    const firstname = document.getElementById("firstname");
    const lastname = document.getElementById("lastname");
    const username = document.getElementById('username');
    const phone = document.getElementById('phoneNumber');
    const password = document.getElementById('password');
    const password2 = document.getElementById('password2');
    const permission = document.getElementById('permission');

    //last name
    if(lastname.value.trim() == ""){
        setErrorFor(lastname, 'Không được để trống họ của bạn');
        return false;
    }else {
        setSuccessFor(lastname);
    }
    //first name
    if(firstname.value.trim() == ""){
        setErrorFor(firstname, 'Không được để trống tên của bạn');
        return false;
    }else {
        setSuccessFor(firstname);
    }
    //user name
    if(username.value.trim() == ""){
        setErrorFor(username, 'Không được để trống tên đăng nhập');
        return false;
    }else {
        setSuccessFor(username);
    }
    //phone
    if(phone.value.trim() == ""){
        setErrorFor(phone,'Không được để trống số điện thoại');
        return false;
    }else if(!isPhone(phone.value.trim())){
        setErrorFor(phone, 'Số điện thoại không hợp lệ');
        return false;
    }else {
        setSuccessFor(phone);
    }
    //password
    if(password.value.trim() == ""){
        setErrorFor(password, 'Không được để trống mật khẩu');
        return false;
    }else if (password.value.trim().length <= 6){
        setErrorFor(password,'Mật khẩu phải dài hơn 6 ký tự')
        return false;
    }else {
        setSuccessFor(password);
    }
    //password check
    if(password2.value.trim() == ""){
        setErrorFor(password2,'Không được để trống xác thực mật khẩu');
        return false;
    }else if(password.value.trim() != password2.value.trim()){
        setErrorFor(password2, 'Mật khẩu xác thực không đúng');
        return false;
    }else {
        setSuccessFor(password2);
    }
    // permission
    if(permission.value.trim() == ""){
        setErrorFor(permission,'Chọn loại người dùng');
        return false;
    }else {
        setSuccessFor(permission);
    }
    return true;
}
function checkUserUpdate(id){
    const firstname = document.getElementById("firstnameUpdate"+id);
    const lastname = document.getElementById("lastnameUpdate" + id);
    const phone = document.getElementById('phoneNumberUpdate'+ id);
    const address = document.getElementById('addressUpdate'+ id);
    //last name
    if(lastname.value.trim() == ""){
        setErrorFor(lastname, 'Nhập họ của bạn');
        return false;
    }else {
        setSuccessFor(lastname);
    }
    //first name
    if(firstname.value.trim() == ""){
        setErrorFor(firstname, 'Nhập tên của bạn');
        return false;
    }else {
        setSuccessFor(firstname);
    }
    //address
    if(address.value.trim() == ""){
        setErrorFor(address, 'Nhập địa chỉ');
        return false;
    }else {
        setSuccessFor(address);
    }
    return true;
    //phone
    if(phone.value.trim() == ""){
        setErrorFor(phone,'Nhập số điện thoại');
        return false;
    }else if(!isPhone(phone.value.trim())){
        setErrorFor(phone, 'Số điện thoại không hợp lệ');
        return false;
    }else {
        setSuccessFor(phone);
    }
}
function  setErrorFor(input, message){
    const formOutline = input.parentElement;
    const small = formOutline.querySelector('small');

    small.innerText = message;
    formOutline.className = "form-group mb-4 error";
}
function  setErrorForWithoutIcon(input, message){
    const formOutline = input.parentElement;
    const small = formOutline.querySelector('small');

    small.innerText = message;
    formOutline.className = "form-group mb-4 error noicon";
}
function setSuccessFor(input){
    const formOutline = input.parentElement;
    formOutline.className = "form-group mb-4 success";
}
function compareDate(sdate, edate){
    const sY = sdate.substring(0,4);
    const eY = edate.substring(0,4);
    const sM = sdate.substring(5,7);
    const eM = edate.substring(5,7);
    const sD = sdate.substring(8,10);
    const eD = edate.substring(8,10);
    const sH = sdate.substring(11,13);
    const eH = edate.substring(11,13);
    const sMi= sdate.substring(14);
    const eMi= edate.substring(14);


    if(eY < sY)
    {
        console.log(sY);
        console.log(eY);
        return false;
    }
    else if(eM < sM) {
        console.log(sM);
        console.log(eM);
        return false;
    }
    else if(eD < sD){
        console.log(sD);
        console.log(eD);
        return false;
    }
    else if(eH < sH){
        console.log(sH);
        console.log(eH);
        return false;
    }
    else if(eMi < sMi){
        console.log(sMi);
        console.log(eMi);
        return false;
    }
    else
        return true;
}
function isPhone(phone) {
    return /((09|03|07|08|05)+([0-9]{8})\b)/g.test(phone);
}