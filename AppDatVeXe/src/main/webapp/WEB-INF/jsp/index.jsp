<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h1 class="text-center">Hệ thống đặt vé xe</h1>
<form:form method="post" action="" modelAttribute="">
    <div class="book-ticket">
        <div class="book-ticket-container">
            <div class="roundtrip-checkbox-container">
                <input type="radio" class="checkbox" value="oneway" checked="oneway"/>
                <label>Một chiều</label>
                <input type="radio" class="checkbox" value="round-trip"/>
                <label>Khứ hồi</label>
            </div>
            <div class="select-container">
                <div class="select-place-container">
                    <div class="auto-fill-place">
                        <label class="label-small">Điểm đi</label>
                        {/* <input class="select-place" id="select_origin" spellCheck="false" type="search" placeholder="Chọn điểm đi" onClick={showListPlace} />
                        <div class={click? "data-list-container" : "data-list-container hide"}>
                    </div> */}
                    <Dropdown selected={startPlace} setSelected={setStartPlace}></Dropdown>
                </div>
                <div class="auto-fill-place">
                    <label class="label-small">Điểm đến</label>
                    <Dropdown selected={destination} setSelected={setDestination}></Dropdown>
                </div>
            </div>
            <div class="select-date-container">
                <div class="select-date">
                    <label class="label-small">Ngày đi</label>
                    <DatePicker
                            selected={startDate}
                            onChange={date => setStartDate(date)}
                    minDate={new Date()}
                    />
                </div>
                <div class="select-date">
                    <label class="label-small">Ngày về</label>
                    <div class={radio === "round-trip"? '' : 'select-date-dis'}>
                    <DatePicker
                            selected={backDate}
                            onChange={date => setBackDate(date)}
                    minDate={new Date()}
                    />
                </div>


            </div>
        </div>
        </div>
        <Button buttonStyle="btn--search" buttonSize="btn--search-size" to="/search">TÌM CHUYẾN</Button>
        </div>
    </div>
</form:form>