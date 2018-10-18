"
When a Game Piece of a Player falls into a Square that has the AtomicBomb Effect there is a curse that makes all game Pieces/players to go backwards (e.g. curse=0) to that square - position.
"
Class {
	#name : #AtomicBomb,
	#superclass : #Effect,
	#instVars : [
		'cursePosition'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
AtomicBomb class >> withAPowerValue: aPowerValue [
	^ self new initializeWithACursePosition: aPowerValue.
]

{ #category : #Accesing }
AtomicBomb >> applyEffectTo: aGamePiece ofGamePieceCollection: aCollectionOfPieces [
	aCollectionOfPieces do: [ :each | each changePositionTo: cursePosition. ]
]

{ #category : #Accesing }
AtomicBomb >> initializeWithACursePosition: aPowerValue [
	cursePosition := aPowerValue
]
