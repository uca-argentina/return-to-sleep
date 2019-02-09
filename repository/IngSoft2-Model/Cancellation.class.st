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
Cancellation class >> withValue [
	^ self new initializeWithValue
]

{ #category : #Accesing }
Cancellation >> applyEffectTo: allPlayers removingCardEffectCausedByCard: aCard [
	| cardEffectToErase |
	allPlayers
		do: [ :each | 
			each gamepiece cardEffectsApplied
				detect: [ :effect | effect causalCard = aCard ]
				ifFound: [ :effect | 
					cardEffectToErase := effect.
					each gamepiece cardEffectsApplied remove: cardEffectToErase ]
				ifNone: [  ] ]
]

{ #category : #Initializing }
Cancellation >> initializeWithValue [
	value := 0.
]
