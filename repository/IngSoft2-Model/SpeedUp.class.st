"
When a Game Piece of a Player falls into a Square that has the SpeedUp Effect there is a benefit that makes the game Piece/player to go forward (e.g. benefit=4) that number of squares.

"
Class {
	#name : #SpeedUp,
	#superclass : #Effect,
	#instVars : [
		'increment'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
SpeedUp class >> withAPowerValue: aPowerValue [
	^ self new initializeWithAnIncrement: aPowerValue
]

{ #category : #actions }
SpeedUp >> applyEffectTo: aGamePiece ofGamePieceCollection: aGamePieceCollection [
	aGamePiece changePositionTo: aGamePiece position + increment.
]

{ #category : #actions }
SpeedUp >> initializeWithAnIncrement: aPowerValue [
	increment := aPowerValue
]
