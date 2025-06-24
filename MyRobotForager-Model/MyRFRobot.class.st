Class {
	#name : 'MyRFRobot',
	#superclass : 'CMAgent',
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#instVars : [
		'collectedMinerals'
	],
	#category : 'MyRobotForager-Model',
	#package : 'MyRobotForager-Model'
}

{ #category : 'accessing' }
MyRFRobot >> collectMineral [
    <action>
    | mineral |
    self patch hasMineral ifFalse: [ ^ self ]. 
    mineral := self patch getMineral.
    collectedMinerals add: mineral.
    mineral leave
]

{ #category : 'accessing' }
MyRFRobot >> collectedMinerals [
    ^ collectedMinerals
]

{ #category : 'initialization' }
MyRFRobot >> initialize [
    super initialize.
    collectedMinerals := OrderedCollection new
]

{ #category : 'accessing' }
MyRFRobot >> move [
    <action>
    self patch neighbourhood
        detect: [ :cell | cell hasMineral ]
        ifFound: [ :cell | self moveTo: cell ]
        ifNone: [ self moveRandomly ]
]

{ #category : 'as yet unclassified' }
MyRFRobot >> moveRandomly [
    <action>
    self randomWalkConstrainedBy: [ :cell |
        (cell hasOccupantsOfClass: RFRobot) not ]
]

{ #category : 'accessing' }
MyRFRobot >> pov [
    <pov>
    ^ CMPointOfView
        color: CMColor blue
        shape: #star
        size: 0.6
]

{ #category : 'control' }
MyRFRobot >> step [
    <action>
    self move.
    self collectMineral

]
