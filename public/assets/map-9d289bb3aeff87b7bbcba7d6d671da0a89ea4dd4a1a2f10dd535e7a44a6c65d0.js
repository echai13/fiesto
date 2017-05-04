function initMap() {
    var display = gon.latlong
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 15,
        center: display
    });
    var marker = new google.maps.Marker({
        position: display,
        map: map
    });
}
;
