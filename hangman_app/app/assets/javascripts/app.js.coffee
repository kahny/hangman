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
  $scope.alphabetbutton = true
  $scope.notbutton = false
  $scope.secretWord = "secret"
  count = 0
  $scope.clicked = (letter) ->
  	# console.log(letter)
  	secretWordArray = secretWord.split("")
  	if count < 10
	  	if letter in secretWordArray
	  		console.log("HI")
	  		count++
	  		console.log(count)
	  	else
	  		console.log("not right")
	  		count++
	  		console.log(count)
	  else
	  	console.log("you're almost dead")
	  	alert("You're dead, the word is #{secretWord}")

  secretWord = "SECRET"
]