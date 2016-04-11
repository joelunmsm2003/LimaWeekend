
var module = angular.module("myApp", ['ngRoute','ngStorage']);


module.config(['$routeProvider','$httpProvider',

    function($routeProvider,$httpProvider) {

        $routeProvider.

            when('/', {
                templateUrl: 'index.html',
                controller: 'Todo'
            }).

            when('/nope', {
                templateUrl: 'nope.html',
                controller: 'Todo'
            }).


            otherwise({
                redirectTo: '/queee'
            });


        $httpProvider.interceptors.push(['$q', '$location', '$localStorage', function($q, $location, $localStorage) {
        return {
                'request': function (config) {
                    config.headers = config.headers || {};
                    if ($localStorage.token) {
                        config.headers.Authorization = 'Bearer ' + $localStorage.token;
                    }
                    return config;
                },
                'responseError': function(response) {
                    if(response.status === 401 || response.status === 403) {
                        $location.path('/signin');
                    }
                    return $q.reject(response);
                }
            };
        }]);

    }]);


module.controller("Todo", function($scope,$http,$rootScope,$location,$localStorage) {


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

        url: "http://localhost:8000/jwt/",
        method: 'POST'
        }).
        success(function(data) {
        
          console.log('api',data)
    
        })


    }





});
