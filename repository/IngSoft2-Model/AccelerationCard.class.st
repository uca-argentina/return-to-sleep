"
This card is an Overload card. Its type is Permanent and its value is +1.  It affects all players.
"
Class {
	#name : #AccelerationCard,
	#superclass : #Card,
	#instVars : [
		'id',
		'type',
		'value'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
AccelerationCard class >> withTypeValueAndId: aCardID [ 
	^ self new initializeWithTypeValueAndId: aCardID. 
]

{ #category : #Accesing }
AccelerationCard >> applyEffectTo: allPlayers [ 
	allPlayers do: [ :each| each gamepiece addAppliedEffectOfCardByCard: self ].
]

{ #category : #Accesing }
AccelerationCard >> id [
	^ id.
]

{ #category : #Initializing }
AccelerationCard >> initializeWithTypeValueAndId: aCardID [ 
	id := aCardID. 
	type := 'permanent'.
	value := 1. 
]

{ #category : #Accesing }
AccelerationCard >> type [
	^ type
]

{ #category : #Accesing }
AccelerationCard >> value [
	^ value.
]
