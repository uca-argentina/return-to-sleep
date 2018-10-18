Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'game-tests' }
GameTest >> testCreateAGameAndPlay [
	| player1 player2 player3 dices dice1 dice2 dice3 judge board players winner playingSequence |
	player1 := Player withName: 'Sol'.
	player2 := Player withName: 'Dubi'.
	player3 := Player withName: 'Nico'.
	players := OrderedCollection new.
	players
		add: player1;
		add: player2;
		add: player3.
	dice1 := PowerfulDice withFaces: 5.
	dice2 := PowerfulDice withFaces: 10.
	dice3 := PowerfulDice withFaces: 5.
	dices := Set new.
	dices
		add: dice1;
		add: dice2;
		add: dice3.
	board := DeterministicBoard withNSquares: 100.
	playingSequence := PlayingSequence withAllPlayers: players.
	judge := Judge named: 'Pitana' assuring: playingSequence on: board.
	[ judge thereIsAWinner ]
		whileFalse: [ judge playerTriesToPlay: player1.
			player1 playsWith: dices.
			judge playerTriesToPlay: player2.
			player2 playsWith: dices.
			judge playerHasWon: player2.
			judge playerTriesToPlay: player3.
			player3 playsWith: dices ].
	self assert: player1 position equals: 101.
	self assert: player2 position equals: 101.
	self assert: player3 position equals: 101.
	self assert: judge thereIsAWinner.
	winner := judge winner.
	self assert: winner equals: 'Dubi'.
]
