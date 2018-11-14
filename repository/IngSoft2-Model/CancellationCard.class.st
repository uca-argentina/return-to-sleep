"
This card is a Cancellation card. It can cancel a permanent effect. Its type is instant.
"
Class {
	#name : #CancellationCard,
	#superclass : #Card,
	#instVars : [
		'value',
		'id'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
CancellationCard class >> withValueAndID: aCardID [
	^ self new initializeWithValueAndID: aCardID.
]

{ #category : #Accesing }
CancellationCard >> applyEffectTo: allPlayers removingCardEffectCausedByCardWithId: cardID [
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
CancellationCard >> id [
	^ id
]

{ #category : #Initializing }
CancellationCard >> initializeWithValueAndID: aCardID [
	value := 0.
	id := aCardID
]
