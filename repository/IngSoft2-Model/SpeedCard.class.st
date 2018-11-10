Class {
	#name : #SpeedCard,
	#superclass : #Card,
	#instVars : [
		'type',
		'value',
		'id'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
SpeedCard class >> withTypeValueAndId: aCardID [
	^ self new initializeWithTypeValueAndId: aCardID
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
SpeedCard >> initializeWithTypeValueAndId: aCardID [
	type := 'permanent'.
	value := 1.
	id := aCardID
]

{ #category : #Accesing }
SpeedCard >> type [
	^ type
]

{ #category : #Accesing }
SpeedCard >> value [
	^ value
]
