Class {
	#name : #SquareCreatorTest,
	#superclass : #TestCase,
	#instVars : [
		'totalNumberOfSquares'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SquareCreatorTest >> testCreateACollectionOf5Squares [
	| squareCreator |
	squareCreator := SquareCreator withNSquares: 5.
	squareCreator createSquares.
	self assert: squareCreator squares size equals: 5
]

{ #category : #tests }
SquareCreatorTest >> testCreateSquareCreatorWith100Squares [
	| squareCreator |
	squareCreator := SquareCreator withNSquares: 100.
	self assert: squareCreator totalNumberOfSquares equals: 100
]
