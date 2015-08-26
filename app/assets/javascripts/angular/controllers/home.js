app.controller('HomePageCtrl',['$scope', '$http', '$auth', '$location', 'Upload' function($scope, $http, $auth, $location, Upload){

  var url = "<%= ENV['URL'] %>" || "http://localhost:3000/";

  $scope.post = {};
  $scope.image = {};
  $scope.form = {};
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

   $scope.user.email

   $scope.user.school.name

   
  $scope.form.create = function(){
    var data = {
      'item[images]': $scope.item.image,
    };

     // ngFileUpload's method to upload a file
    Upload.upload({
      url: url + 'items',
      fields: data,
      file: $scope.image.file,
      fileFormDataName: 'items[image]'
    }).success(function(response) {
        console.log(response);
    });
  };
}]);
  }
}])