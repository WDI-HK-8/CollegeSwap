
app.controller('offerPageCtrl',['$scope', '$http', '$auth', '$location', function($scope, $http, $auth, $location){
  $(document).ready(function() 
    { 
        $(".offer_received").tablesorter();
        $(".offer_sent").tablesorter(); 
        $(".close_case").tablesorter();
    } 
  ); 
    
}]);