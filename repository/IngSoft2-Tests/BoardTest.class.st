Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'board-tests' }
BoardTest >> testBoardApplyEffectToAGamePieceWhenPlayerPlays [
	| board squares square1 square2 square3 square4 gamepiece1 gamepieces player dices effect1 effect2 effect3 effect4 effect0 square0 |
	effect0 := NonEffect new.
	effect1 := AtomicBomb new.
	effect2 := SpeedUp withAPowerValue: 1.
	effect3 := WormHole withAPowerValue: 2.
	effect4 := MoonWalk withAPowerValue: 1.
	square0 := Square withAnEffect: effect0 thatGivesCard: false.
	square1 := Square withAnEffect: effect1 thatGivesCard: false.
	square2 := Square withAnEffect: effect2 thatGivesCard: false.
	square3 := Square withAnEffect: effect3 thatGivesCard: false.
	square4 := Square withAnEffect: effect4 thatGivesCard: false.
	gamepiece1 := Gamepiece withColor: 'blue'.
	player := Player
		withName: 'Sol'
		aGamePiece: gamepiece1
		aCard: (OverloadCard withValueAndID: 1)
		andOtherCard: (OverloadCard withValueAndID: 2).
	squares := Dictionary
		newFrom:
			{(0 -> square0).
			(1 -> square1).
			(2 -> square2).
			(3 -> square3).
			(4 -> square4)}.
	gamepieces := Dictionary newFrom: {(gamepiece1 color -> gamepiece1)}.
	board := Board withSquares: squares gamepieces: gamepieces andRounds: 5.
	dices := Set new.
	dices add: (LoadedDice withFaces: 3).
	player playsATurnWith: dices.
	gamepiece1 positionOnBoardBasedOnNSquares: board squares size.
	self assert: gamepiece1 position equals: 3.
	board applyEffectToAGamepieceUsingKey: gamepiece1 color.
	self assert: gamepiece1 position equals: 1
]

{ #category : #'board-tests' }
BoardTest >> testCreateBoardWWith3Squares3GamePiecesAnd5Rounds [
	| board squares square1 square2 square3 gamepiece1 gamepiece2 gamepiece3 gamepieces effect1 effect2 effect3 |
	effect1 := NonEffect new.
	effect2 := NonEffect new.
	effect3 := SpeedUp withAPowerValue: 1.
	square1 := Square withAnEffect: effect1 thatGivesCard: false.
	square2 := Square withAnEffect: effect2 thatGivesCard: true.
	square3 := Square withAnEffect: effect3 thatGivesCard: false.
	gamepiece1 := Gamepiece withColor: 'blue'.
	gamepiece2 := Gamepiece withColor: 'red'.
	gamepiece3 := Gamepiece withColor: 'orange'.
	squares := Dictionary
		newFrom:
			{(1 -> square1).
			(2 -> square2).
			(3 -> square3)}.
	gamepieces := Dictionary
		newFrom:
			{(gamepiece1 color -> gamepiece1).
			(gamepiece2 color -> gamepiece2).
			(gamepiece3 color -> gamepiece3)}.
	board := Board withSquares: squares gamepieces: gamepieces andRounds: 5.
	self assert: board squares size equals: 3.
	self assert: board gamepieces size equals: 3.
	self assert: board rounds equals: 5
]

{ #category : #'board-tests' }
BoardTest >> testCreateWrongBoardWith0GamePieces [
	| squares |
	squares := Set new.
	squares add: (Square withAnEffect: NonEffect new thatGivesCard: false).
	self
		should: [ Board withSquares: squares gamepieces: #() andRounds: 5 ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'You cannot create a board with less than 1 game piece.' ]
]

{ #category : #'board-tests' }
BoardTest >> testCreateWrongBoardWith0Rounds [
	| squares gamepieces |
	squares := Set new.
	squares add: (Square withAnEffect: NonEffect new thatGivesCard: false).
	gamepieces := Set new.
	gamepieces add: (Gamepiece withColor: 'pink').
	self
		should: [ Board withSquares: squares gamepieces: gamepieces andRounds: 0 ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'You cannot create a board with less than 1 round.' ]
]

{ #category : #'board-tests' }
BoardTest >> testCreateWrongBoardWith0Squares [
	| gamepieces |
	gamepieces := Set new.
	gamepieces add: (Gamepiece withColor: 'pink').
	self
		should: [ Board withSquares: #() gamepieces: gamepieces andRounds: 5 ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'You cannot create a board with less than 1 squares.' ]
]
