angular.module 'myApp.controllers', []
.controller 'HomeController', ($scope, session, SessionService, ArticleService, Share) ->
  $scope.user = session.user
  $scope.user.name ||= $scope.user.email
  ArticleService
  .getLatestFeed()
  .then (data) ->
    $scope.articles = data
