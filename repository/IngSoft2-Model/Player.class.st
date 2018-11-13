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
Player >> playCardByID: aCardId applyTo: aPlayer andTellJudge: aJudge [
aJudge validateTurnOf: self.
hand playCardByID: aCardId applyTo: aPlayer andTellJudge: aJudge. 
]

{ #category : #Accesing }
Player >> playCardByID: aCardID applyTo: aPlayer redoingCardEffectMadeByCard: lastCard andTellJudge: aJudge [
		hand
		playCardByID: aCardID
		applyTo: aPlayer
		redoingCardEffectMadeByCard: lastCard
		andTellJudge: aJudge
]

{ #category : #Accesing }
Player >> playCardByID: aCardID applyTo: allPlayers redoingCardEffectMadeByCard: lastCard removingCardEffectCausedByCardWithId: causalCardID andTellJudge: aJudge [
	hand
		playCardByID: aCardID
		applyTo: allPlayers
		redoingCardEffectMadeByCard: lastCard
		removingCardEffectCausedByCardWithId: causalCardID
		andTellJudge: aJudge
]

{ #category : #Accesing }
Player >> playCardByID: aCardID applyTo: allPlayers removingCardEffectCausedByCardWithId: causalCardID andTellJudge: aJudge [
	hand playCardByID: aCardID applyTo: allPlayers removingCardEffectCausedByCardWithId: causalCardID andTellJudge: aJudge. 
]

{ #category : #Accesing }
Player >> playCardByID: aCardID applyingEffect: aSquareEffectApplied andTellJudge: aJudge [
	hand playCardByID: aCardID applyingEffect: aSquareEffectApplied andTellJudge: aJudge. 
]

{ #category : #Accesing }
Player >> playsATurnWith: aSetOfDices [
	| totalValueOfDices valuesOfCardEffects |
	totalValueOfDices := aSetOfDices sumNumbers: [ :x | x roll ].
	valuesOfCardEffects := playerGamePiece cardEffectsApplied inject: 0 into: [ :sum :each | sum + each causalCard value ].
	playerGamePiece changePositionTo: playerGamePiece position + totalValueOfDices + valuesOfCardEffects
	
]

{ #category : #Accesing }
Player >> receivesCard: aCard. [
hand receivesCard: aCard.
]
