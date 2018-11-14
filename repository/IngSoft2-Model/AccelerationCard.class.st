"
This card is an Overload card. Its type is Permanent and its value is +1.  It affects all players.
"
Class {
	#name : #AccelerationCard,
	#superclass : #Card,
	#instVars : [
		'id',
		'value'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
AccelerationCard class >> withValueAndID: aCardID [ 
	^ self new initializeWithValueAndID: aCardID. 
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
AccelerationCard >> initializeWithValueAndID: aCardID [
	id := aCardID.
	value := 1
]

{ #category : #Accesing }
AccelerationCard >> value [
	^ value.
]
