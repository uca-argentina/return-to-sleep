Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#instVars : [
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
		'gamepiece1',
		'player',
		'squares',
		'gamepieces',
		'board',
		'dices',
		'gamepiece2'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'board-tests' }
BoardTest >> setUp [
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
	gamepiece1 := Gamepiece withInitialPosition.
	gamepiece2 := Gamepiece withInitialPosition.
	player := Player
		withName: 'Sol'
		aGamePiece: gamepiece1
		aCard: Overload withValue
		andOtherCard: Overload withValue.
	squares := Dictionary
		newFrom:
			{(0 -> square0).
			(1 -> square1).
			(2 -> square2).
			(3 -> square3).
			(4 -> square4)}.
	gamepieces := Set new.
	gamepieces add: gamepiece1;
 add: gamepiece2.
	board := Board withSquares: squares gamepieces: gamepieces andRounds: 5.
	dices := Set new.
	dices add: (LoadedDice withFaces: 3)
]

{ #category : #'board-tests' }
BoardTest >> testBoardApplyEffectToAGamePieceWhenPlayerPlays [
	player playsATurnWith: dices.
	gamepiece1 positionOnBoardBasedOnNSquares: board squares size.
	self assert: gamepiece1 position equals: 3.
	board applyEffectToAGamepiece: gamepiece1.
	self assert: gamepiece1 position equals: 1
]

{ #category : #'board-tests' }
BoardTest >> testCreateBoardWWith5Squares2GamePiecesAnd5Rounds [
	board := Board withSquares: squares gamepieces: gamepieces andRounds: 5.
	self assert: board squares size equals:5.
	self assert: board gamepieces size equals: 2.
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
	gamepieces add: Gamepiece withInitialPosition.
	self
		should: [ Board withSquares: squares gamepieces: gamepieces andRounds: 0 ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'You cannot create a board with less than 1 round.' ]
]

{ #category : #'board-tests' }
BoardTest >> testCreateWrongBoardWith0Squares [
	| gamepieces |
	gamepieces := Set new.
	gamepieces add: Gamepiece withInitialPosition.
	self
		should: [ Board withSquares: #() gamepieces: gamepieces andRounds: 5 ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'You cannot create a board with less than 1 squares.' ]
]
