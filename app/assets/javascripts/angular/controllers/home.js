app.controller('HomePageCtrl',['$scope', '$http', '$auth', '$location', function($scope, $http, $auth, $location){

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