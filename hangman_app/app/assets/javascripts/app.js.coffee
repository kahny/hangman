hangmanApp = angular.module "hangmanApp", ["ngRoute", "templates"]

hangmanApp.config ["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
	$routeProvider
		.when '/',
			templateUrl: "index.html",
			controller: "IndexController"
	.otherwise
		redirectTo: "/"

	$locationProvider.html5Mode(true)

]


hangmanApp.controller "IndexController", ["$scope", "$http", ($scope, $http) ->

  $scope.alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
]