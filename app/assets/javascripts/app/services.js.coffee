angular.module 'myApp.services', []
.factory 'ArticleService', ($http, $q) ->
  service =
    getLatestFeed: () ->
      d = $q.defer()
      $http.jsonp 'http://ajax.googleapis.com/ajax/services/feed/load' +
        '?v=1.0&num=50&callback=JSON_CALLBACK&q=' +
        encodeURIComponent 'http://feeds.huffingtonpost.com/huffingtonpost/raw_feed'
      .then (data, status) ->
        # Huffpost data comes back as
        # data.data.responseData.feed.entries
        if data.status is 200
          d.resolve data.data.responseData.feed.entries
        else
          d.reject data
      d.promise
  service
