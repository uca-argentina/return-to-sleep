Class {
	#name : #GamepieceTest,
	#superclass : #TestCase,
	#instVars : [
		'aGamePiece',
		'gamepiece1',
		'gamepiece2',
		'gamepieces',
		'effect0',
		'effect1',
		'effect2',
		'effect3',
		'effect4',
		'square0',
		'square1',
		'square2',
		'square3',
		'square4',
		'squares',
		'player1',
		'player2',
		'players',
		'dices1',
		'dices2',
		'board',
		'judge'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'Gamepiece - tests' }
GamepieceTest >> setUp [
	gamepiece1 := Gamepiece withInitialPosition.
	gamepiece2 := Gamepiece withInitialPosition.
	gamepieces := Set new.
	gamepieces
		add: gamepiece1;
		add: gamepiece2.
	effect0 := NonEffect new.
	effect1 := MoonWalk withAPowerValue: 2.
	effect2 := NonEffect new.
	effect3 := NonEffect new.
	effect4 := SpeedUp withAPowerValue: 2.
	square0 := Square withAnEffect: effect0 thatGivesCard: false.
	square1 := Square withAnEffect: effect1 thatGivesCard: false.
	square2 := Square withAnEffect: effect2 thatGivesCard: false.
	square3 := Square withAnEffect: effect3 thatGivesCard: false.
	square4 := Square withAnEffect: effect4 thatGivesCard: false.
	squares := Dictionary
		newFrom:
			{(0 -> square0).
			(1 -> square1).
			(2 -> square2).
			(3 -> square3).
			(4 -> square4)}.
	player1 := Player
		withName: 'Sol'
		aGamePiece: gamepiece1
		aCard: Overload withValue
		andOtherCard: Overload withValue.
	player2 := Player
		withName: 'Dubi'
		aGamePiece: gamepiece2
		aCard: Overload withValue
		andOtherCard: Overload withValue.
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	dices1 := Set new.
	dices1 add: (LoadedDice withFaces: 1).
	dices2 := Set new.
	dices2 add: (LoadedDice withFaces: 2).
	board := Board withSquares: squares gamepieces: gamepieces andRounds: 2.
	judge := Judge named: 'Pitana' assuring: players on: board.
]

{ #category : #'Gamepiece - tests' }
GamepieceTest >> testGamepiecesFinalRankingWhenThereIsAWinner [
	| winner |
	
	[ judge playerHasWon ]
		whileFalse: [ judge validateTurnOf: player1.
			player1 playsATurnWith: dices1.
			judge validateRoundsOfPlayers.
			gamepiece1 positionOnBoardBasedOnNSquares: board squares size.
			board applyEffectToAGamepiece: gamepiece1.
			judge changeTurnOfPlayers.
			judge validateTurnOf: player2.
			player2 playsATurnWith: dices2.
			judge validateRoundsOfPlayers.
			gamepiece2 positionOnBoardBasedOnNSquares: board squares size.
			board applyEffectToAGamepiece: gamepiece2.
			judge validateRoundsOfPlayers.
			winner := judge winner.
			judge changeTurnOfPlayers ].
	self assert: judge playerHasWon.
	judge determinateFinalRankings.
	self assert: gamepiece1 position equals: 7.
	self assert: gamepiece2 position equals: 10.
	self assert: winner name equals: 'Dubi'.
	self assert: gamepiece1 finalRanking equals: 2.
	self assert: gamepiece2 finalRanking equals: 1
]
