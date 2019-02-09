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
Speed class >> withValue [
	^ self new initializeWithValue
]

{ #category : #Initializing }
Speed >> applyEffectTo: aPlayer [
	aPlayer gamepiece addAppliedEffectOfCardByCard: self
]

{ #category : #Initializing }
Speed >> initializeWithValue [
	value := 1.
]

{ #category : #Accesing }
Speed >> value [
	^ value
]
