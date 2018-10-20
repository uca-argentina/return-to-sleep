Class {
	#name : #GameBoard,
	#superclass : #Object,
	#instVars : [
		'squares',
		'gamepieces',
		'rounds',
		'endOfBoard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
GameBoard class >> assertValidNumberOfGamePieces: aNumberOfGamePieces [
	aNumberOfGamePieces< 1
		ifTrue: [ InstanceCreationFailed signal: 'You cannot create a board with less than 1 game piece.' ]
]

{ #category : #Creating }
GameBoard class >> assertValidNumberOfRounds: aNumberOfRounds [
	aNumberOfRounds < 1
		ifTrue: [ InstanceCreationFailed signal: 'You cannot create a board with less than 1 round.' ].
]

{ #category : #Creating }
GameBoard class >> assertValidNumberOfSquares: aNumberOfSquares [
	aNumberOfSquares < 1
		ifTrue: [ InstanceCreationFailed signal: 'You cannot create a board with less than 1 squares.' ]
]

{ #category : #Creating }
GameBoard class >> withSquares: aSquareCollection gamePieces: aGamePieceCollection andRounds: aNumberOfRounds [
	self assertValidNumberOfSquares: aSquareCollection size.
	self assertValidNumberOfGamePieces: aGamePieceCollection size.
	self assertValidNumberOfRounds: aNumberOfRounds.
	^ self new initializeWithSquares: aSquareCollection gamePieces: aGamePieceCollection andRounds: aNumberOfRounds. 
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
GameBoard >> endOfBoard [
	^ endOfBoard.
]

{ #category : #Accesing }
GameBoard >> gamepieces [
	^ gamepieces
]

{ #category : #Creating }
GameBoard >> initializeWithSquares: aSquaresCollection gamePieces: aGamePiecesCollection andRounds: numberOfRounds [
	squares := aSquaresCollection.
	gamepieces := aGamePiecesCollection.
	rounds := numberOfRounds.
	endOfBoard := (squares size - 1).
]

{ #category : #Accesing }
GameBoard >> rounds [
	^ rounds
]

{ #category : #Accesing }
GameBoard >> squares [
	^ squares
]
