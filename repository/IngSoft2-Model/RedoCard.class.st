Class {
	#name : #RedoCard,
	#superclass : #Card,
	#instVars : [
		'id',
		'type',
		'value'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
RedoCard class >> withTypeValueAndID: aCardID [ 
	^ self new initializeWithTypeValueAndID: aCardID 
]

{ #category : #Accesing }
RedoCard >> applyEffectTo: aPlayer redoingCardEffectMadeByCard: lastCard [
	aPlayer gamepiece addAppliedEffectOfCardByCard: lastCard.
]

{ #category : #Accesing }
RedoCard >> id [
	^ id
]

{ #category : #'as yet unclassified ' }
RedoCard >> initializeWithTypeValueAndID: aCardID [ 
	id := aCardID.
	type := 'instant'.
	value := 0. 
]

{ #category : #Accesing }
RedoCard >> type [
	^ type
]
