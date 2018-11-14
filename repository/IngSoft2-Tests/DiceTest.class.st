Class {
	#name : #DiceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'dice-tests' }
DiceTest >> testCreateDiceWith6Faces [
	| dice |
	dice := Dice withFaces: 6.
	self assert: dice faces equals: 6
]

{ #category : #'dice-tests' }
DiceTest >> testCreateLoadedDiceWith6Faces [
	| dice |
	dice := LoadedDice withFaces: 6.
	self assert: dice faces equals: 6
]

{ #category : #'dice-tests' }
DiceTest >> testCreateNormalDiceWith6Faces [
	| dice |
	dice := NormalDice withFaces: 6.
	self assert: dice faces equals: 6
]

{ #category : #'dice-tests' }
DiceTest >> testCreateWrongDiceWithWrongNumberOfFaces [
	self
		should: [ Dice withFaces: 0 ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'You cannot create a dice with zero or negative faces' ].
	self
		should: [ Dice withFaces: -3 ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'You cannot create a dice with zero or negative faces' ]
]

{ #category : #'dice-tests' }
DiceTest >> testRollLoadedDice [
	| dice |
	dice := LoadedDice withFaces: 100.
	self assert: dice roll equals: 100.
]

{ #category : #'dice-tests' }
DiceTest >> testRollNormalDice [
	| dice |
	dice := NormalDice withFaces: 6.
	self assert: (dice roll between: 1 and: dice faces)
]
