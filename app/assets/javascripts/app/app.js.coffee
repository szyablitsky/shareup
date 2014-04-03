angular.module 'myApp', [
  'ngRoute', 'ngResource', 'myApp.controllers'
  'myApp.services', 'myApp.directives'
]
.config ($routeProvider) ->
  $routeProvider.when '/',
    templateUrl: '/templates/dashboard.html'
    controller: 'HomeController'
    resolve:
      session: (SessionService) ->
        SessionService.getCurrentUser()
  .otherwise
    redirectTo: '/'
