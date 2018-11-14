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
Redo class >> withValueAndID: aCardID [ 
	^ self new initializeWithValueAndID: aCardID 
]

{ #category : #Accesing }
Redo >> applyEffectTo: aPlayer redoingCardEffectMadeByCard: lastCard [
	aPlayer gamepiece addAppliedEffectOfCardByCard: lastCard.
]

{ #category : #Accesing }
Redo >> id [
	^ id
]

{ #category : #'as yet unclassified ' }
Redo >> initializeWithValueAndID: aCardID [
	id := aCardID.
	value := 0.
]
