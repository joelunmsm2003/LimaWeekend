    var module = angular.module("App", ['ngAnimate','ngRoute','ui.bootstrap','ngStorage']);

    host ='http://localhost:8000'


    module.config(['$routeProvider','$httpProvider',

        function($routeProvider,$httpProvider) {

            $routeProvider.

                when('/menu', {
                    templateUrl: 'menu.html',
                    controller: 'Controller'
                }).
                when('/clientes/', {
                    templateUrl: 'clientes.html',
                    controller: 'Sms'
                }).
                 when('/sms', {
                    templateUrl: 'sms.html',
                    controller: 'Sms'
                }).
                 when('/reportes', {
                    templateUrl: 'reportes.html',
                    controller: 'Sms'
                }).

                 when('/servicios', {
                    templateUrl: 'servicios.html',
                    controller: 'Admin'
                }).


                otherwise({
                    redirectTo: '/'
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
