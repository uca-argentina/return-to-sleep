Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'board-tests' }
BoardTest >> testBoardApplyEffectToAGamePieceWhenPlayerPlays [
	| board squares square1 square2 square3 square4 square5 gamepiece1 gamepieces player dices effect1 effect2 effect3 effect4 effect5 |
	effect1 := NonEffect new.
	effect2 := AtomicBomb withAPowerValue: 0.
	effect3 := SpeedUp withAPowerValue: 1.
	effect4 := WormHole withAPowerValue: 2.
	effect5 := MoonWalk withAPowerValue: 1.
	square1 := Square withAnEffect: effect1.
	square2 := Square withAnEffect: effect2.
	square3 := Square withAnEffect: effect3.
	square4 := Square withAnEffect: effect4.
	square5 := Square withAnEffect: effect5.
	gamepiece1 := GamePiece withColor: 'blue'.
	player := Player withName: 'Sol' andAGamePiece: gamepiece1.
	squares := Dictionary
		newFrom:
			{(1 -> square1).
			(2 -> square2).
			(3 -> square3).
			(4 -> square4).
			(5 -> square5)}.
	gamepieces := Dictionary newFrom: {(gamepiece1 color -> gamepiece1)}.
	board := GameBoard withSquares: squares andGamePieces: gamepieces.
	dices := Set new.
	dices add: (PowerfulDice withFaces: 3).
	player playsWith: dices.
	self assert: gamepiece1 position equals: 3.
	board applyEffectTo: gamepiece1 color.
	self assert: gamepiece1 position equals: 4
]

{ #category : #'board-tests' }
BoardTest >> testCreateBoardWWith3SquaresAnd3GamePieces [
	| board squares square1 square2 square3 gamepiece1 gamepiece2 gamepiece3 gamepieces effect1 effect2 effect3 |
	effect1 := NonEffect new.
	effect2 := NonEffect new.
	effect3 := SpeedUp withAPowerValue: 1.
	square1 := Square withAnEffect: effect1.
	square2 := Square withAnEffect: effect2.
	square3 := Square withAnEffect: effect3.
	
	gamepiece1 := GamePiece withColor: 'blue'.
	gamepiece2 := GamePiece withColor: 'red'.
	gamepiece3 := GamePiece withColor: 'orange'.
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
	board := GameBoard withSquares: squares andGamePieces: gamepieces.
	self assert: board squares size equals: 3.
	self assert: board gamepieces size equals: 3
]

{ #category : #'board-tests' }
BoardTest >> testCreateWrongBoardWith0GamePieces [
	| squares |
	squares := Set new.
	squares add: (Square withAnEffect: NonEffect new).
	self
		should: [ GameBoard withSquares: squares andGamePieces: #() ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText
				equals: 'You cannot create a board with less than 1 game piece.' ]
]

{ #category : #'board-tests' }
BoardTest >> testCreateWrongBoardWith0Squares [
	self
		should: [ GameBoard withSquares: #() andGamePieces: #() ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText
				equals: 'You cannot create a board with less than 1 squares.' ]
]
