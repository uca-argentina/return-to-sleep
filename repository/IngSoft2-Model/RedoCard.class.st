"
This card is a Cancellation card. It can cancel a permanent effect. Its type is instant.
"
Class {
	#name : #RedoCard,
	#superclass : #Card,
	#instVars : [
		'id',
		'value'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
RedoCard class >> withValueAndID: aCardID [ 
	^ self new initializeWithValueAndID: aCardID 
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
RedoCard >> initializeWithValueAndID: aCardID [
	id := aCardID.
	value := 0.
]
