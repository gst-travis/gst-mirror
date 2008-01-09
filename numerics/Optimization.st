"======================================================================
|
|   Numerical methods - Optimization / Operations Research
|
|
 ======================================================================"


"======================================================================
|
| Written by Didier Besset.
|
| This file is distributed together with GNU Smalltalk.
|
 ======================================================================"

Object subclass:  #DhbProjectedOneVariableFunction
	instanceVariableNames: 'index function argument '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DHB Numerical'!

DhbProjectedOneVariableFunction comment: 
nil!

DhbFunctionalIterator subclass:  #DhbFunctionOptimizer
	instanceVariableNames: 'optimizingPointClass bestPoints '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DHB Numerical'!

DhbFunctionOptimizer comment: 
nil!

Object subclass:  #DhbMinimizingPoint
	instanceVariableNames: 'value position '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DHB Numerical'!

DhbMinimizingPoint comment: 
nil!

DhbFunctionOptimizer subclass:  #DhbOneVariableFunctionOptimizer
	instanceVariableNames: ''
	classVariableNames: 'GoldenSection '
	poolDictionaries: ''
	category: 'DHB Numerical'!

DhbOneVariableFunctionOptimizer comment: 
nil!

DhbFunctionOptimizer subclass:  #DhbMultiVariableGeneralOptimizer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DHB Numerical'!

DhbMultiVariableGeneralOptimizer comment: 
nil!

Object subclass:  #DhbChromosomeManager
	instanceVariableNames: 'population populationSize rateOfMutation rateOfCrossover '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DHB Numerical'!

DhbChromosomeManager comment: 
nil!

DhbFunctionOptimizer subclass:  #DhbHillClimbingOptimizer
	instanceVariableNames: 'unidimensionalFinder '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DHB Numerical'!

DhbHillClimbingOptimizer comment: 
nil!

DhbFunctionOptimizer subclass:  #DhbGeneticOptimizer
	instanceVariableNames: 'chromosomeManager '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DHB Numerical'!

DhbGeneticOptimizer comment: 
nil!

DhbMinimizingPoint subclass:  #DhbMaximizingPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DHB Numerical'!

DhbMaximizingPoint comment: 
nil!

DhbFunctionOptimizer subclass:  #DhbSimplexOptimizer
	instanceVariableNames: 'worstVector '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DHB Numerical'!

DhbSimplexOptimizer comment: 
nil!

DhbProjectedOneVariableFunction subclass:  #DhbVectorProjectedFunction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DHB Numerical'!

DhbVectorProjectedFunction comment: 
nil!

DhbOneVariableFunctionOptimizer subclass:  #DhbOptimizingBracketFinder
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DHB Numerical'!

DhbOptimizingBracketFinder comment: 
nil!

DhbChromosomeManager subclass:  #DhbVectorChromosomeManager
	instanceVariableNames: 'origin range '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DHB Numerical'!

DhbVectorChromosomeManager comment: 
nil!

!DhbProjectedOneVariableFunction class methodsFor: 'creation'!

function: aVectorFunction 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    ^super new initialize: aVectorFunction! !

!DhbProjectedOneVariableFunction methodsFor: 'information'!

argumentWith: aNumber 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    ^argument
	at: index put: aNumber;
	yourself!

index
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    index isNil ifTrue: [index := 1].
    ^index!

value: aNumber 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    ^function value: (self argumentWith: aNumber)! !

!DhbProjectedOneVariableFunction methodsFor: 'initialization'!

initialize: aFunction 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    function := aFunction.
    ^self!

setArgument: anArrayOrVector 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    argument := anArrayOrVector copy!

setIndex: anInteger 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    index := anInteger! !

!DhbProjectedOneVariableFunction methodsFor: 'transformation'!

bumpIndex
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    index isNil 
	ifTrue: [index := 1]
	ifFalse: 
	    [index := index + 1.
	    index > argument size ifTrue: [index := 1]]! !




!DhbFunctionOptimizer class methodsFor: 'creation'!

forOptimizer: aFunctionOptimizer 
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    ^self new initializeForOptimizer: aFunctionOptimizer!

maximizingFunction: aFunction 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    ^(super new)
	initializeAsMaximizer;
	setFunction: aFunction!

minimizingFunction: aFunction 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    ^(super new)
	initializeAsMinimizer;
	setFunction: aFunction! !

!DhbFunctionOptimizer class methodsFor: 'information'!

defaultPrecision
    "Private - Answers the default precision for newly created instances.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/1/99 "

    ^super defaultPrecision * 100! !

!DhbFunctionOptimizer methodsFor: 'display'!

printOn: aStream 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    super printOn: aStream.
    bestPoints do: 
	    [:each | 
	    aStream cr.
	    each printOn: aStream]! !

!DhbFunctionOptimizer methodsFor: 'information'!

bestPoints
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    ^bestPoints!

functionBlock
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    ^functionBlock!

pointClass
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    ^optimizingPointClass! !

!DhbFunctionOptimizer methodsFor: 'initialization'!

initialize
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    bestPoints := SortedCollection sortBlock: [:a :b | a betterThan: b].
    ^super initialize!

initializeAsMaximizer
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    optimizingPointClass := DhbMaximizingPoint.
    ^self initialize!

initializeAsMinimizer
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    optimizingPointClass := DhbMinimizingPoint.
    ^self!

initializeForOptimizer: aFunctionOptimizer 
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    optimizingPointClass := aFunctionOptimizer pointClass.
    functionBlock := aFunctionOptimizer functionBlock.
    ^self initialize!

initialValue: aVector 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 04-Jan-00 "

    result := aVector copy! !

!DhbFunctionOptimizer methodsFor: 'operation'!

finalizeIterations
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    result := bestPoints first position! !

!DhbFunctionOptimizer methodsFor: 'transformation'!

addPointAt: aNumber 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    bestPoints 
	add: (optimizingPointClass vector: aNumber function: functionBlock)! !




!DhbMinimizingPoint class methodsFor: 'creation'!

new: aVector value: aNumber 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 04-Jan-00 "

    ^(self new)
	vector: aVector;
	value: aNumber;
	yourself!

vector: aVector function: aFunction 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 04-Jan-00 "

    ^self new: aVector value: (aFunction value: aVector)! !

!DhbMinimizingPoint methodsFor: 'display'!

printOn: aStream 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 05-Jan-00 "

    position printOn: aStream.
    aStream
	nextPut: $:;
	space.
    value printOn: aStream! !

!DhbMinimizingPoint methodsFor: 'information'!

betterThan: anOptimizingPoint 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 04-Jan-00 "

    ^value < anOptimizingPoint value!

position
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 04-Jan-00 "

    ^position!

value
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 04-Jan-00 "

    ^value! !

!DhbMinimizingPoint methodsFor: 'initialization'!

value: aNumber 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 04-Jan-00 "

    value := aNumber!

vector: aVector 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 04-Jan-00 "

    position := aVector! !




!DhbOneVariableFunctionOptimizer class methodsFor: 'information'!

defaultPrecision
    "Private - Answers the default precision for newly created instances.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/1/99 "

    ^DhbFloatingPointMachine new defaultNumericalPrecision * 10!

goldenSection
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    GoldenSection isNil ifTrue: [GoldenSection := (3 - 5 sqrt) / 2].
    ^GoldenSection! !

!DhbOneVariableFunctionOptimizer methodsFor: 'information'!

computePrecision
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    ^self 
	precisionOf: ((bestPoints at: 2) position - (bestPoints at: 3) position) 
		abs
	relativeTo: (bestPoints at: 1) position abs!

hasBracketingPoints
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    | x1 |
    x1 := (bestPoints at: 1) position.
    ^((bestPoints at: 2) position - x1) * ((bestPoints at: 3) position - x1) 
	< 0!

indexOfOuterPoint
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    | inferior superior x |
    inferior := false.
    superior := false.
    x := bestPoints first position.
    2 to: 4
	do: 
	    [:n | 
	    (bestPoints at: n) position < x 
		ifTrue: 
		    [inferior ifTrue: [^n].
		    inferior := true]
		ifFalse: 
		    [superior ifTrue: [^n].
		    superior := true]]!

nextXValue
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    | d3 d2 x1 |
    x1 := (bestPoints at: 1) position.
    d2 := (bestPoints at: 2) position - x1.
    d3 := (bestPoints at: 3) position - x1.
    ^(d3 abs > d2 abs ifTrue: [d3] ifFalse: [d2]) * self class goldenSection 
	+ x1! !

!DhbOneVariableFunctionOptimizer methodsFor: 'operation'!

computeInitialValues
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    [bestPoints size > 3] whileTrue: [bestPoints removeLast].
    bestPoints size = 3 
	ifTrue: [self hasBracketingPoints ifFalse: [bestPoints removeLast]].
    bestPoints size < 3 
	ifTrue: [(DhbOptimizingBracketFinder forOptimizer: self) evaluate]!

evaluateIteration
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    self addPointAt: self nextXValue.
    bestPoints removeAtIndex: self indexOfOuterPoint.
    ^self computePrecision! !

!DhbOneVariableFunctionOptimizer methodsFor: 'transformation'!

reset
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    [bestPoints isEmpty] whileFalse: [bestPoints removeLast]! !




!DhbMultiVariableGeneralOptimizer methodsFor: 'initialization'!

origin
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/29/00 "

    ^result!

origin: anArrayOrVector 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/29/00 "

    result := anArrayOrVector!

range
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/29/00 "

    ^self bestPoints!

range: anArrayOrVector 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/29/00 "

    bestPoints := anArrayOrVector! !

!DhbMultiVariableGeneralOptimizer methodsFor: 'operation'!

computeInitialValues
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/29/00 "

    self range notNil ifTrue: [self performGeneticOptimization].
    self performSimplexOptimization!

evaluateIteration
    "(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/1/99 "

    | optimizer |
    optimizer := DhbHillClimbingOptimizer forOptimizer: self.
    optimizer
	desiredPrecision: desiredPrecision;
	maximumIterations: maximumIterations;
	initialValue: result.
    result := optimizer evaluate.
    ^optimizer precision!

finalizeIterations
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    !

performGeneticOptimization
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/29/00 "

    | optimizer manager |
    optimizer := DhbGeneticOptimizer forOptimizer: self.
    manager := DhbVectorChromosomeManager 
		new: 100
		mutation: 0.1
		crossover: 0.1.
    manager
	origin: self origin asVector;
	range: self range asVector.
    optimizer chromosomeManager: manager.
    result := optimizer evaluate!

performSimplexOptimization
    "Private - 
	(c) Copyrights Didier BESSET, 2000, all rights reserved. 
	Initial code: 2/29/00"

    | optimizer |
    optimizer := DhbSimplexOptimizer forOptimizer: self.
    optimizer
	desiredPrecision: desiredPrecision sqrt;
	maximumIterations: maximumIterations;
	initialValue: result asVector.
    result := optimizer evaluate! !




!DhbChromosomeManager class methodsFor: 'creation'!

new: anInteger mutation: aNumber1 crossover: aNumber2 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    ^(self new)
	populationSize: anInteger;
	rateOfMutation: aNumber1;
	rateOfCrossover: aNumber2;
	yourself! !

!DhbChromosomeManager methodsFor: 'creation'!

randomChromosome
    self subclassResponsibility! !

!DhbChromosomeManager methodsFor: 'information'!

isFullyPopulated
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    ^population size >= populationSize!

population
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    ^population! !

!DhbChromosomeManager methodsFor: 'initialization'!

populationSize: anInteger 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    populationSize := anInteger!

rateOfCrossover: aNumber 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    (aNumber between: 0 and: 1) 
	ifFalse: [self error: 'Illegal rate of cross-over'].
    rateOfCrossover := aNumber!

rateOfMutation: aNumber 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    (aNumber between: 0 and: 1) 
	ifFalse: [self error: 'Illegal rate of mutation'].
    rateOfMutation := aNumber! !

!DhbChromosomeManager methodsFor: 'operation'!

clone: aChromosome 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    ^aChromosome copy!

crossover: aChromosome1 and: aChromosome2 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    ^self subclassResponsibility!

mutate: aChromosome 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    ^self subclassResponsibility!

process: aChromosome1 and: aChromosome2 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    | roll |
    roll := Number random.
    roll < rateOfCrossover 
	ifTrue: [population addAll: (self crossover: aChromosome1 and: aChromosome2)]
	ifFalse: 
	    [roll < (rateOfCrossover + rateOfMutation) 
		ifTrue: 
		    [population
			add: (self mutate: aChromosome1);
			add: (self mutate: aChromosome2)]
		ifFalse: 
		    [population
			add: (self clone: aChromosome1);
			add: (self clone: aChromosome2)]]!

randomizePopulation
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    self reset.
    [self isFullyPopulated] 
	whileFalse: [population add: self randomChromosome]! !

!DhbChromosomeManager methodsFor: 'transformation'!

reset
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    population := OrderedCollection new: populationSize! !




!DhbHillClimbingOptimizer methodsFor: 'initialization'!

computeInitialValues
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 05-Jan-00 "

    unidimensionalFinder := DhbOneVariableFunctionOptimizer forOptimizer: self.
    unidimensionalFinder desiredPrecision: desiredPrecision.
    bestPoints := (1 to: result size) collect: 
		    [:n | 
		    (DhbVectorProjectedFunction function: functionBlock)
			direction: ((DhbVector new: result size)
				    atAllPut: 0;
				    at: n put: 1;
				    yourself);
			yourself]! !

!DhbHillClimbingOptimizer methodsFor: 'operation'!

evaluateIteration
    "(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/1/99 "

    | oldResult |
    precision := 1.00000000000000.
    bestPoints inject: result
	into: [:prev :each | self minimizeDirection: each from: prev].
    self shiftDirections.
    self minimizeDirection: bestPoints last.
    oldResult := result.
    result := bestPoints last origin.
    precision := 0.0.
    result with: oldResult
	do: 
	    [:x0 :x1 | 
	    precision := (self precisionOf: (x0 - x1) abs relativeTo: x0 abs) 
			max: precision].
    ^precision!

finalizeIterations
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    !

minimizeDirection: aVectorFunction 
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    ^unidimensionalFinder
	reset;
	setFunction: aVectorFunction;
	addPointAt: 0;
	addPointAt: precision;
	addPointAt: precision negated;
	evaluate!

minimizeDirection: aVectorFunction from: aVector 
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    ^aVectorFunction
	origin: aVector;
	argumentWith: (self minimizeDirection: aVectorFunction)!

shiftDirections
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    | position delta firstDirection |
    firstDirection := bestPoints first direction.
    bestPoints inject: nil
	into: 
	    [:prev :each | 
	    position isNil 
		ifTrue: [position := each origin]
		ifFalse: [prev direction: each direction].
	    each].
    position := bestPoints last origin - position.
    delta := position norm.
    delta > desiredPrecision 
	ifTrue: [bestPoints last direction: (position scaleBy: 1 / delta)]
	ifFalse: [bestPoints last direction: firstDirection]! !




!DhbGeneticOptimizer class methodsFor: 'information'!

defaultMaximumIterations
    "Private - Answers the default maximum number of iterations for newly created instances.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/1/99 "

    ^500!

defaultPrecision
    "Private - Answers the default precision for newly created instances.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/1/99 "

    ^0! !

!DhbGeneticOptimizer methodsFor: 'information'!

computePrecision
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    ^1!

randomIndex: aNumberArray 
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    | x n |
    x := Number random.
    n := 1.
    aNumberArray do: 
	    [:each | 
	    x < each ifTrue: [^n].
	    n := n + 1].
    ^aNumberArray size	"Never reached unless an error occurs"!

randomScale
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    | norm fBest fWorst answer |
    fBest := bestPoints first value.
    fWorst := bestPoints last value.
    norm := 1 / (fBest - fWorst).
    answer := bestPoints collect: [:each | (each value - fWorst) * norm].
    norm := 1 / (answer inject: 0 into: [:sum :each | each + sum]).
    fBest := 0.
    ^answer collect: 
	    [:each | 
	    fBest := each * norm + fBest.
	    fBest]! !

!DhbGeneticOptimizer methodsFor: 'initialization'!

chromosomeManager: aChromosomeManager 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    chromosomeManager := aChromosomeManager.
    ^self! !

!DhbGeneticOptimizer methodsFor: 'operation'!

collectPoints
    "Private - 
	(c) Copyrights Didier BESSET, 2000, all rights reserved. 
	Initial code: 23-Feb-00"

    | bestPoint |
    bestPoints isEmpty not ifTrue: [bestPoint := bestPoints removeFirst].
    bestPoints removeAll: bestPoints asArray.
    chromosomeManager population do: [:each | self addPointAt: each].
    bestPoint notNil ifTrue: [bestPoints add: bestPoint].
    result := bestPoints first position!

evaluateIteration
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    | randomScale |
    randomScale := self randomScale.
    chromosomeManager reset.
    [chromosomeManager isFullyPopulated] 
	whileFalse: [self processRandomParents: randomScale].
    self collectPoints.
    ^self computePrecision!

initializeIterations
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    chromosomeManager randomizePopulation.
    self collectPoints!

processRandomParents: aNumberArray 
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    chromosomeManager 
	process: (bestPoints at: (self randomIndex: aNumberArray)) position
	and: (bestPoints at: (self randomIndex: aNumberArray)) position! !




!DhbMaximizingPoint methodsFor: 'information'!

betterThan: anOptimizingPoint 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 04-Jan-00 "

    ^value > anOptimizingPoint value! !




!DhbSimplexOptimizer class methodsFor: 'information'!

defaultPrecision
    "Private - Answers the default precision for newly created instances.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/1/99 "

    ^DhbFloatingPointMachine new defaultNumericalPrecision * 1000! !

!DhbSimplexOptimizer methodsFor: 'display'!

printOn: aStream 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    super printOn: aStream.
    aStream cr.
    worstVector printOn: aStream! !

!DhbSimplexOptimizer methodsFor: 'initialization'!

computeInitialValues
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    bestPoints 
	add: (optimizingPointClass vector: result function: functionBlock).
    self buildInitialSimplex.
    worstVector := bestPoints removeLast position! !

!DhbSimplexOptimizer methodsFor: 'operation'!

buildInitialSimplex
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    | projectedFunction finder partialResult |
    projectedFunction := DhbProjectedOneVariableFunction 
		function: functionBlock.
    finder := DhbOneVariableFunctionOptimizer forOptimizer: self.
    finder setFunction: projectedFunction.
    [bestPoints size < (result size + 1)] whileTrue: 
	    [projectedFunction
		setArgument: result;
		bumpIndex.
	    partialResult := finder
			reset;
			evaluate.
	    bestPoints add: (optimizingPointClass 
			vector: (projectedFunction argumentWith: partialResult)
			function: functionBlock)]!

computePrecision
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 1/16/00 "

    | functionValues bestFunctionValue |
    functionValues := bestPoints collect: [:each | each value].
    bestFunctionValue := functionValues removeFirst.
    ^functionValues inject: 0
	into: 
	    [:max :each | 
	    (self precisionOf: (each - bestFunctionValue) abs
		relativeTo: bestFunctionValue abs) max: max]!

contract
    "Private - Contract the Simplex around the best Vector.
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 1/16/00 "

    | bestVector oldVectors |
    bestVector := bestPoints first position.
    oldVectors := OrderedCollection with: worstVector.
    [bestPoints size > 1] 
	whileTrue: [oldVectors add: bestPoints removeLast position].
    oldVectors do: [:each | self contract: each around: bestVector].
    worstVector := bestPoints removeLast position.
    ^self computePrecision!

contract: aVector around: bestVector 
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 1/16/00 "

    bestPoints 
	add: (optimizingPointClass vector: bestVector * 0.5 + (aVector * 0.5)
		function: functionBlock)!

evaluateIteration
    "(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/1/99 "

    | centerOfGravity newPoint nextPoint |
    centerOfGravity := (bestPoints inject: ((worstVector copy)
			atAllPut: 0;
			yourself)
		into: [:sum :each | each position + sum]) * (1 / bestPoints size).
    newPoint := optimizingPointClass vector: 2 * centerOfGravity - worstVector
		function: functionBlock.
    (newPoint betterThan: bestPoints first) 
	ifTrue: 
	    [nextPoint := optimizingPointClass 
			vector: newPoint position * 2 - centerOfGravity
			function: functionBlock.
	    (nextPoint betterThan: newPoint) ifTrue: [newPoint := nextPoint]]
	ifFalse: 
	    [newPoint := optimizingPointClass 
			vector: centerOfGravity * 666667 + (worstVector * 333333)
			function: functionBlock.
	    (newPoint betterThan: bestPoints first) ifFalse: [^self contract]].
    worstVector := bestPoints removeLast position.
    bestPoints add: newPoint.
    result := bestPoints first position.
    ^self computePrecision! !




!DhbVectorProjectedFunction methodsFor: 'display'!

printOn: aStream 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    self origin printOn: aStream.
    aStream nextPutAll: ' ('.
    self direction printOn: aStream.
    aStream nextPut: $)! !

!DhbVectorProjectedFunction methodsFor: 'information'!

argumentWith: aNumber 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    ^aNumber * self direction + self origin!

direction
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    ^index!

origin
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    ^argument! !

!DhbVectorProjectedFunction methodsFor: 'initialization'!

direction: aVector 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    index := aVector!

origin: aVector 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    argument := aVector! !




!DhbOptimizingBracketFinder class methodsFor: 'creation'!

initialPoints: aSortedCollection function: aFunction 
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    ^(super new)
	setInitialPoints: aSortedCollection;
	setFunction: aFunction! !

!DhbOptimizingBracketFinder methodsFor: 'initialization'!

initializeForOptimizer: aFunctionOptimizer 
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    super initializeForOptimizer: aFunctionOptimizer.
    bestPoints := aFunctionOptimizer bestPoints.
    ^self!

setInitialPoints: aSortedCollection 
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    bestPoints := aSortedCollection! !

!DhbOptimizingBracketFinder methodsFor: 'operation'!

computeInitialValues
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    [bestPoints size < 2] whileTrue: [self addPointAt: Number random]!

evaluateIteration
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    | x1 x2 |
    x1 := (bestPoints at: 1) position.
    x2 := (bestPoints at: 2) position.
    self addPointAt: x1 * 3 - (x2 * 2).
    precision := (x2 - x1) * ((bestPoints at: 3) position - x1).
    self hasConverged ifFalse: [bestPoints removeLast].
    ^precision!

finalizeIterations
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

    result := bestPoints! !




!DhbVectorChromosomeManager methodsFor: 'creation'!

randomChromosome
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    ^((1 to: origin size) collect: [:n | self randomComponent: n]) asVector! !

!DhbVectorChromosomeManager methodsFor: 'information'!

randomComponent: anInteger 
    "Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    ^(range at: anInteger) asFloatD random + (origin at: anInteger)! !

!DhbVectorChromosomeManager methodsFor: 'initialization'!

origin: aVector 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    origin := aVector!

range: aVector 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    range := aVector! !

!DhbVectorChromosomeManager methodsFor: 'operation'!

crossover: aChromosome1 and: aChromosome2 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    | index new1 new2 |
    index := (aChromosome1 size - 1) random + 2.
    new1 := self clone: aChromosome1.
    new1 
	replaceFrom: index
	to: new1 size
	with: aChromosome2
	startingAt: index.
    new2 := self clone: aChromosome2.
    new2 
	replaceFrom: index
	to: new2 size
	with: aChromosome1
	startingAt: index.
    ^Array with: new1 with: new2!

mutate: aVector 
    "(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "

    | index |
    index := aVector size random + 1.
    ^(aVector copy)
	at: index put: (self randomComponent: index);
	yourself! !



