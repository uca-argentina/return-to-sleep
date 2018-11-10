Class {
	#name : #CancellationCard,
	#superclass : #Card,
	#instVars : [
		'name',
		'type',
		'value',
		'id'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
CancellationCard class >> withNameTypeValueAndId: aCardID [
	^ self new initializeWithNameTypeValueAndId: aCardID.
]

{ #category : #Accesing }
CancellationCard >> applyEffectTo: allPlayers removingCardEffectCausedByCardWithId: cardID [
	| cardEffectToErase |
	cardEffectToErase := allPlayers gamepiece cardEffectsApplied detect: [ :each | each causalCard id = cardID ].
	allPlayers gamepiece cardEffectsApplied remove: cardEffectToErase
]

{ #category : #Accesing }
CancellationCard >> id [
	^ id
]

{ #category : #Initializing }
CancellationCard >> initializeWithNameTypeValueAndId: aCardID. [
	name := 'Cancellation'.
	type := 'instant'.
	value := 0.
	id := aCardID.
]

{ #category : #Initializing }
CancellationCard >> name [
	^ name
]

{ #category : #Initializing }
CancellationCard >> type [
	^ type.
]
