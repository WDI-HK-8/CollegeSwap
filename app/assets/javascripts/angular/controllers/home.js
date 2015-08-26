app.controller('HomePageCtrl',['$scope', '$http', '$auth', '$location', function($scope, $http, $auth, $location){

	var url = "http://localhost:3000";

	$scope.item = {};
  $scope.itemForm = {};

  $http.get(url + '/swap').success(function(response){
    console.log(response);
    $scope.listedItems = response;
  });

  $scope.itemForm.create = function(){
    var data = {
      item: $scope.item
    };

    $http.post(url + '/items', data).then(function(response){
      console.log(response);
    }, function(response){
    	console.log(response);
    });
  };

	$scope.logout = function(){
  	$auth.signOut().
  		then(function(response){
  			// handle success
  			console.log(response);
  			alert("You have signed out");
  			$location.path("/");
  		}).
  		catch(function(response){
  			console.log(response);
  		})
  }
}])