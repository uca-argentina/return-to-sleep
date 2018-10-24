Class {
	#name : #GamepieceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'Gamepiece - tests' }
GamepieceTest >> testCreateABlueGamePiece [
		| aGamePiece |
	aGamePiece := Gamepiece withColor: 'blue'.
	self assert: aGamePiece color equals: 'blue'.
]
