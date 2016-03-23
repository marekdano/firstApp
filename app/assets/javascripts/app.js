var app = angular.module('shop', ['ngResource']);

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

app.factory('models', ['$resource', function($resource) {
  var orders_model = $resource("/orders/:id.json", {id: "@id"});
  var products_model = $resource("/products/:id.json", {id: "@id"});

  var x = {
    orders: orders_model,
    products: products_model
  }; 
  return x;
}]);

app.controller('OrdersCtrl', ['$scope', 'models', function($scope, models) {
  $scope.myname = "Marek";

  // $scope.orders = [
  //   {id: 1, total: 24, product_id: 1, user_id: 1},
  //   {id: 2, total: 7, product_id: 1},
  //   {id: 3, total: 42, product_id: 1, user_id: 1}
  // ];
  $scope.orders = models.orders.query();
  $scope.products = models.products.query();

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

