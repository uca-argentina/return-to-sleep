Class {
	#name : #GameBoard,
	#superclass : #Object,
	#instVars : [
		'squares',
		'gamepieces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
GameBoard class >> assertValidNumberOfGamePieces: aNumberOfGamePieces [
	aNumberOfGamePieces< 1
		ifTrue: [ InstanceCreationFailed signal: 'You cannot create a board with less than 1 game piece.' ]
]

{ #category : #Creating }
GameBoard class >> assertValidNumberOfSquares: aNumberOfSquares [
	aNumberOfSquares < 1
		ifTrue: [ InstanceCreationFailed signal: 'You cannot create a board with less than 1 squares.' ]
]

{ #category : #Creating }
GameBoard class >> withSquares: aSquareCollection andGamePieces: aGamePieceCollection [
	self assertValidNumberOfSquares: aSquareCollection size.
	self assertValidNumberOfGamePieces: aGamePieceCollection size.
	^ self new initializeWithSquares: aSquareCollection andGamePieces: aGamePieceCollection
]

{ #category : #Accesing }
GameBoard >> applyEffectTo: aGamePieceKey [
	| gamepiece positionOfPlayer square |
	gamepiece := gamepieces at: aGamePieceKey.
	positionOfPlayer := gamepiece position.
	square := squares at: positionOfPlayer.
	(square effect) applyEffectTo: gamepiece ofGamePieceCollection: gamepieces. 
	
]

{ #category : #Accesing }
GameBoard >> gamepieces [
	^ gamepieces
]

{ #category : #Creating }
GameBoard >> initializeWithSquares: aSquaresCollection andGamePieces: aGamePiecesCollection [
	squares := aSquaresCollection.
	gamepieces := aGamePiecesCollection
]

{ #category : #Accesing }
GameBoard >> squares [
	^ squares
]
