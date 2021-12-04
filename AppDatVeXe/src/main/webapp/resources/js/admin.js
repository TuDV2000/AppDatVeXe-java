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
function checkTripInput(){
    const tripName = document.getElementById('tripName');
    const tripLine = document.getElementById('tripLine');
    var startTrip = document.getElementById('startTrip');
    var endTrip = document.getElementById('endTrip');
    const blankSeat = document.getElementById('blankSeat');
    const tripDriver = document.getElementById('tripDriver');
    const extraChanges = document.getElementById('extraChanges');
    
    // console.log("tripName =" + tripName.value );
    // console.log("tripLine =" + tripLine.value );
    // console.log("startTrip =" + startTrip.value );
    // console.log("endTrip =" + endTrip.value );
    // console.log("blackSeat =" + blackSeat.value );
    console.log("tripDriver =" + tripDriver.value );
    // console.log("extraChanges =" + extraChanges.value );
    // console.log(compareDate(startTrip.value, endTrip.value));

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