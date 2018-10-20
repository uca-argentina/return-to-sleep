Class {
	#name : #JudgeTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'judge-tests' }
JudgeTest >> testCreateAJudge [
	| judge |
	judge := Judge named: 'Pitana' assuring: PlayingSequence new on: DeterministicBoard new.
	self assert: judge name equals: 'Pitana'.
]

{ #category : #'judge-tests' }
JudgeTest >> testJudgeValidateTurn [
	| judge turn player1 player2 collectionOfPlayers board gamepiece1 gamepiece2 gamepieces squares |
	gamepiece1 := GamePiece withColor: 'red'.
	gamepiece2 := GamePiece withColor: 'blue'.
	player1 := Player withName: 'Sol' andAGamePiece: gamepiece1.
	player2 := Player withName: 'Dubi' andAGamePiece: gamepiece2.
	gamepieces := Set new.
	gamepieces
		add: gamepiece1;
		add: gamepiece2.
	collectionOfPlayers := OrderedCollection new.
	collectionOfPlayers
		add: player1;
		add: player2.
	turn := PlayingSequence withAllPlayers: collectionOfPlayers.
	squares := Set new.
	squares add: (Square withAnEffect: (NonEffect new)).
	board := GameBoard withSquares: squares gamePieces: gamepieces andRounds: 2.
	judge := Judge named: 'Pitana' assuring: turn on: board.
	self should: [ judge validateTurn: turn currentPlayer and: player2 ] raise: JudgeValidationFailed
]

{ #category : #'judge-tests' }
JudgeTest >> testJudgeValidateWhenPlayerCompletesARound [
	| board squares square1 square2 square3 square4 gamepiece1 gamepieces player dices effect1 effect2 effect3 effect4 effect0 square0 judge playingsequence |
	effect0 := NonEffect new.
	effect1 := AtomicBomb withAPowerValue: 0.
	effect2 := SpeedUp withAPowerValue: 1.
	effect3 := WormHole withAPowerValue: 2.
	effect4 := MoonWalk withAPowerValue: 1.
	square0 := Square withAnEffect: effect0.
	square1 := Square withAnEffect: effect1.
	square2 := Square withAnEffect: effect2.
	square3 := Square withAnEffect: effect3.
	square4 := Square withAnEffect: effect4.
	gamepiece1 := GamePiece withColor: 'blue'.
	player := Player withName: 'Sol' andAGamePiece: gamepiece1.
	squares := Dictionary
		newFrom:
			{(0 -> square0).
			(1 -> square1).
			(2 -> square2).
			(3 -> square3).
			(4 -> square4)}.
	gamepieces := Dictionary newFrom: {(gamepiece1 color -> gamepiece1)}.
	board := GameBoard withSquares: squares gamePieces: gamepieces andRounds: 5.
	dices := Set new.
	dices add: (PowerfulDice withFaces: 3).
	playingsequence := PlayingSequence withAllPlayers: player.
	judge := Judge named: 'Pitana' assuring: playingsequence on: board.
	player playsWith: dices.
	self assert: gamepiece1 position equals: 3.
	board applyEffectTo: gamepiece1 color.
	self assert: gamepiece1 position equals: 1.
	player playsWith: dices.
	board applyEffectTo: gamepiece1 color.
	self assert: gamepiece1 position equals: 4.
	player playsWith: dices.
	self assert: gamepiece1 position equals: 7.
	judge validateRoundsOfPlayers.
	self assert: gamepiece1 rounds equals: 1. 
]

{ #category : #'judge-tests' }
JudgeTest >> testJudgeValidateWhenPlayerHasToUndoARoundBecauseOfWormHoleEffect [
	| board squares square1 square2 gamepiece1 gamepieces player dices effect1 effect2 effect0 square0 judge playingsequence |
	effect0 := NonEffect new.
	effect1 := WormHole withAPowerValue: 3.
	effect2 := NonEffect new.
	square0 := Square withAnEffect: effect0.
	square1 := Square withAnEffect: effect1.
	square2 := Square withAnEffect: effect2.
	gamepiece1 := GamePiece withColor: 'blue'.
	player := Player withName: 'Sol' andAGamePiece: gamepiece1.
	squares := Dictionary
		newFrom:
			{(0 -> square0).
			(1 -> square1).
			(2 -> square2)}.
	gamepieces := Dictionary newFrom: {(gamepiece1 color -> gamepiece1)}.
	board := GameBoard withSquares: squares gamePieces: gamepieces andRounds: 5.
	dices := Set new.
	dices add: (PowerfulDice withFaces: 1).
	playingsequence := PlayingSequence withAllPlayers: player.
	judge := Judge named: 'Pitana' assuring: playingsequence on: board.
	player playsWith: dices.
	self assert: gamepiece1 position equals: 1.
	board applyEffectTo: gamepiece1 color.
	self assert: gamepiece1 position equals: -2.
	judge validateRoundsOfPlayers.
	self assert: gamepiece1 rounds equals: -1. 
]
