"
This is a Player of the game who knows how to play with different dices. 
"
Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'position',
		'name',
		'playerGamePiece'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
Player class >> withName: APlayerName andAGamePiece: aGamePiece [
	^ self new initializeWithName: APlayerName andAGamepiece: aGamePiece.
]

{ #category : #Accesing }
Player >> gamepiece [
	^playerGamePiece.
]

{ #category : #Initializing }
Player >> initializeWithName: aPlayerName andAGamepiece: aGamePiece. [ 
	name := aPlayerName.
	playerGamePiece := aGamePiece. 
]

{ #category : #Accesing }
Player >> name [
	^ name
]

{ #category : #Accesing }
Player >> playsATurnWith: aSetOfDices [
	| totalValueOfDices |
	totalValueOfDices := aSetOfDices sumNumbers: [ :x | x roll ].
	playerGamePiece changePositionTo: playerGamePiece position + totalValueOfDices. 
]
