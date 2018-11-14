"
This card is an Overload card. Its type is Permanent and its value is +1.  It affects all players.
"
Class {
	#name : #Acceleration,
	#superclass : #Card,
	#instVars : [
		'id',
		'value'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
Acceleration class >> withValueAndID: aCardID [ 
	^ self new initializeWithValueAndID: aCardID. 
]

{ #category : #Accesing }
Acceleration >> applyEffectTo: allPlayers [ 
	allPlayers do: [ :each| each gamepiece addAppliedEffectOfCardByCard: self ].
]

{ #category : #Accesing }
Acceleration >> id [
	^ id.
]

{ #category : #Initializing }
Acceleration >> initializeWithValueAndID: aCardID [
	id := aCardID.
	value := 1
]

{ #category : #Accesing }
Acceleration >> value [
	^ value.
]
