"
This is the board of the game. Is initialized with different squares, gamepieces of players and the number of rounds. 
"
Class {
	#name : #Board,
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
Board class >> assertValidNumberOfGamePieces: aNumberOfGamePieces [
	aNumberOfGamePieces< 1
		ifTrue: [ InstanceCreationFailed signal: 'You cannot create a board with less than 1 game piece.' ]
]

{ #category : #Creating }
Board class >> assertValidNumberOfRounds: aNumberOfRounds [
	aNumberOfRounds < 1
		ifTrue: [ InstanceCreationFailed signal: 'You cannot create a board with less than 1 round.' ].
]

{ #category : #Creating }
Board class >> assertValidNumberOfSquares: aNumberOfSquares [
	aNumberOfSquares < 1
		ifTrue: [ InstanceCreationFailed signal: 'You cannot create a board with less than 1 squares.' ]
]

{ #category : #Creating }
Board class >> withSquares: aSquareCollection gamePieces: aGamePieceCollection andRounds: aNumberOfRounds [
	self assertValidNumberOfSquares: aSquareCollection size.
	self assertValidNumberOfGamePieces: aGamePieceCollection size.
	self assertValidNumberOfRounds: aNumberOfRounds.
	^ self new initializeWithSquares: aSquareCollection gamePieces: aGamePieceCollection andRounds: aNumberOfRounds. 
]

{ #category : #Accesing }
Board >> applyEffectToAGamePieceUsingKey: aGamePieceKey [
	| gamepiece 	positionOfPlayerOnBoard square |
	gamepiece := gamepieces at: aGamePieceKey.
	positionOfPlayerOnBoard := gamepiece positionOnBoard.
	square := squares at: 	positionOfPlayerOnBoard.
	square effect applyEffectTo: gamepiece ofGamePieceCollection: gamepieces
]

{ #category : #Accesing }
Board >> endOfBoard [
	^ endOfBoard.
]

{ #category : #Accesing }
Board >> gamepieces [
	^ gamepieces
]

{ #category : #Creating }
Board >> initializeWithSquares: aSquaresCollection gamePieces: aGamePiecesCollection andRounds: numberOfRounds [
	squares := aSquaresCollection.
	gamepieces := aGamePiecesCollection.
	rounds := numberOfRounds.
	endOfBoard := squares size.
]

{ #category : #Accesing }
Board >> rounds [
	^ rounds
]

{ #category : #Accesing }
Board >> squares [
	^ squares
]
