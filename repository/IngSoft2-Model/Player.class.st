"
This is a Player of the game who knows how to play with different dices. 
"
Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'name',
		'playerGamePiece',
		'hand'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
Player class >> withName: APlayerName aGamePiece: aGamePiece aCard: aFirstCard andOtherCard: aSecondCard [
	^ self new
		initializeWithName: APlayerName
		aGamepiece: aGamePiece
		aCard: aFirstCard
		andOtherCard: aSecondCard
]

{ #category : #Creating }
Player class >> withName: APlayerName andAGamePiece: aGamePiece [
	^ self new initializeWithName: APlayerName andAGamepiece: aGamePiece.
]

{ #category : #Accesing }
Player >> gamepiece [
	^playerGamePiece.
]

{ #category : #Initializing }
Player >> initializeWithName: aPlayerName aGamepiece: aGamePiece aCard: aFirstCard andOtherCard: aSecondCard [
	name := aPlayerName.
	playerGamePiece := aGamePiece.
	hand := Hand withACard: aFirstCard andOtherCard: aSecondCard.
	
]

{ #category : #Initializing }
Player >> initializeWithName: aPlayerName andAGamepiece: aGamePiece. [ 
	name := aPlayerName.
	playerGamePiece := aGamePiece. 
]

{ #category : #Accesing }
Player >> name [
	^ name
]

{ #category : #Accesing }
Player >> playCardByID: aCardId applyTo: aPlayer [
	hand playCardByID: aCardId  applyTo: aPlayer
]

{ #category : #Accesing }
Player >> playCardByID: aCardID applyTo: allPlayers removingCardEffectCausedByCardWithId: causalCardID [
	hand
		playCardByID: aCardID
		applyTo: allPlayers
		removingCardEffectCausedByCardWithId: causalCardID
]

{ #category : #Accesing }
Player >> playsATurnWith: aSetOfDices [
	| totalValueOfDices valuesOfCardEffects |
	totalValueOfDices := aSetOfDices sumNumbers: [ :x | x roll ].
	valuesOfCardEffects := playerGamePiece cardEffectsApplied inject: 0 into: [ :sum :each | sum + each causalCard value ].
	playerGamePiece changePositionTo: playerGamePiece position + totalValueOfDices + valuesOfCardEffects
]
