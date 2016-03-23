var app = angular.module('shop', []);

/*
* Following piece of code has to be added
* while the turbolinks gem is used in the app
* The line that starts with angular.bootstrap() will manually generate 
* an ng-app directive on the body tag of your app. 
* Since then the ng-app directives can be removed 
* from the html tag.
*/
$(document).on('ready page:load', function() {
  angular.bootstrap(document.body, [ 'shop'])
});

app.controller('OrdersCtrl', ['$scope', function($scope) {
  $scope.myname = "Marek";

  $scope.orders = [
    {id: 1, total: 24, product_id: 1, user_id: 1},
    {id: 2, total: 7, product_id: 1},
    {id: 3, total: 42, product_id: 1, user_id: 1}
  ];

  $scope.addOrder = function() {
    console.log($scope.newOrder);
    if(!$scope.newOrder.product_id || $scope.newOrder.total === '') {
      console.log("Product ID or Total is empty.");
      return;
    }
    $scope.orders.push($scope.newOrder);
  };

  $scope.deleteOrder = function(order) {
    $scope.orders.splice($scope.orders.indexOf(order), 1);
  };
}]);

