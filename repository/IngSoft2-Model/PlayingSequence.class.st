"
This is a Playing Sequence. It has the order of the turns of the different players. It knows the current player and knows to change to the next player.
"
Class {
	#name : #PlayingSequence,
	#superclass : #Object,
	#instVars : [
		'players',
		'turnIndex'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
PlayingSequence class >> newWithAllPlayers: anArrayOfPlayers. [
	^self new initializewithAllPlayers: anArrayOfPlayers 
]

{ #category : #Accessing }
PlayingSequence >> changeToNextPlayer [
	(turnIndex < players size)
	ifTrue: [turnIndex := turnIndex + 1.]
	ifFalse: [ turnIndex := 1 ]
	
]

{ #category : #Accesing }
PlayingSequence >> currentPlayer [
	^players at: turnIndex.
]

{ #category : #Creating }
PlayingSequence >> initializewithAllPlayers: anArrayOfPlayers [
	players:= anArrayOfPlayers.
	turnIndex:=1.
]
