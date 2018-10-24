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
	^ self new withName: APlayerName andAGamepiece: aGamePiece.
]

{ #category : #Accesing }
Player >> gamepiece [
	^playerGamePiece.
]

{ #category : #Creating }
Player >> name [
	^ name
]

{ #category : #accesing }
Player >> playsWith: aSetOfDices [
	| totalValueOfDices |
	totalValueOfDices := aSetOfDices sumNumbers: [ :x | x roll ].
	playerGamePiece changePositionTo: (playerGamePiece position) + totalValueOfDices. 
]

{ #category : #Creating }
Player >> withName: aPlayerName andAGamepiece: aGamePiece. [ 
	name := aPlayerName.
	playerGamePiece := aGamePiece. 
]
