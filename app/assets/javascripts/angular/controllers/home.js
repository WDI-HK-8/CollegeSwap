app.controller('HomePageCtrl',['$scope', '$http', '$auth', '$location', 'Upload', function($scope, $http, $auth, $location, Upload){

	var url = "http://localhost:3000";

	$scope.item = {};
  $scope.image = {};
  $scope.itemForm = {};

  $http.get(url + '/swap').success(function(response){
    console.log(response);
    $scope.listedItems = response;
    $scope.swapcount = response.length
  });

  $scope.itemForm.create = function(){
    var data = {
      'item[name]': $scope.item.name,
      'item[category]': $scope.item.category,
      'item[price]': $scope.item.price,
      'item[description]': $scope.item.description
    };

    Upload.upload({
      url: url + '/items',
      fields: data,
      file: $scope.image.file,
      fileFormDataName: 'item[image]'
    }).success(function(response) {
        console.log(response);
    });;

    console.log(data);

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