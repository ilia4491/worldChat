<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Full Width Pics - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/css/full-width-pics.css" rel="stylesheet">
  <link href="/css/main.css" rel="stylesheet">
  <style>
      #map {
      width: 80%;
      height: 600px;
      background-color: grey;
      margin-left: auto;
      margin-right: auto;
    }

  </style>

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">Log in</a>
      <a class="navbar-brand" href="#">Register</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Services</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Contact</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
  <!-- Header - set the background image for the header in the line below -->
  <header class="py-5 bg-image-full" style="background-image: url('/img/city.jpg'); ">
  	<div style="position:relative; margin-bottom: 200px;"></div>
  </header>


  <!-- Content section -->
  <section class="py-5">
    <div class="container">
      <h1>Communicate easy</h1>
      <p class="lead">Find the way you will start new acquaintance</p>
      <p>Here you can find any building or organization that is consisted with the one. Find different people in a chat by interests, ask any questions you want and find new friends finally.</p>
      <p>Enter the address and go forward to chats. Create your own one if it does not exists yet. But first Check it there.</p>
      <h1>Enter the address:</h1>
      <div>
          <label class="lead">City:</label>
          <input type="text" id="city" name="city" placeholder="city">

          <label class="lead">Street:</label>
          <input type="text" id="street" name="street" placeholder="street">

        <label class="lead">House number:</label>
        <input type="text" id="number" name="number" placeholder="number">

        <button onclick="printAddress()">Submit</button>
      </div>
    </div>
  </section>

    <div id="map" align="center"></div>

  <!-- Content section -->
  <section class="py-5">
    <div class="container">
      <h1>How it works:</h1>
      <p class="lead">Every single building either has its own chat or may has it and even several ones.</p>
      <p>Our chats has it's own hierarchy. Joining to a chat, we propose you to join to other chats in hierarchy. You can accept or refuse joining as you need.</p>
    </div>
  </section>

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">VIK Company &copy; World Chat 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="/jquery/jquery.min.js"></script>
  <script src="/bootstrap/js/bootstrap.bundle.min.js"></script>

  <script>
  var map;
  var geocoder;
  var marker;
  function initMap() {
    var uluru = {lat: 53.9, lng: 27.5666700};
    map = new google.maps.Map(
        document.getElementById('map'), {zoom: 11, center: uluru});
    geocoder = new google.maps.Geocoder();
    // The marker, positioned at Uluru
    marker = new google.maps.Marker({position: uluru, map: map});

    google.maps.event.addListener(map, "click", function (e) {
    //lat and lng is available in e object
    var latitude = e.latLng.lat();
    var longitude = e.latLng.lng();
    console.log( latitude + ', ' + longitude );
    geocoder.geocode({
      'latLng': e.latLng
    }, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        if (results[0]) {
          alert(results[0].formatted_address);
        }
      }
    });
  });
  }



  function printAddress() {
      var city = document.getElementById("city").value;
      var street = document.getElementById("street").value;
      var number = document.getElementById("number").value;
      var address = city + ', ' + street + ', ' + number;
      <!--marker = new google.maps.Marker({position: {lat: latitude, lng: longitude}, map: map});-->
      geocoder.geocode( { 'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          map.setCenter(results[0].geometry.location);
          marker = new google.maps.Marker({
              map: map,
              position: results[0].geometry.location
          });
        } else {
          alert('Geocode was not successful for the following reason: ' + status);
        }
      });
    }
    </script>
  <script async defer
          src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAywG0euk0tSYg-QroPWjmVI3uZfNy_Jjc&callback=initMap">
  </script>


</body>

</html>
