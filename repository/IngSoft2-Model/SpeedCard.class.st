"
This card is an Overload card. Its type is Permanent and its value is +1.  It affects only a player. 
"
Class {
	#name : #SpeedCard,
	#superclass : #Card,
	#instVars : [
		'value',
		'id'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
SpeedCard class >> withValueAndID: aCardID [
	^ self new initializeWithValueAndID: aCardID
]

{ #category : #Initializing }
SpeedCard >> applyEffectTo: aPlayer [
	aPlayer gamepiece addAppliedEffectOfCardByCard: self
]

{ #category : #Accesing }
SpeedCard >> id [
	^ id
]

{ #category : #Initializing }
SpeedCard >> initializeWithValueAndID: aCardID [
	value := 1.
	id := aCardID
]

{ #category : #Accesing }
SpeedCard >> value [
	^ value
]
