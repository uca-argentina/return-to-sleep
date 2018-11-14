"
This is a RepeatCard. It re applies the last square effect to the last affected player/players. 
"
Class {
	#name : #Repeat,
	#superclass : #Card,
	#instVars : [
		'id',
		'value'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
Repeat class >> withValueAndID: aCardID [ 
	^ self new initializeWithValueAndID: aCardID.
]

{ #category : #Accesing }
Repeat >> applyingEffect: lastSquareEffectApplied [
	lastSquareEffectApplied effect applyEffectTo: lastSquareEffectApplied affectedGamepiece ofGamepieceCollection: lastSquareEffectApplied gamepieces.
]

{ #category : #Accesing }
Repeat >> id [
	^ id
]

{ #category : #Initializing }
Repeat >> initializeWithValueAndID: aCardID [
	id := aCardID.
	value := 0.
]
