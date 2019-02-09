"
This is a GamePiece. Each player has one game piece. 
The piece knows its position on the board and the number of rounds that has advance through. 
"
Class {
	#name : #Gamepiece,
	#superclass : #Object,
	#instVars : [
		'color',
		'rounds',
		'position',
		'positionOnBoard',
		'finalRanking',
		'cardEffectsApplied'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
Gamepiece class >> withInitialPosition [
	^ self new initializeWithInitialPosition
]

{ #category : #Accesing }
Gamepiece >> addAppliedEffectOfCardByCard: aCard [
	cardEffectsApplied add: (CardEffect createdByCard: aCard). 
]

{ #category : #Accesing }
Gamepiece >> cardEffectsApplied [
^	cardEffectsApplied 
]

{ #category : #Accesing }
Gamepiece >> changePositionTo: aNewPosition [ 
	position := aNewPosition.
]

{ #category : #Accesing }
Gamepiece >> changeRoundTo: newRound [
	rounds := newRound. 
]

{ #category : #Accesing }
Gamepiece >> finalRanking [
^finalRanking.
]

{ #category : #Accesing }
Gamepiece >> finalRanking: aRanking [
	finalRanking := aRanking. 
]

{ #category : #Initializing }
Gamepiece >> initializeWithInitialPosition [
	position := 0.
	rounds := 0.
	positionOnBoard := 0.
	cardEffectsApplied := Set new
]

{ #category : #Accesing }
Gamepiece >> position [
	^ position. 
]

{ #category : #Accesing }
Gamepiece >> positionOnBoard [
	^ positionOnBoard
]

{ #category : #Accesing }
Gamepiece >> positionOnBoardBasedOnNSquares: aNumberOfSquares [
positionOnBoard := position - (rounds*aNumberOfSquares ).
]

{ #category : #Accesing }
Gamepiece >> rounds [
	^ rounds
]
