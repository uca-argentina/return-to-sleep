"
This is a Player of the game who knows how to play with different dices. 
"
Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'position',
		'name'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
Player class >> withName: APlayerName [
	^self new initializeWithName: APlayerName.
]

{ #category : #Creating }
Player >> initializeWithName: aPlayerName [
	name:= aPlayerName.
	position:=1.
]

{ #category : #Creating }
Player >> name [
	^ name
]

{ #category : #accesing }
Player >> playsWith: aSetOfDices [ 

	| totalValueOfDices |
	
	totalValueOfDices := aSetOfDices sumNumbers: [ :x | x roll ].
	
		
	position := position + totalValueOfDices. 
	

]

{ #category : #Creating }
Player >> position [
	^ position
]
