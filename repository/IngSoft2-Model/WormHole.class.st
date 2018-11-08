"
When a Game Piece of a Player falls into a Square that has the WormHole Effect there is a curse that makes the game Piece/player to go backwards (e.g. curse=4) that number of squares.
"
Class {
	#name : #WormHole,
	#superclass : #Effect,
	#instVars : [
		'decrement'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
WormHole class >> withAPowerValue: aPowerValue [
	^ self new initializeWithADecrement: aPowerValue
]

{ #category : #Accesing }
WormHole >> applyEffectTo: aGamePiece ofGamepieceCollection: aCollection [
	aGamePiece changePositionTo: aGamePiece position - decrement.
]

{ #category : #Initializing }
WormHole >> initializeWithADecrement: aPowerValue [
	decrement := aPowerValue
]
