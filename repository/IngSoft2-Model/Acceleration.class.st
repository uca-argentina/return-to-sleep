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
Acceleration class >> withValue [
	^ self new initializeWithValue
]

{ #category : #Accesing }
Acceleration >> applyEffectTo: allPlayers [ 
	allPlayers do: [ :each| each gamepiece addAppliedEffectOfCardByCard: self ].
]

{ #category : #Initializing }
Acceleration >> initializeWithValue [
	value := 1
]

{ #category : #Accesing }
Acceleration >> value [
	^ value.
]
