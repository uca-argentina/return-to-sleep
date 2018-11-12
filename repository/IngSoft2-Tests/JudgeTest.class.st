Class {
	#name : #JudgeTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'judge-tests' }
JudgeTest >> testCreateAJudge [
	| judge player1 player2 players |
	player1 := Player
		withName: 'Sol'
		aGamePiece: (Gamepiece withColor: 'black')
		aCard: aFirstCard
		andOtherCard: aSecondCard.
	player2 := Player
		withName: 'Dubi'
		aGamePiece: (Gamepiece withColor: 'yellow')
		aCard: aFirstCard
		andOtherCard: aSecondCard.
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	judge := Judge named: 'Pitana' assuring: players on: Board new.
	self assert: judge name equals: 'Pitana'
]

{ #category : #'judge-tests' }
JudgeTest >> testJudgeValidateTurn [
	| judge turn player1 player2 collectionOfPlayers board gamepiece1 gamepiece2 gamepieces squares |
	gamepiece1 := Gamepiece withColor: 'red'.
	gamepiece2 := Gamepiece withColor: 'blue'.
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
	squares add: (Square withAnEffect: NonEffect new).
	board := Board
		withSquares: squares
		gamepieces: gamepieces
		andRounds: 2.
	judge := Judge
		named: 'Pitana'
		assuring: collectionOfPlayers
		on: board.
	self
		should: [ judge validateTurnOf: player2 ]
		raise: JudgeValidationFailed
]

{ #category : #'judge-tests' }
JudgeTest >> testJudgeValidateWhenPlayerCompletesARound [
	| board squares square1 square2 square3 square4 gamepiece1 gamepieces player dices effect1 effect2 effect3 effect4 effect0 square0 judge |
	effect0 := NonEffect new.
	effect1 := AtomicBomb new.
	effect2 := SpeedUp withAPowerValue: 1.
	effect3 := WormHole withAPowerValue: 2.
	effect4 := MoonWalk withAPowerValue: 1.
	square0 := Square withAnEffect: effect0.
	square1 := Square withAnEffect: effect1.
	square2 := Square withAnEffect: effect2.
	square3 := Square withAnEffect: effect3.
	square4 := Square withAnEffect: effect4.
	gamepiece1 := Gamepiece withColor: 'blue'.
	player := Player
		withName: 'Sol'
		aGamePiece: gamepiece1
		aCard: aFirstCard
		andOtherCard: aSecondCard.
	squares := Dictionary
		newFrom:
			{(0 -> square0).
			(1 -> square1).
			(2 -> square2).
			(3 -> square3).
			(4 -> square4)}.
	gamepieces := Dictionary newFrom: {(gamepiece1 color -> gamepiece1)}.
	board := Board
		withSquares: squares
		gamepieces: gamepieces
		andRounds: 5.
	dices := Set new.
	dices add: (LoadedDice withFaces: 3).
	judge := Judge named: 'Pitana' assuring: player on: board.
	player playsATurnWith: dices.
	self assert: gamepiece1 position equals: 3.
	gamepiece1 positionOnBoardBasedOnNSquares: board squares size.
	board applyEffectToAGamepieceUsingKey: gamepiece1 color.
	self assert: gamepiece1 position equals: 1.
	player playsATurnWith: dices.
	gamepiece1 positionOnBoardBasedOnNSquares: board squares size.
	board applyEffectToAGamepieceUsingKey: gamepiece1 color.
	self assert: gamepiece1 position equals: 4.
	player playsATurnWith: dices.
	gamepiece1 positionOnBoardBasedOnNSquares: board squares size.
	self assert: gamepiece1 position equals: 7.
	judge validateRoundsOfPlayers.
	self assert: gamepiece1 rounds equals: 1
]

{ #category : #'judge-tests' }
JudgeTest >> testJudgeValidateWhenPlayerHasToUndoARoundBecauseOfWormHoleEffect [
	| board squares square1 square2 gamepiece1 gamepieces player dices effect1 effect2 effect0 square0 judge players |
	effect0 := NonEffect new.
	effect1 := WormHole withAPowerValue: 3.
	effect2 := NonEffect new.
	square0 := Square withAnEffect: effect0.
	square1 := Square withAnEffect: effect1.
	square2 := Square withAnEffect: effect2.
	gamepiece1 := Gamepiece withColor: 'blue'.
	player := Player
		withName: 'Sol'
		aGamePiece: gamepiece1
		aCard: aFirstCard
		andOtherCard: aSecondCard.
	players := OrderedCollection new.
	players add: player.
	squares := Dictionary
		newFrom:
			{(0 -> square0).
			(1 -> square1).
			(2 -> square2)}.
	gamepieces := Dictionary newFrom: {(gamepiece1 color -> gamepiece1)}.
	board := Board
		withSquares: squares
		gamepieces: gamepieces
		andRounds: 5.
	dices := Set new.
	dices add: (LoadedDice withFaces: 1).
	judge := Judge named: 'Pitana' assuring: players on: board.
	player playsATurnWith: dices.
	gamepiece1 positionOnBoardBasedOnNSquares: board squares size.
	self assert: gamepiece1 position equals: 1.
	board applyEffectToAGamepieceUsingKey: gamepiece1 color.
	self assert: gamepiece1 position equals: -2.
	judge validateRoundsOfPlayers.
	self assert: gamepiece1 rounds equals: -1
]

{ #category : #'judge-tests' }
JudgeTest >> testJugdeDeterminateWinner [
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
	player1 := Player
		withName: 'Sol'
		aGamePiece: gamepiece1
		aCard: (OverloadCard withTypeValueAndID: 1)
		andOtherCard: (OverloadCard withTypeValueAndID: 2).
	player2 := Player
		withName: 'Dubi'
		aGamePiece: gamepiece2
		aCard: (OverloadCard withTypeValueAndID: 3)
		andOtherCard: (OverloadCard withTypeValueAndID: 4).
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
	[ judge thereIsAWinner ]
		whileFalse: [ judge validateTurnOf: player1.
			player1 playsATurnWith: dices1.
			judge validateRoundsOfPlayers.
			board updateGamepiecesPositionOnBoard.
			board applyEffectToAGamepieceUsingKey: gamepiece1 color.
			judge validateTurnOf: player2.
			player2 playsATurnWith: dices2.
			judge validateRoundsOfPlayers.
			board updateGamepiecesPositionOnBoard.
			board applyEffectToAGamepieceUsingKey: gamepiece2 color.
			judge validateRoundsOfPlayers.
			winner := judge playerHasWon ].
	self assert: judge thereIsAWinner equals: true.
	self assert: winner name equals: 'Dubi'
]

{ #category : #'judge-tests' }
JudgeTest >> testJugdeDeterminateWinnerWhenThereIsAnAtomicBombSquare [
	| player1 player2 dices1 judge board players winner gamepiece1 gamepiece2 gamepieces squares effect0 effect1 effect2 effect3 effect4 square0 square1 square2 square3 square4 dices2 |
	gamepiece1 := Gamepiece withColor: 'pink'.
	gamepiece2 := Gamepiece withColor: 'blue'.
	gamepieces := Dictionary
		newFrom:
			{(gamepiece1 color -> gamepiece1).
			(gamepiece2 color -> gamepiece2)}.
	effect0 := NonEffect new.
	effect1 := NonEffect new.
	effect2 := NonEffect new.
	effect3 := NonEffect new.
	effect4 := AtomicBomb new.
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
	player1 := Player
		withName: 'Sol'
		aGamePiece: gamepiece1
		aCard: (OverloadCard withTypeValueAndID: 1)
		andOtherCard: (OverloadCard withTypeValueAndID: 2).
	player2 := Player
		withName: 'Dubi'
		aGamePiece: gamepiece2
		aCard: (OverloadCard withTypeValueAndID: 3)
		andOtherCard: (OverloadCard withTypeValueAndID: 4).
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	dices1 := Set new.
	dices1 add: (LoadedDice withFaces: 2).
	dices2 := Set new.
	dices2 add: (LoadedDice withFaces: 6).
	board := Board withSquares: squares gamepieces: gamepieces andRounds: 2.
	judge := Judge named: 'Pitana' assuring: players on: board.
	[ judge thereIsAWinner ]
		whileFalse: [ judge validateTurnOf: player1.
			player1 playsATurnWith: dices1.
			judge validateRoundsOfPlayers.
			board updateGamepiecesPositionOnBoard.
			board applyEffectToAGamepieceUsingKey: gamepiece1 color.
			judge validateTurnOf: player2.
			player2 playsATurnWith: dices2.
			judge validateRoundsOfPlayers.
			board updateGamepiecesPositionOnBoard.
			board applyEffectToAGamepieceUsingKey: gamepiece2 color.
			judge validateRoundsOfPlayers.
			winner := judge playerHasWon ].
	self assert: judge thereIsAWinner equals: true.
	self assert: player1 gamepiece position equals: 0.
	self assert: player2 gamepiece position equals: 11.
	self assert: winner name equals: 'Dubi'
]

{ #category : #'judge-tests' }
JudgeTest >> testJugdeTellsRankingOfAPlayer [
	| player1 player2 dices1 judge board players gamepiece1 gamepiece2 gamepieces squares effect0 effect1 effect2 effect3 effect4 square0 square1 square2 square3 square4 effect5 square5 dices2 |
	gamepiece1 := Gamepiece withColor: 'pink'.
	gamepiece2 := Gamepiece withColor: 'blue'.
	gamepieces := Dictionary
		newFrom:
			{(gamepiece1 color -> gamepiece1).
			(gamepiece2 color -> gamepiece2)}.
	effect0 := NonEffect new.
	effect1 := SpeedUp withAPowerValue: 1.
	effect2 := MoonWalk withAPowerValue: 2.
	effect3 := WormHole withAPowerValue: 2.
	effect4 := AtomicBomb new.
	effect5 := NonEffect new.
	square0 := Square withAnEffect: effect0.
	square1 := Square withAnEffect: effect1.
	square2 := Square withAnEffect: effect2.
	square3 := Square withAnEffect: effect3.
	square4 := Square withAnEffect: effect4.
	square5 := Square withAnEffect: effect5.
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
		aCard: aFirstCard
		andOtherCard: aSecondCard.
	player2 := Player
		withName: 'Dubi'
		aGamePiece: gamepiece2
		aCard: aFirstCard
		andOtherCard: aSecondCard.
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	dices1 := Set new.
	dices1 add: (LoadedDice withFaces: 4).
	dices2 := Set new.
	dices2 add: (LoadedDice withFaces: 3).
	board := Board
		withSquares: squares
		gamepieces: gamepieces
		andRounds: 2.
	judge := Judge named: 'Pitana' assuring: players on: board.
	judge validateTurnOf: player1.
	player1 playsATurnWith: dices1.
	judge validateRoundsOfPlayers.
	judge playerHasWon.
	judge validateTurnOf: player2.
	player2 playsATurnWith: dices2.
	judge validateRoundsOfPlayers.
	judge playerHasWon.
	judge validateTurnOf: player1.
	player1 playsATurnWith: dices1.
	judge validateRoundsOfPlayers.
	judge playerHasWon.
	judge validateTurnOf: player2.
	player2 playsATurnWith: dices2.
	judge validateRoundsOfPlayers.
	judge playerHasWon.
	self assert: (judge ranking: player2 gamepiece) equals: 2.
	self assert: (judge ranking: player1 gamepiece) equals: 1
]

{ #category : #'judge-tests' }
JudgeTest >> testTellLastCardPlayedToJudge [
	| judge player1 player2 players |
	player1 := Player
		withName: 'Sol'
		aGamePiece: (Gamepiece withColor: 'pink')
		aCard: (OverloadCard withTypeValueAndID: 1)
		andOtherCard: (OverloadCard withTypeValueAndID: 2).
	player2 := Player
		withName: 'Dubi'
		aGamePiece: (Gamepiece withColor: 'yellow')
		aCard: (OverloadCard withTypeValueAndID: 3)
		andOtherCard: (OverloadCard withTypeValueAndID: 4).
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	judge := Judge named: 'Pitana' assuring: players on: Board new.
	player1 playCardByID: 1 applyTo: player2 andTellJudge: judge.
	self assert: judge lastCardPlayed id equals: 1
]
