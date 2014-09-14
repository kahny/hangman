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
  $scope.Ax = true
  alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
	# i = 0
  # while i < alphabet.length
  # 	$scope.[i+"x"] = true
  $scope.hangmanform = false

  #trying to match up the body parts to a class name.. setting it out here doesn't work
  x = $scope.count.toString()
  # console.log("x", x)


  #when the secret word form, populate the alphabet array so that the buttons will show on the page and hide the form
  $scope.clickedForm = (word) ->
  	$scope.secretValue = false
  	$scope.alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
  	console.log(word)
  	$scope.secretword = word.toUpperCase() #assuming display will always be uppercase..
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
  $scope.winningmessage = false
  $scope.correctLetterCount = 0 #why does this have to be out here..

  $scope.clicked = (letter) ->
  	x = $scope.count

  	# eventually check that there are no numbers, special characters, or spaces using regex
  	secretWordArray = $scope.secretword.toUpperCase().split("")

  	 # made it $scope. so you could access below.. for some reason variables can't be accessed below
  	sw = $scope.secretword
  	uniq = ""
  	i= 0

  	#get the unique number of characters in a string
  	while i < sw.length
  		uniq += sw[i] if uniq.indexOf(sw[i]) is -1
  		i++
  	uniqueCharacterCount = uniq.length
  	# console.log("unique",uniqueCharacterCount)

  	if $scope.count < 6
	  	if letter in secretWordArray
	  		# console.log("HI")
	  		console.log("number of incorrect guesses:", $scope.count)
	  		$scope[letter] = true # tryng to show the letter and hide the underscore...
	  		$scope[letter+"x"] = false
	  		$scope.correctLetterCount++
	  		console.log("correctLetterCount", $scope.correctLetterCount)
	  		console.log("uniqueCharacterCount", uniqueCharacterCount)
	  		if $scope.correctLetterCount == uniqueCharacterCount
	  			console.log("YOU WON!")
	  			$scope.winningmessage = true
	  		# $scope.underscore = false
	  	else
	  		console.log("not right")
	  		$scope.count++
	  		console.log("number of incorrect guesses:", $scope.count)
	  		console.log("x",x)
	  		console.log("$scope.count", $scope.count)
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
	  	$scope.count++
	  	$scope.leg2 = false
	  	$scope.losingmessage = true

]


