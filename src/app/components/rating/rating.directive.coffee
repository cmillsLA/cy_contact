angular.module 'app'
  .directive 'cyStars', ->

    directive =
      restrict: 'EA'
      templateUrl: 'app/components/rating/rating.html'
      scope:
        rating: '=rating'
        test: '=ngModel'
      link:(scope, elem, attrs) ->

        scope.stars = []
        scope.cytmprating = 0

        i = 0
        while i < attrs.max
          scope.stars.push(i)
          i += 1

        scope.cyrate = (val) ->
          scope.cytmprating = val
          scope.rating = val

        scope.cyratehover = (val) ->
          # Hover star value on mouseover.
          if val
            scope.cytmprating = scope.rating
            scope.rating = val
          # Restore to default on mouseout.
          else
            scope.rating = scope.cytmprating

        return
