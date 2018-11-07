Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'game-tests' }
GameTest >> testCreateAGameAndPlayWithDifferentEffects [
	| player1 player2 dices1 judge board players winner gamepiece1 gamepiece2 gamepieces squares effect0 effect1 effect2 effect3 effect4 square0 square1 square2 square3 square4 dices2 |
	gamepiece1 := Gamepiece withColor: 'pink'.
	gamepiece2 := Gamepiece withColor: 'blue'.
	gamepieces := Dictionary
		newFrom:
			{(gamepiece1 color -> gamepiece1).
			(gamepiece2 color -> gamepiece2)}.
	effect0 := NonEffect new.
	effect1 := MoonWalk withAPowerValue: 2.
	effect2 := NonEffect new.
	effect3 := NonEffect new.
	effect4 := SpeedUp withAPowerValue: 2.
	square0 := Square withAnEffect: effect0.
	square1 := Square withAnEffect: effect1.
	square2 := Square withAnEffect: effect2.
	square3 := Square withAnEffect: effect3.
	square4 := Square withAnEffect: effect4.
	squares := Dictionary
		newFrom:
			{(0 -> square0).
			(1 -> square1).
			(2 -> square2).
			(3 -> square3).
			(4 -> square4)}.
	player1 := Player withName: 'Sol' andAGamePiece: gamepiece1.
	player2 := Player withName: 'Dubi' andAGamePiece: gamepiece2.
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	dices1 := Set new.
	dices1 add: (LoadedDice withFaces: 1).
	dices2 := Set new.
	dices2 add: (LoadedDice withFaces: 2).
	board := Board
		withSquares: squares
		gamepieces: gamepieces
		andRounds: 2.
	judge := Judge named: 'Pitana' assuring: players on: board.
	[ judge thereIsAWinner ]
		whileFalse: [ judge validateTurnOf: player1.
			player1 playsATurnWith: dices1.
			judge validateRoundsOfPlayers.
			gamepiece1 positionOnBoardBasedOnNSquares: board squares size.
			board applyEffectToAGamepieceUsingKey: gamepiece1 color.
			judge playerHasWon.
			judge validateTurnOf: player2.
			player2 playsATurnWith: dices2.
			judge validateRoundsOfPlayers.
			gamepiece2 positionOnBoardBasedOnNSquares: board squares size.
			board applyEffectToAGamepieceUsingKey: gamepiece2 color.
			judge playerHasWon ].
	self assert: judge thereIsAWinner.
	winner := judge winner.
	self assert: gamepiece1 position equals: 7.
	self assert: gamepiece2 position equals: 10.
	self assert: winner name equals: 'Dubi'
]
