Class {
	#name : #TestingGame,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
TestingGame >> testAPlayerPositionChangesWhenPlays [
	
	| dice1 dice2 dice3 setOfDices player |
	
	dice1 := PowerfullDice  newwithNFaces: 5.
	dice2 := PowerfullDice  newwithNFaces: 10.
	dice3 := PowerfullDice newwithNFaces: 5.
	setOfDices := Set new.
	setOfDices add: dice1;
		add:dice2;
		add:dice3.
	player:= Player newWithName: 'Sol'.
	player playsWith: setOfDices.
	player playsWith: setOfDices.
	self assert: player position equals: 41.
]

{ #category : #tests }
TestingGame >> testChangeTurn [
	

	| player1 player2 player3 collectionOfPlayers aPlayingSequence|
	
	player1 := Player newWithName: 'Sol'.
	player2 := Player newWithName: 'Dubi'.
	player3 := Player newWithName: 'Nico'.
	collectionOfPlayers  := OrderedCollection new. 
	collectionOfPlayers add: player1;
	add:player2;
	add:player3. 
	aPlayingSequence:= PlayingSequence newWithAllPlayers: collectionOfPlayers.
	aPlayingSequence changeToNextPlayer.
	self assert: aPlayingSequence currentPlayer name equals: 'Dubi'.
	
	
	
]

{ #category : #tests }
TestingGame >> testCreateACollectionOfPlayers [
	

	| player1 player2 player3 collectionOfPlayers| 
	
	player1 := Player newWithName: 'Sol'.
	player2 := Player newWithName: 'Dubi'.
	player3 := Player newWithName: 'Nico'.
	collectionOfPlayers := OrderedCollection  new. 
	collectionOfPlayers add: player1;
	add:player2;
	add:player3. 
	
	self assert: collectionOfPlayers size equals: 3.
]

{ #category : #tests }
TestingGame >> testCreateAGameAndPlay [
	| player1 player2 player3 dices dice1 dice2 dice3 judge board players winner playingSequence |
	
	

	player1 := Player newWithName: 'Sol'.
	player2 := Player newWithName: 'Dubi'.
	player3 := Player newWithName: 'Nico'.
	players := OrderedCollection new.
	players add: player1;
	add:player2;
	add:player3.
	dice1 := PowerfullDice newwithNFaces: 5.
	dice2 := PowerfullDice newwithNFaces: 10.
	dice3 := PowerfullDice  newwithNFaces: 5.
	dices := Set new.   
	dices add: dice1;
	add: dice2;
	add: dice3.   
	
	board:= Board newWithNSquares: 100.
	playingSequence := PlayingSequence newWithAllPlayers: players.
	judge:= Judge named: 'Pitana' assuring: playingSequence on: board. 
	
	[ judge thereIsAWinner ] whileFalse: [
	judge playerTriesToPlay: player1 name.
	player1 playsWith: dices.
	judge playerTriesToPlay: player2 name.
	player2 playsWith: dices.
	judge playerHasWon: player2.  
	judge playerTriesToPlay: player3 name.
	player3 playsWith: dices.
	].	

	self assert: player1 position equals: 101.
	self assert: player2 position equals: 101.
	self assert: player3 position equals: 101.
	self assert: judge thereIsAWinner. 
	winner:= 	judge tellWinner. 
	self assert: winner equals: 'Dubi'. 
]

{ #category : #tests }
TestingGame >> testCreateAJudge [
	| judge |
	judge := Judge named: 'Pitana' assuring: PlayingSequence new on: Board new.
	self assert: judge name equals: 'Pitana'.
]

{ #category : #tests }
TestingGame >> testCreateAPlayer [
	

	| player|
	
	player:= Player newWithName: 'Sol'.
	self assert: player name equals: 'Sol'.
]

{ #category : #tests }
TestingGame >> testCreateAPlayingSequence [

	| player1 player2 player3 collectionOfPlayers aPlayingSequence|
	
	player1 := Player newWithName: 'Sol'.
	player2 := Player newWithName: 'Dubi'.
	player3 := Player newWithName: 'Nico'.
	collectionOfPlayers := OrderedCollection new.
	collectionOfPlayers add: player1;
	add:player2;
	add:player3.
	aPlayingSequence := PlayingSequence newWithAllPlayers: collectionOfPlayers.
	self assert: aPlayingSequence  currentPlayer name equals: 'Sol'.
	
]

{ #category : #tests }
TestingGame >> testCreateASetOfDices [
	

	| dice1 dice2 dice3  setOfDices |
	
	dice1 := NormalDice newwithNFaces: 5.
	dice2 := NormalDice newwithNFaces: 10.
	dice3 := PowerfullDice newwithNFaces: 5.
	setOfDices:= Set new. 
	setOfDices add: dice1;
		add: dice2;
		add: dice3.   
	
	self assert: setOfDices size equals: 3.
]

{ #category : #tests }
TestingGame >> testCreateBoardWWith20Squares [
	

	| board|
	
	board:= Board newWithNSquares:20.
	
	self assert: board squares equals: 20.
]

{ #category : #tests }
TestingGame >> testCreateBoardWWith20SquaresAndAGoal [
	

	| board|
	
	board:= Board newWithNSquares:20.
	
	self assert: board goal equals: 20.
]

{ #category : #tests }
TestingGame >> testCreateDiceWith6Faces [
	

	| dice |
	dice:= Dice newwithNFaces: 6.
	self assert: dice faces equals: 6
]

{ #category : #tests }
TestingGame >> testCreateNormalDiceWith6Faces [
	

	| dice |
	dice:= NormalDice newwithNFaces: 6.
	self assert: dice faces equals: 6
]

{ #category : #tests }
TestingGame >> testCreatePowerfullDiceWith6Faces [
	

	| dice |
	dice:= PowerfullDice newwithNFaces: 6.
	self assert: dice faces equals: 6
]

{ #category : #tests }
TestingGame >> testCreateWrongBoardWith5Squares [
	

	| board|
	
	self should:[board:= Board newWithNSquares: 5] raise: InstanceCreationFailed
]

{ #category : #tests }
TestingGame >> testCreateWrongDiceWithMinus3Faces [
   |dice|
	self should:[dice:=Dice newwithNFaces: -3] raise: InstanceCreationFailed
]

{ #category : #tests }
TestingGame >> testCreateWrongDiceWithZeroFaces [
   |dice|
	self should:[dice:=Dice newwithNFaces: 0] raise: InstanceCreationFailed
]

{ #category : #tests }
TestingGame >> testJudgeValidateTurn [
	| judge turn player1 player2 collectionOfPlayers board|
	
	player1 := Player newWithName: 'Sol'.
	player2 := Player newWithName: 'Dubi'.
	collectionOfPlayers := OrderedCollection new. 
	collectionOfPlayers add: player1;
	add: player2.
	turn := PlayingSequence newWithAllPlayers: collectionOfPlayers.
	board:= Board new. 
	judge := Judge named: 'Pitana' assuring: turn on: board. 
	self should: [ judge validateTurn: turn currentPlayer and: player2 name ] raise: JudgeValidationFailed
]

{ #category : #tests }
TestingGame >> testRollNormalDice [
	

	| dice |
	dice:= NormalDice newwithNFaces: 6.
	self assert: (dice roll between: 1 and: dice faces).
]

{ #category : #tests }
TestingGame >> testRollPowerfullDice [
	

	| dice |
	dice:= PowerfullDice newwithNFaces: 100.
	self assert: dice roll equals: 100.
]
