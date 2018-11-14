"
This card is an Overload card. Its type is Permanent and its value is -2. 
"
Class {
	#name : #OverloadCard,
	#superclass : #Card,
	#instVars : [
		'id',
		'value'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
OverloadCard class >> withValueAndID: aCardID [
	^ self new initializeWithValueAndID: aCardID.
]

{ #category : #Accesing }
OverloadCard >> applyEffectTo: aPlayer [
	aPlayer gamepiece addAppliedEffectOfCardByCard: self. 
]

{ #category : #Accesing }
OverloadCard >> id [
	^ id.
]

{ #category : #Initializing }
OverloadCard >> initializeWithValueAndID: aCardID [
	value := -2.
	id := aCardID
]

{ #category : #Accesing }
OverloadCard >> value [
	^ value.
]
