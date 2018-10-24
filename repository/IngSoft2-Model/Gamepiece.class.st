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
		'finalRanking'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
Gamepiece class >> withColor: aColor [
	^ self new initializeWithAColor: aColor. 
]

{ #category : #accesing }
Gamepiece >> changePositionTo: aNewPosition [ 
	position := aNewPosition.
]

{ #category : #accesing }
Gamepiece >> changeRoundTo: newRound [
	rounds := newRound. 
]

{ #category : #Accesing }
Gamepiece >> color [
	^ color
]

{ #category : #accesing }
Gamepiece >> finalRanking [
^finalRanking.
]

{ #category : #accesing }
Gamepiece >> finalRanking: aRanking [
	finalRanking := aRanking. 
]

{ #category : #Creating }
Gamepiece >> initializeWithAColor: aColor [
	color := aColor.
	position := 0.
	rounds := 0.
	positionOnBoard:=0.
]

{ #category : #accesing }
Gamepiece >> position [
	^ position. 
]

{ #category : #Accesing }
Gamepiece >> positionOnBoard [
	^ positionOnBoard
]

{ #category : #accesing }
Gamepiece >> positionOnBoardBasedOnNSquares: aNumberOfSquares [
positionOnBoard := position - (rounds*aNumberOfSquares ).
]

{ #category : #Accesing }
Gamepiece >> rounds [
	^ rounds
]
