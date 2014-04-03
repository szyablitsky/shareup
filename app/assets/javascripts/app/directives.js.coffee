angular.module 'myApp.directives', []
# Our is-user-or-email validation
.directive 'isUserOrEmail', ($http, $timeout, $filter, $q) ->
  # we're checking using the api `is_user` if the user
  # input is already a user
  isUser = (input) ->
    # We're returning a deferred promise
    d = $q.defer()
    if input
      $http
        url: '/api/check/is_user'
        method: 'POST'
        data: { 'name': input }
      .then (data) ->
        if data.status == 200
          d.resolve data.data
        else
          d.reject data.data
    else
      d.reject 'No input'
    d.promise

  checking = null
  emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/

  ret =
    restrict: 'A'
    require: 'ngModel'
    link: (scope, ele, attrs, ctrl) ->
      # Anytime that our ngModel changes, we're going to check if the
      # value is a user with the function above
      # If it is a user, then our field will be valid, if it's not
      # check if the input is an email
      scope.$watch attrs.ngModel, (v) ->
        clearTimeout(checking) if checking
        value = ctrl.$viewValue
        checking = $timeout () ->
          isUser(value).then (data) ->
            if data.success
              # Is a user
              checking = null
              ctrl.$setValidity 'isUserOrEmail', true
            else
              # Is an email
              if emailRegex.test value
                checking = null
                ctrl.$setValidity 'isUserOrEmail', true
              else
                checking = null
                ctrl.$setValidity 'isUserOrEmail', false
        # Delay this check by 200 milliseconds to give
        # the keyboard time to settle down
        , 200
