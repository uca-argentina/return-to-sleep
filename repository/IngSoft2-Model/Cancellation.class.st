"
This card is a Cancellation card. It can cancel a permanent effect. Its type is instant.
"
Class {
	#name : #Cancellation,
	#superclass : #Card,
	#instVars : [
		'value',
		'id'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
Cancellation class >> withValueAndID: aCardID [
	^ self new initializeWithValueAndID: aCardID.
]

{ #category : #Accesing }
Cancellation >> applyEffectTo: allPlayers removingCardEffectCausedByCardWithId: cardID [
	| cardEffectToErase |
	allPlayers
		do: [ :each | 
			each gamepiece cardEffectsApplied
				detect: [ :effect | effect causalCard id = cardID ]
				ifFound: [ :effect | 
					cardEffectToErase := effect.
					each gamepiece cardEffectsApplied remove: cardEffectToErase ]
				ifNone: [  ] ]
]

{ #category : #Accesing }
Cancellation >> id [
	^ id
]

{ #category : #Initializing }
Cancellation >> initializeWithValueAndID: aCardID [
	value := 0.
	id := aCardID
]
