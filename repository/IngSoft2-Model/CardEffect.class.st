"
This is a card effect. It is created by a Causal Card. 
"
Class {
	#name : #CardEffect,
	#superclass : #Object,
	#instVars : [
		'causalCard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
CardEffect class >> createdByCard: aCard [
	^ self new initializeCreatedByCard: aCard
]

{ #category : #Accesing }
CardEffect >> causalCard [
	^ causalCard
]

{ #category : #Initializing }
CardEffect >> initializeCreatedByCard: aCard [
	causalCard := aCard
]
