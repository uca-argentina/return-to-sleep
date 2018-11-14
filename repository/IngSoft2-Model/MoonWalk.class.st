"
When a Game Piece of a Player falls into a Square that has the MoonWalk Effect there is a curse that makes all game Pieces/players (except the current one) to go backwards N squares (curse= number N). 
"
Class {
	#name : #MoonWalk,
	#superclass : #SquareEffect,
	#instVars : [
		'decrement'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
MoonWalk class >> withAPowerValue: aPowerValue [
	^ self new initializeWithADecrement: aPowerValue
]

{ #category : #Accesing }
MoonWalk >> applyEffectTo: aGamePiece ofGamepieceCollection: aCollectionOfPieces [
	| affectedPieces |
	affectedPieces := aCollectionOfPieces select: [ :each | each ~= aGamePiece ].
	affectedPieces do: [ :each | each changePositionTo: (each position) - decrement ]
]

{ #category : #Initializing }
MoonWalk >> initializeWithADecrement: aPowerValue [
	decrement := aPowerValue
]
