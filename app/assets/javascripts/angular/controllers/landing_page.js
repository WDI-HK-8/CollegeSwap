$(document).ready(function(){
  var changeToLogin = function (){
    $('.signup_section').attr('class', 'signup_section');
    $('.login_section').attr('class', 'active login_section');
    $('.signup_form').hide();
    $('.login_form').show();
  }

  var changeToSignup = function (){
    $('.login_section').attr('class', 'login_section');
    $('.signup_section').attr('class', 'active signup_section');
    $('.login_form').hide();
    $('.signup_form').show();

  }

  $(document).on('click', '.login_section', function (){
    changeToLogin();
  })

   $(document).on('click', '.signup_section', function (){
    changeToSignup();
  })
})

app.controller('LandingPageCtrl',['$scope', '$http', '$auth', function($scope, $http, $auth){
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