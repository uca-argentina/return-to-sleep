Class {
	#name : #PlayingSequenceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'playing-sequence-tests' }
PlayingSequenceTest >> testChangeTurn [
	

	| player1 player2 player3 collectionOfPlayers aPlayingSequence|
	
	player1 := Player withName: 'Sol'.
	player2 := Player withName: 'Dubi'.
	player3 := Player withName: 'Nico'.
	collectionOfPlayers  := OrderedCollection new. 
	collectionOfPlayers add: player1;
	add:player2;
	add:player3. 
	aPlayingSequence:= PlayingSequence withAllPlayers: collectionOfPlayers.
	self assert: aPlayingSequence currentPlayer name equals: 'Sol'.
	aPlayingSequence changeToNextPlayer.
	self assert: aPlayingSequence currentPlayer name equals: 'Dubi'.
	
	
	
]

{ #category : #'playing-sequence-tests' }
PlayingSequenceTest >> testCreateAPlayingSequence [

	| player1 player2 player3 collectionOfPlayers aPlayingSequence|
	
	player1 := Player withName: 'Sol'.
	player2 := Player withName: 'Dubi'.
	player3 := Player withName: 'Nico'.
	collectionOfPlayers := OrderedCollection new.
	collectionOfPlayers add: player1;
	add:player2;
	add:player3.
	aPlayingSequence := PlayingSequence withAllPlayers: collectionOfPlayers.
	self assert: aPlayingSequence  currentPlayer name equals: 'Sol'.
	
]
