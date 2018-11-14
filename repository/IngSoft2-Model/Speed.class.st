"
This card is an Overload card. Its type is Permanent and its value is +1.  It affects only a player. 
"
Class {
	#name : #Speed,
	#superclass : #Card,
	#instVars : [
		'value',
		'id'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
Speed class >> withValueAndID: aCardID [
	^ self new initializeWithValueAndID: aCardID
]

{ #category : #Initializing }
Speed >> applyEffectTo: aPlayer [
	aPlayer gamepiece addAppliedEffectOfCardByCard: self
]

{ #category : #Accesing }
Speed >> id [
	^ id
]

{ #category : #Initializing }
Speed >> initializeWithValueAndID: aCardID [
	value := 1.
	id := aCardID
]

{ #category : #Accesing }
Speed >> value [
	^ value
]
