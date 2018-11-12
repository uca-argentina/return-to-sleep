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
		'endOfBoard',
		'lastSquareEffectApplied'
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
Board class >> withSquares: aSquareCollection gamepieces: aGamePieceCollection andRounds: aNumberOfRounds [
	self assertValidNumberOfSquares: aSquareCollection size.
	self assertValidNumberOfGamePieces: aGamePieceCollection size.
	self assertValidNumberOfRounds: aNumberOfRounds.
	^ self new initializeWithSquares: aSquareCollection gamepieces: aGamePieceCollection andRounds: aNumberOfRounds. 
]

{ #category : #Accesing }
Board >> applyEffectToAGamepieceUsingKey: aGamePieceKey [
	| gamepiece positionOfPlayerOnBoard square |
	gamepiece := gamepieces at: aGamePieceKey.
	positionOfPlayerOnBoard := gamepiece positionOnBoard.
	square := squares at: positionOfPlayerOnBoard.
	square effect applyEffectTo: gamepiece ofGamepieceCollection: gamepieces.
	square effect class ~= NonEffect
		ifTrue: [ lastSquareEffectApplied := SquareEffectApplied withEffect: square effect affecting: gamepiece ofGamepieceCollection: gamepieces ]
]

{ #category : #Accesing }
Board >> endOfBoard [
	^ endOfBoard.
]

{ #category : #Accesing }
Board >> gamepieces [
	^ gamepieces
]

{ #category : #Initializing }
Board >> initializeWithSquares: aSquaresCollection gamepieces: aGamepieceCollection andRounds: numberOfRounds [
	squares := aSquaresCollection.
	gamepieces := aGamepieceCollection.
	rounds := numberOfRounds.
	endOfBoard := squares size.
	lastSquareEffectApplied := SquareEffectApplied withEffect: (NonEffect new) affecting: (Gamepiece withColor: 'withoutColor') ofGamepieceCollection: gamepieces. 
]

{ #category : #Accesing }
Board >> lastSquareEffectApplied [
	^ lastSquareEffectApplied
]

{ #category : #Accesing }
Board >> rounds [
	^ rounds
]

{ #category : #Accesing }
Board >> squares [
	^ squares
]

{ #category : #Accesing }
Board >> updateGamepiecesPositionOnBoard [
	gamepieces do: [ :each | each positionOnBoardBasedOnNSquares: endOfBoard. ]
]
