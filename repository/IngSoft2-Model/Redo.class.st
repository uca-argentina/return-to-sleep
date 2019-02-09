"
This card is a Cancellation card. It can cancel a permanent effect. Its type is instant.
"
Class {
	#name : #Redo,
	#superclass : #Card,
	#instVars : [
		'id',
		'value'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
Redo class >> withValue [
	^ self new initializeWithValue
]

{ #category : #Accesing }
Redo >> applyEffectTo: aPlayer redoingCardEffectMadeByCard: lastCard [
	aPlayer gamepiece addAppliedEffectOfCardByCard: lastCard.
]

{ #category : #'as yet unclassified ' }
Redo >> initializeWithValue [
	value := 0
]
