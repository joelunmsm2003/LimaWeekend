module.controller('Controller', function ($scope,$http,$localStorage) {


$scope.myInterval = 5000;

  $scope.noWrapSlides = false;
  $scope.active = 0;
  var slides = $scope.slides = [];
  var currIndex = 0;


  /*

  $scope.addSlide = function() {
    var newWidth = 600 + slides.length + 1;
    
    slides.push({
      image: 'http://lorempixel.com/' + newWidth + '/300',
      text: ['Nice image','Awesome photograph','That is so cool','I love that'][slides.length % 4],
      id: currIndex++
    });

 };

 */


 slides.push({
      image: './img/pc.png',
      text: 'En Kangaroonet desarrollamos aplicaciones con Django, AngularJS, Ionic, Bootstrap ',
      id: 0
    });


 slides.push({

      image: './img/wc.png',
      text: 'Integracion rapida de tus sistemas y mejora del Look and Feel de tu sistema',
      id: 1
    });

 slides.push({

      image: './img/wc.png',
      text: 'Mejora la comunicacion con tus clientes, enviando campañas masivas de SMS',
      id: 2
    });



  $scope.randomize = function() {

  	console.log('random')
    var indexes = generateIndexesArray();
    assignNewIndexesToSlides(indexes);
  };

  /*

  for (var i = 0; i < 4; i++) {
    $scope.addSlide();

    console.log($scope.slides)
  }

  
*/


  // Randomize logic below

  function assignNewIndexesToSlides(indexes) {
    for (var i = 0, l = slides.length; i < l; i++) {
      slides[i].id = indexes.pop();
    }
  }

  function generateIndexesArray() {

  	console.log('indexarray')

    var indexes = [];
    for (var i = 0; i < currIndex; ++i) {
      indexes[i] = i;
    }
    return shuffle(indexes);
  }

  // http://stackoverflow.com/questions/962802#962890
  function shuffle(array) {
    var tmp, current, top = array.length;

    console.log('shuffle')

    if (top) {
      while (--top) {
        current = Math.floor(Math.random() * (top + 1));
        tmp = array[current];
        array[current] = array[top];
        array[top] = tmp;
      }
    }

    return array;
  }


  
  function urlBase64Decode(str) {
        var output = str.replace('-', '+').replace('_', '/');
        switch (output.length % 4) {
            case 0:
                break;
            case 2:
                output += '==';
                break;
            case 3:
                output += '=';
                break;
            default:
                throw 'Illegal base64url string!';
        }
        return window.atob(output);
    }

    function getUserFromToken() {
        var token = $localStorage.token;
        var user = {};
        if (typeof token !== 'undefined') {
            var encoded = token.split('.')[1];
            user = JSON.parse(urlBase64Decode(encoded));
        }
        return user;
    }

     

    $scope.ingresar = function (data) {
        
        console.log('ingresar',data)
        
        $http({

        url: "http://localhost:8000/api-token-auth/",
        data: data,
        method: 'POST'
        }).
        success(function(data) {
        
        console.log('returmmm',data.token)

        $localStorage.token = data.token;

        var currentUser = getUserFromToken();
        
        console.log('Decode',currentUser)

    
        })

    };


    $scope.api = function () {

      $http({

        url: "http://localhost:8000/estados/",
        method: 'GET'
        }).
        success(function(data) {
        
          console.log('api',data)
    
        })


    }





});