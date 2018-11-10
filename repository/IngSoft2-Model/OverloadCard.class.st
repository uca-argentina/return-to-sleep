"
This card is an Overload card. Its type is Permanent and its value is -2. 
"
Class {
	#name : #OverloadCard,
	#superclass : #Card,
	#instVars : [
		'type',
		'value',
		'id'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
OverloadCard class >> withTypeValueAndId: aCardID [
	^ self new initializeWithTypeValueAndId: aCardID.
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
OverloadCard >> initializeWithTypeValueAndId: aCardID [
	type := 'permanent'.
	value := -2.
	id := aCardID
]

{ #category : #Accesing }
OverloadCard >> type [
	^ type
]

{ #category : #Accesing }
OverloadCard >> value [
	^ value.
]
