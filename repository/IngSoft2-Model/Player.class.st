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

{ #category : #Accesing }
Player >> name [
	^ name
]

{ #category : #Accesing }
Player >> playCard: aCard applyTo: aPlayer andTellJudge: aJudge [
	aJudge validateTurnOf: self.
	hand playCard: aCard applyTo: aPlayer andTellJudge: aJudge
]

{ #category : #Accesing }
Player >> playCard: aCard applyTo: aPlayer redoingCardEffectMadeByCard: lastCard andTellJudge: aJudge [
	hand
		playCard: aCard
		applyTo: aPlayer
		redoingCardEffectMadeByCard: lastCard
		andTellJudge: aJudge
]

{ #category : #Accesing }
Player >> playCard: aCard applyTo: allPlayers redoingCardEffectMadeByCard: lastCard removingCardEffectCausedByCard: causalCard andTellJudge: aJudge [
	hand
		playCard: aCard
		applyTo: allPlayers
		redoingCardEffectMadeByCard: lastCard
		removingCardEffectCausedByCard: causalCard
		andTellJudge: aJudge
]

{ #category : #Accesing }
Player >> playCard: aCard applyTo: allPlayers removingCardEffectCausedByCard: causalCard andTellJudge: aJudge [
	hand
		playCard: aCard
		applyTo: allPlayers
		removingCardEffectCausedByCard: causalCard
		andTellJudge: aJudge
]

{ #category : #Accesing }
Player >> playCard: aCard applyingEffect: aSquareEffectApplied andTellJudge: aJudge [
	hand
		playCard: aCard
		applyingEffect: aSquareEffectApplied
		andTellJudge: aJudge
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
