Class {
	#name : 'MyRFModel',
	#superclass : 'CMAbstractModel',
	#instVars : [
		'cells',
		'robots',
		'minerals'
	],
	#classInstVars : [
		'numberOfRows',
		'numberOfColumns',
		'numberOfRobots',
		'numberOfMinerals'
	],
	#category : 'MyRobotForager-Model',
	#package : 'MyRobotForager-Model'
}

{ #category : 'as yet unclassified' }
MyRFModel class >> aboutThisModel [

	^ ''
]

{ #category : 'initialization' }
MyRFModel class >> initializeParameters [
    super initializeParameters.
    numberOfRows := 5.
    numberOfColumns := 5.
    numberOfRobots := 2.
    numberOfMinerals := 20
]

{ #category : 'accessing' }
MyRFModel class >> numberOfColumns [

	^ numberOfColumns
]

{ #category : 'accessing' }
MyRFModel class >> numberOfColumns: anObject [

	numberOfColumns := anObject
]

{ #category : 'accessing' }
MyRFModel class >> numberOfMinerals [

	^ numberOfMinerals
]

{ #category : 'accessing' }
MyRFModel class >> numberOfMinerals: anObject [

	numberOfMinerals := anObject
]

{ #category : 'accessing' }
MyRFModel class >> numberOfRobots [

	^ numberOfRobots
]

{ #category : 'accessing' }
MyRFModel class >> numberOfRobots: anObject [

	numberOfRobots := anObject
]

{ #category : 'accessing' }
MyRFModel class >> numberOfRows [

	^ numberOfRows
]

{ #category : 'accessing' }
MyRFModel class >> numberOfRows: anObject [

	numberOfRows := anObject
]

{ #category : 'as yet unclassified' }
MyRFModel class >> prefix [

	^ 'MyRF'
]

{ #category : 'accessing - entities' }
MyRFModel >> cells [
    <getterFor: #MyRFCell>
    ^ cells
]

{ #category : 'initialization' }
MyRFModel >> initLarge [

	<init>
	self
		createGridNumberOfRows: self class numberOfRows
		numberOfColumns: self class numberOfColumns
		neighbourhood: 8
		closed: true.

	self createN: 10 randomlyLocatedAloneEntities: MyRFRobot.
	self createN: 200 randomlyLocatedAloneEntities: MyRFMineral
]

{ #category : 'initialization' }
MyRFModel >> initSmall [

	<init>
	self
		createGridNumberOfRows: self class numberOfRows
		numberOfColumns: self class numberOfColumns
		neighbourhood: 8
		closed: true.

	self createN: 2 randomlyLocatedAloneEntities: MyRFRobot.
	self createN: 20 randomlyLocatedAloneEntities: MyRFMineral
]

{ #category : 'initialization' }
MyRFModel >> initialize [

	super initialize.
	cells := OrderedCollection new.
	robots := OrderedCollection new.
	minerals := OrderedCollection new
	
]

{ #category : 'initialization' }
MyRFModel >> minerals [
    <getterFor: #MyRFMineral>
    ^ minerals
]

{ #category : 'initialization' }
MyRFModel >> numberOfCollectedMinerals [
    <probeNamed: 'Collected minerals' color: '00B44C'>
    ^ robots sum: [ :each | each collectedMinerals size ]
]

{ #category : 'initialization' }
MyRFModel >> numberOfRemainingMinerals [
    <probeNamed: 'Remaining minerals' color: 'E5B80B'>
    ^ minerals count: [ :each | each patch isNotNil ]
]

{ #category : 'accessing' }
MyRFModel >> robots [
    <getterFor: #MyRFRobot>
    ^ robots
]

{ #category : 'initialization' }
MyRFModel >> step [
    <control>
    robots do: [ :each | each step ]
]
