document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("contactForm");
    
    form.onsubmit = function(event) {
        event.preventDefault();
        alert("Form submitted!");
        // Here you would handle the form data and send it to your server
    };
});

function initMap() {
    var location = { lat: 23.520444, lng: 87.311923 }; // Coordinates for Durgapur
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 15,
        center: location
    });
    var marker = new google.maps.Marker({
        position: location,
        map: map
    });
}