"
When a Game Piece of a Player falls into a Square that has the SpeedUp Effect there is a benefit that makes the game Piece/player to go forward (e.g. benefit=4) that number of squares.

"
Class {
	#name : #SpeedUp,
	#superclass : #SquareEffect,
	#instVars : [
		'increment'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
SpeedUp class >> withAPowerValue: aPowerValue [
	^ self new initializeWithAnIncrement: aPowerValue
]

{ #category : #Accesing }
SpeedUp >> applyEffectTo: aGamePiece ofGamepieceCollection: aGamePieceCollection [
	aGamePiece changePositionTo: aGamePiece position + increment.
]

{ #category : #Initializing }
SpeedUp >> initializeWithAnIncrement: aPowerValue [
	increment := aPowerValue
]
