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
        width: 60%;
        height: 600px;
        background-color: grey;
      }
      #regionButtons > p{
        width: 100%;
        margin: 0 auto;
      }

  </style>
  <!-- Bootstrap core JavaScript -->
  <script src="/jquery/jquery.min.js"></script>
  <script src="/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="https://yandex.st/jquery/2.1.1/jquery.min.js"></script>
  <script src="https://api-maps.yandex.ru/2.1/?apikey=3443334f-d7ce-40e5-add1-95bad0ed4de3&lang=ru_RU" type="text/javascript">
  </script>
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
    <div style="margin-top:40px;">
      <div id="map" class="inline" style="float:left;"></div>
      <div id="regionButtons" class="inline" style="float:left; text-align:center; margin-left:100px;" >
        <div><p class="lead" style="font-weight:bold">Avaliable chat regions:</p ></div>
        <div><button id="cityRegion" class="myButton">Minsk</button></div>

      </div>
      <br style="clear:both;" ></br>
    </div>

  </div>

</section>




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

<script type="text/javascript">
    var myMap;
    var myPlacemark;
    var addressDivCreated = false;
    ymaps.ready(init);
    function init(){
      myMap = new ymaps.Map("map", {
          center: [53.9, 27.5666700],
          zoom: 11
      });

    myMap.events.add('click', function (e) {
        var coords = e.get('coords');

        // Если метка уже создана – просто передвигаем ее.
        if (myPlacemark) {
            myPlacemark.geometry.setCoordinates(coords);
        }
        // Если нет – создаем.
        else {
            myPlacemark = createPlacemark(coords);
            myMap.geoObjects.add(myPlacemark);
            // Слушаем событие окончания перетаскивания на метке.
            myPlacemark.events.add('dragend', function () {
                getAddress(myPlacemark.geometry.getCoordinates());
            });
        }
        getAddress(coords);
        console.log(coords);

    });

    // Создание метки.
    function createPlacemark(coords) {
        return new ymaps.Placemark(coords, {
            iconCaption: 'поиск...'
        }, {
            preset: 'islands#violetDotIconWithCaption',
            draggable: true
        });
    }

    // Определяем адрес по координатам (обратное геокодирование).
    function getAddress(coords) {
        myPlacemark.properties.set('iconCaption', 'поиск...');
        ymaps.geocode(coords).then(function (res) {
            var firstGeoObject = res.geoObjects.get(0);
            var address = firstGeoObject.getAddressLine();
            console.log(address);
            parseAddress(address);



            myPlacemark.properties
                .set({
                    // Формируем строку с данными об объекте.
                    iconCaption: [
                        // Название населенного пункта или вышестоящее административно-территориальное образование.
                        firstGeoObject.getLocalities().length ? firstGeoObject.getLocalities() : firstGeoObject.getAdministrativeAreas(),
                        // Получаем путь до топонима, если метод вернул null, запрашиваем наименование здания.
                        firstGeoObject.getThoroughfare() || firstGeoObject.getPremise()
                    ].filter(Boolean).join(', '),
                    // В качестве контента балуна задаем строку с адресом объекта.
                    balloonContent: firstGeoObject.getAddressLine()
                });
        });
    }

    function parseAddress(address) {
      var addressArray = address.split(',');
      var homeNumber = addressArray[addressArray.length - 1];
      var street = addressArray[addressArray.length - 2];
      var city = addressArray[addressArray.length - 3];
      if (! addressDivCreated) {
        $('#cityRegion').text(city);
        $('#regionButtons').append("<div><button id='streetRegion' class='myButton'>" + street + "</button></div>").append("<div><button id='homeRegion' class='myButton'>" + homeNumber + "</button></div>");
        addressDivCreated = true;
      } else {
        $('#cityRegion').text(city);
        $('#streetRegion').text(street);
        $('#homeRegion').text(homeNumber);
      }
      $('#address').text(address);
      console.log(city);
      console.log(street);
      console.log(homeNumber);
    }

    $('#cityRegion').onClick(function(console.log('clicked')));
  }
</script>




</body>

</html>
