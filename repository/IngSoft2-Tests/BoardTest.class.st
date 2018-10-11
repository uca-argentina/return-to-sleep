Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'board-tests' }
BoardTest >> testCreateBoardWWith20SquaresAndAGoal [
	| board |
	board := Board withNSquares: 20.
	self assert: board goal equals: 20. 
]

{ #category : #'board-tests' }
BoardTest >> testCreateWrongBoardWith5Squares [
	self
		should: [ Board withNSquares: 5 ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'You cannot create a board with less than 10 squares.' ]
]
