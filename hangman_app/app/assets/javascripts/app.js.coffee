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
  $scope.count = 0
  $scope.secretword = ""
  $scope.secretWordDisplay = false
  $scope.underscore = true
  $scope.hangmanform = false

  #trying to match up the body parts to a class name.. setting it out here doesn't work
  x = $scope.count.toString()
  # console.log("x", x)


  #when the secret word form, populate the alphabet array so that the buttons will show on the page and hide the form
  $scope.clickedForm = (word) ->
  	console.log("YO")
  	$scope.secretValue = false
  	$scope.alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
  	console.log(word)
  	$scope.secretword = word
  	$scope.hangmanform = true

  #when the button is clicked, check that the letter matches the secret word

  $scope.head = true
  $scope.neck = true
  $scope.arm1 = true
  $scope.arm2 = true
  $scope.body = true
  $scope.leg1 = true
  $scope.leg2 = true

  $scope.losingmessage = false

  $scope.clicked = (letter) ->
  	x = $scope.count.toString()
  	# eventually check that there are no numbers, special characters, or spaces using regex
  	secretWordArray = $scope.secretword.toUpperCase().split("")
  	if $scope.count < 6
	  	if letter in secretWordArray
	  		console.log("HI")
	  		console.log("number of incorrect guesses:", $scope.count)
	  		$scope.A = true # tryng to show the letter and hide the underscore...
	  		# $scope.underscore = false
	  	else
	  		console.log("not right")
	  		$scope.count++
	  		console.log("number of incorrect guesses:", $scope.count)
	  		console.log("x",x)
	  		# getting rid of parts on the body
	  		$scope.head = false
	  		if $scope.count == 2  #how come this doesn't work if it's x==2 instead, if we set x up there and it prints out?
	  			$scope.neck = false
	  		if $scope.count == 3
	  			$scope.arm1 = false
	  		if $scope.count == 4
	  			$scope.arm2 = false
	  		if $scope.count == 5
	  			$scope.body = false
	  		if $scope.count == 6
	  			$scope.leg1 = false

	  else
	  	console.log("you're almost dead")
	  	$scope.leg2 = false
	  	$scope.losingmessage = true

]


