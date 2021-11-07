// let seatSelected = (id) => {
//     $("#seatPosition").val(id)
//     $("#booking").css("display", "block")
// }
function seatSelected(id) {
    let seatPos = document.getElementById("seatPosition");
    let bookingBlock = document.getElementById("booking");

    seatPos.value = id;
    bookingBlock.style.display = "block";
    bookingBlock.scrollIntoView();
}