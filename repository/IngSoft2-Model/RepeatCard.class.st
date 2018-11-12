Class {
	#name : #RepeatCard,
	#superclass : #Card,
	#instVars : [
		'id',
		'type'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
RepeatCard class >> withTypeValueAndID: aCardID [ 
	^ self new initializeWithTypeValueAndId: aCardID.
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
RepeatCard >> initializeWithTypeValueAndId: aCardID [ 
	id:= aCardID.
	type := 'instant'.
]

{ #category : #Accesing }
RepeatCard >> type [
	^ type
]
