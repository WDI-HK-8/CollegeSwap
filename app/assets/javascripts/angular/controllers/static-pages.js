
app.controller('StaticPagesCtrl',['$scope', '$http', '$auth', function($scope, $http, $auth){
  $(document).ready(function(){
    $(document).on('click', '.landing_page .signup_section', function(){
      $('.landing_page .signup_form').show();
      $('.landing_page .login_form').hide();
      $('.landing_page li.signup_section').attr('class', 'active signup_section');
      $('.landing_page li.login_section').attr('class', 'login_section');
    })

    $(document).on('click', '.landing_page .login_section', function(){
      $('.landing_page .login_form').show();
      $('.landing_page .signup_form').hide();
      $('.landing_page li.login_section').attr('class', 'active login_section');
      $('.landing_page li.signup_section').attr('class', 'signup_section');
    })

  })

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