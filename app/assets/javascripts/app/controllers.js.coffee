angular.module 'myApp.controllers', []
.controller 'HomeController', ($scope, session, SessionService, ArticleService, Share) ->

  $scope.user = session.user
  $scope.user.name ||= $scope.user.email

  ArticleService.getLatestFeed()
  .then (data) ->
    $scope.articles = data

  $scope.newShare =
    recipient: ''

  $scope.share = (article) ->
    share = new Share
      url: article.link
      from_user: $scope.user.id
      user: $scope.newShare.recipient
    share.$save()
    $scope.newShare.recipient = ''
