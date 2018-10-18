Class {
	#name : #GamePieceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GamePieceTest >> testCreateABlueGamePiece [
		| aGamePiece |
	aGamePiece := GamePiece withColor: 'blue'.
	self assert: aGamePiece color equals: 'blue'.
]
