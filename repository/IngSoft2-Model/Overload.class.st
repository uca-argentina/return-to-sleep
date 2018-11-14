"
This card is an Overload card. Its type is Permanent and its value is -2. 
"
Class {
	#name : #Overload,
	#superclass : #Card,
	#instVars : [
		'id',
		'value'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
Overload class >> withValueAndID: aCardID [
	^ self new initializeWithValueAndID: aCardID.
]

{ #category : #Accesing }
Overload >> applyEffectTo: aPlayer [
	aPlayer gamepiece addAppliedEffectOfCardByCard: self. 
]

{ #category : #Accesing }
Overload >> id [
	^ id.
]

{ #category : #Initializing }
Overload >> initializeWithValueAndID: aCardID [
	value := -2.
	id := aCardID
]

{ #category : #Accesing }
Overload >> value [
	^ value.
]
