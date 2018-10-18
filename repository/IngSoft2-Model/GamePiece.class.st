"
This is a GamePiece. Each player has one game piece. 
The piece knows its position on the board and the number of rounds that has advance through. 
"
Class {
	#name : #GamePiece,
	#superclass : #Object,
	#instVars : [
		'color',
		'positionOnBoard',
		'rounds'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
GamePiece class >> withColor: aColor [
	^ self new initializeWithAColor: aColor. 
]

{ #category : #accesing }
GamePiece >> changePositionTo: aNewPosition [ 
	positionOnBoard := aNewPosition.
]

{ #category : #Accesing }
GamePiece >> color [
	^ color
]

{ #category : #Creating }
GamePiece >> initializeWithAColor: aColor [
	color := aColor.
	positionOnBoard:= 0.
	rounds := 0. 
	
]

{ #category : #accesing }
GamePiece >> position [
	^ positionOnBoard. 
]
