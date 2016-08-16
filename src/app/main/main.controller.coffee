angular.module 'app'
  .controller 'MainController', ($scope, $timeout, FileUploader) ->
    'ngInject'

    $scope.cysubmitted = false
    $scope.cysubmit = false
    $scope.cyshowthanks = false
    $scope.rating = 0

    $scope.uploader = new FileUploader(url: 'demo')

    $scope.cyform = {}

    $scope.cysubmitcontact = (cyform) ->
      # Verify form is valid.
      if cyform.$valid
        # Disable form during $http req.
        $scope.cysubmit = true
        $scope.cyform.rating = $scope.rating
        # Demo - show loader.
        _demo = $timeout (->
          # Hide form.
          $scope.cysubmitted = true
          return
        ), 2000

        _demo2 = $timeout (->
          # Show thank you message.
          $scope.cyshowthanks = true
          return
        ), 2500

    return
