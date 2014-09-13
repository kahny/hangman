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

  $scope.alphabet = []
  $scope.alphabetbutton = true
  $scope.secretValue = true
  $scope.notbutton = false

  count = 0
  secretword = ""
  #when the secret word form, populate the alphabet array so that the buttons will show on the page and hide the form
  $scope.clickedForm = (word) ->
  	console.log("YO")
  	$scope.secretValue = false
  	$scope.alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
  	console.log(word)
  	secretword = word

  #when the button is clicked, check that the letter matches the secret word
  $scope.clicked = (letter) ->
  	# eventually check that there are no numbers, special characters, or spaces using regex
  	secretWordArray = secretword.toUpperCase().split("")
  	if count < 10
	  	if letter in secretWordArray
	  		console.log("HI")
	  		console.log("number of incorrect guesses:", count)
	  	else
	  		console.log("not right")
	  		count++
	  		console.log("number of incorrect guesses:", count)
	  else
	  	console.log("you're almost dead")
	  	alert("You're dead, the word is #{secretword}")

]