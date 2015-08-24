app.controller('StaticPagesCtrl',['$scope', '$http', '$auth', '$location', function($scope, $http, $auth, $location){
  $scope.message = "Welcome to CollegeSwap!!";

  $scope.signup = function(){
    $auth.submitRegistration($scope.registrationForm).then(function(response){
      // handle success
      console.log(response)

      $location.path('/#/opening');
    }).catch(function(response){
      // handle errors
      console.log(response)
    })
  }

  $scope.login = function () {
    $auth.submitLogin($scope.loginForm).
     then(function(resp) {
       // handle success response
       console.log(resp);

       // redirect to root when registration succesfull 
       $location.path('/#/opening');
     }).
     catch(function(resp) {
       // handle error response
       console.log(resp);
     });
  };
}]);