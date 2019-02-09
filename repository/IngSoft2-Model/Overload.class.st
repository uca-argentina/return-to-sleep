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
Overload class >> withValue [
	^ self new initializeWithValue
]

{ #category : #Accesing }
Overload >> applyEffectTo: aPlayer [
	aPlayer gamepiece addAppliedEffectOfCardByCard: self. 
]

{ #category : #Initializing }
Overload >> initializeWithValue [
	value := -2.
]

{ #category : #Accesing }
Overload >> value [
	^ value.
]
