Class {
	#name : #PlayingSequenceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'playing-sequence-tests' }
PlayingSequenceTest >> testChangeTurn [
	| player1 player2 player3 collectionOfPlayers aPlayingSequence gamepiece1 gamepiece2 gamepiece3 |
		gamepiece1 := Gamepiece withColor: 'red'.
	gamepiece2 := Gamepiece withColor: 'blue'.
	gamepiece3 := Gamepiece withColor: 'purple'.
	player1 := Player withName: 'Sol' andAGamePiece: gamepiece1.
	player2 := Player withName: 'Dubi' andAGamePiece: gamepiece2.
	player3 := Player withName: 'Tuvi' andAGamePiece: gamepiece3.	
	collectionOfPlayers := OrderedCollection new.
	collectionOfPlayers
		add: player1;
		add: player2;
		add: player3.
	aPlayingSequence := PlayingSequence withAllPlayers: collectionOfPlayers.
	self assert: aPlayingSequence currentPlayer name equals: 'Sol'.
	aPlayingSequence changeToNextPlayer.
	self assert: aPlayingSequence currentPlayer name equals: 'Dubi'
]

{ #category : #'playing-sequence-tests' }
PlayingSequenceTest >> testCreateAPlayingSequence [
	| player1 player2 player3 collectionOfPlayers aPlayingSequence gamepiece1 gamepiece2 gamepiece3 |
	gamepiece1 := Gamepiece withColor: 'red'.
	gamepiece2 := Gamepiece withColor: 'blue'.
	gamepiece3 := Gamepiece withColor: 'purple'.
	player1 := Player withName: 'Sol' andAGamePiece: gamepiece1.
	player2 := Player withName: 'Dubi' andAGamePiece: gamepiece2.
	player3 := Player withName: 'Tuvi' andAGamePiece: gamepiece3.
	collectionOfPlayers := OrderedCollection new.
	collectionOfPlayers
		add: player1;
		add: player2;
		add: player3.
	aPlayingSequence := PlayingSequence withAllPlayers: collectionOfPlayers.
	self assert: aPlayingSequence currentPlayer name equals: 'Sol'
]
