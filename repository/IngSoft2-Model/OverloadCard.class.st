"
This card is an Overload card. Its type is Permanent and its value is -2. 
"
Class {
	#name : #OverloadCard,
	#superclass : #Card,
	#instVars : [
		'type',
		'name',
		'value',
		'id'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
OverloadCard class >> withNameTypeValueAndId: aCardID [
	^ self new initializeWithNameTypeValueAndId: aCardID.
]

{ #category : #Accesing }
OverloadCard >> applyEffectTo: aPlayer [
	aPlayer gamepiece addAppliedEffectOfCardByCard: self. 
]

{ #category : #Accesing }
OverloadCard >> id [
	^ id.
]

{ #category : #initialization }
OverloadCard >> initializeWithNameTypeValueAndId: aCardID [
	type := 'permanent'.
	name := 'Overload'.
	value := -2.
	id := aCardID.
]

{ #category : #Accesing }
OverloadCard >> name [
	^ name.
]

{ #category : #Accesing }
OverloadCard >> type [
	^ type
]

{ #category : #Accesing }
OverloadCard >> value [
	^ value.
]
