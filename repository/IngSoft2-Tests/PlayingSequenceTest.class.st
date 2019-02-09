Class {
	#name : #PlayingSequenceTest,
	#superclass : #TestCase,
	#instVars : [
		'gamepiece1',
		'gamepiece2',
		'gamepiece3',
		'aFirstCard',
		'aSecondCard',
		'player1',
		'player2',
		'player3',
		'collectionOfPlayers',
		'aPlayingSequence'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'playing-sequence-tests' }
PlayingSequenceTest >> setUp [
	gamepiece1 := Gamepiece withInitialPosition.
	gamepiece2 := Gamepiece withInitialPosition.
	gamepiece3 := Gamepiece withInitialPosition.
	player1 := Player
		withName: 'Sol'
		aGamePiece: gamepiece1
		aCard: aFirstCard
		andOtherCard: aSecondCard.
	player2 := Player
		withName: 'Dubi'
		aGamePiece: gamepiece2
		aCard: aFirstCard
		andOtherCard: aSecondCard.
	player3 := Player
		withName: 'Tuvi'
		aGamePiece: gamepiece3
		aCard: aFirstCard
		andOtherCard: aSecondCard.
	collectionOfPlayers := OrderedCollection new.
	collectionOfPlayers
		add: player1;
		add: player2;
		add: player3.
			aPlayingSequence := PlayingSequence
		withAllPlayers: collectionOfPlayers.
]

{ #category : #'playing-sequence-tests' }
PlayingSequenceTest >> testChangeTurn [
	self
		assert: aPlayingSequence currentPlayer name
		equals: 'Sol'.
	aPlayingSequence changeToNextPlayer.
	self
		assert: aPlayingSequence currentPlayer name
		equals: 'Dubi'
]

{ #category : #'playing-sequence-tests' }
PlayingSequenceTest >> testCreateAPlayingSequence [
	self
		assert: aPlayingSequence currentPlayer name
		equals: 'Sol'
]
