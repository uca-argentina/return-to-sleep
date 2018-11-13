"
This is a RepeatCard. It re applies the last square effect to the last affected player/players. 
"
Class {
	#name : #RepeatCard,
	#superclass : #Card,
	#instVars : [
		'id',
		'value'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
RepeatCard class >> withValueAndID: aCardID [ 
	^ self new initializeWithValueAndID: aCardID.
]

{ #category : #Accesing }
RepeatCard >> applyingEffect: lastSquareEffectApplied [
	lastSquareEffectApplied effect applyEffectTo: lastSquareEffectApplied affectedGamepiece ofGamepieceCollection: lastSquareEffectApplied gamepieces.
]

{ #category : #Accesing }
RepeatCard >> id [
	^ id
]

{ #category : #Initializing }
RepeatCard >> initializeWithValueAndID: aCardID [
	id := aCardID.
	value := 0.
]
