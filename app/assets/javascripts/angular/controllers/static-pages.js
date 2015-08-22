app.controller('StaticPagesCtrl',['$scope', '$http', '$auth', function($scope, $http, $auth){
  $scope.message = "Hello World!";

  $scope.logout = function(){
    $auth.signOut().
      then(function(response){
        // handle success
        console.log(response);
        alert("You have signed out");
      }).
      catch(function(response){
        console.log(response);
      })
  }
}]);