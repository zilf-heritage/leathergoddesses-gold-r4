

	.FUNCT	JOES-BAR-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"An undistinguished bar, yet the social center of Upper Sandusky. The front door is almost lost amidst the hazy maze of neon that shrouds the grimy glass of the south wall. "
	PRINT	DOORS-MARKED
	RTRUE	


	.FUNCT	BAR-DOOR-F
	EQUAL?	PRSA,V?ENTER \?CCL3
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?CCL3:	EQUAL?	PRSA,V?CLOSE,V?OPEN \?CCL5
	PRINTR	"It's a swinging door."
?CCL5:	EQUAL?	PRSA,V?LOOK-INSIDE \FALSE
	ICALL2	PERFORM-PRSA,WINDOW
	RTRUE	


	.FUNCT	BAR-F
	EQUAL?	PRSA,V?DISEMBARK,V?EXIT,V?LEAVE \?CCL3
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?CCL3:	EQUAL?	PRSA,V?BOARD,V?WALK-TO,V?ENTER \?CCL5
	PRINT	LOOK-AROUND
	RTRUE	
?CCL5:	EQUAL?	PRSA,V?EXAMINE \?CCL7
	CALL1	V-LOOK
	RSTACK	
?CCL7:	EQUAL?	PRSA,V?SEARCH \FALSE
	PRINT	NOTHING-NEW
	RTRUE	


	.FUNCT	JOE-F
	EQUAL?	PRSA,V?TELL /?CTR2
	EQUAL?	PRSA,V?ASK-FOR \?CCL3
	EQUAL?	PRSI,BEER \?CCL3
?CTR2:	PRINTI	"""You've had enough."""
	CRLF	
	CALL1	STOP
	RSTACK	
?CCL3:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"Joe is bartending."


	.FUNCT	BEER-F
	EQUAL?	PRSA,V?BUY \FALSE
	EQUAL?	HERE,JOES-BAR \FALSE
	PRINTI	"The bartender"
	CALL2	RUNNING?,I-URGE
	ZERO?	STACK /?CND6
	PRINTI	", a keen judge of bladders,"
?CND6:	PRINTI	" says, "
	ICALL	PERFORM,V?TELL,JOE
	RTRUE	


	.FUNCT	GARMENT-F
	CALL	WRONG-SEX-WORD,GARMENT,W?LOINCLOTH,W?BIKINI
	ZERO?	STACK /?CCL3
	CALL1	STOP
	RSTACK	
?CCL3:	EQUAL?	PRSA,V?EXAMINE \?CCL5
	FSET?	CELL,TOUCHBIT \?CCL5
	PRINTI	"The "
	ICALL2	DPRINT,GARMENT
	PRINTR	", tight but comfy, covers only the ""bare essentials."""
?CCL5:	EQUAL?	PRSA,V?LOOK-INSIDE \?CCL9
	PRINTI	"1. You
2. A "
	ICALL2	DPRINT,COMIC-BOOK
	CRLF	
	RTRUE	
?CCL9:	EQUAL?	PRSA,V?TAKE-OFF /?CCL11
	EQUAL?	PRSA,V?TAKE \FALSE
	ZERO?	GONE-APE /FALSE
?CCL11:	PRINTI	"But"
	ICALL2	TPRINT,GARMENT
	FSET?	GARMENT,PLURALBIT \?CCL18
	PRINTI	" are"
	JUMP	?CND16
?CCL18:	PRINTI	" is"
?CND16:	PRINTR	" so becoming!"


	.FUNCT	POCKET-F
	EQUAL?	PRSA,V?LOOK-INSIDE \?CCL3
	PRINTI	"There's"
	ICALL2	APRINT,COMIC-BOOK
	PRINTR	" there."
?CCL3:	EQUAL?	PRSA,V?PUT \FALSE
	EQUAL?	PRSI,POCKET \FALSE
	PRINTI	"There's no room. "
	ICALL	PERFORM,V?LOOK-INSIDE,POCKET
	RTRUE	


	.FUNCT	COMIC-BOOK-F
	EQUAL?	PRSA,V?BURN,V?TAKE,V?REMOVE \?CCL3
	EQUAL?	PRSO,COMIC-BOOK \?CCL3
	PRINTI	"You change your mind and"
	PRINT	STICK-IT-IN-POCKET
	PRINTR	" instead."
?CCL3:	EQUAL?	PRSA,V?OPEN,V?LOOK-INSIDE,V?READ \FALSE
	FSET?	CELL,TOUCHBIT \?CCL10
	PRINTI	"""Hello, Prisoner!
   You are a captive of "
	PRINTD	LGOP
	PRINTI	". As an experimental subject, your unspeakably painful death will help our effort to enslave humanity and turn the Earth into our private pleasure world. Consider this to be a great honor, human.""
   The remainder of the book covers the exacting rules of behavior expected of a prisoner of "
	PRINTD	LGOP
	PRINTI	". For example, it mentions that escapees will be killed immediately and painfully by crack Leckbandi guards."
	JUMP	?CND8
?CCL10:	ICALL2	IN-YOUR-PACKAGE,STR?207
?CND8:	PRINTI	" After reading it, you"
	PRINT	STICK-IT-IN-POCKET
	PRINT	PERIOD-CR
	RTRUE	


	.FUNCT	FLASHLIGHT-F
	EQUAL?	PRSA,V?LOOK-INSIDE,V?OPEN \?CCL3
	PRINTI	"The "
	PRINTD	FLASHLIGHT
	PRINTR	" has rusted shut."
?CCL3:	EQUAL?	PRSA,V?POINT \FALSE
	FSET?	FLASHLIGHT,ONBIT \FALSE
	ZERO?	PRSI /FALSE
	PRINT	NOTHING-NEW
	RTRUE	


	.FUNCT	MENS-ROOM-ENTER-F
	ZERO?	SEX-CHOSEN \?CCL3
	SET	'SEX-CHOSEN,TRUE-VALUE
	SET	'MALE,TRUE-VALUE
	MOVE	STOOL,MENS-ROOM
	FSET	SULTANS-WIFE,FEMALEBIT
	FSET	HAREM-GUARD,FEMALEBIT
	FSET	YOUNG-WOMAN,FEMALEBIT
	PUTP	SIDEKICK,P?SDESC,STR?209
	PUTP	SIDEKICKS-BODY,P?SDESC,STR?210
	PUTP	SPLATTERED-SIDEKICK,P?SDESC,STR?211
	PUTP	THORBAST,P?SDESC,STR?212
	PUTP	THORBAST-SWORD,P?SDESC,STR?213
	PUTP	SULTAN,P?SDESC,STR?214
	PUTP	YOUNG-WOMAN,P?SDESC,STR?215
	PUTP	PHOTO,P?SDESC,STR?216
	PUTP	HAREM,P?ODOR,STR?217
	RETURN	MENS-ROOM
?CCL3:	ZERO?	MALE /?CCL5
	RETURN	MENS-ROOM
?CCL5:	PRINTD	MENS-ROOM
	ICALL2	WRONG-BATHROOM,STR?218
	RFALSE	


	.FUNCT	LADIES-ROOM-ENTER-F
	ZERO?	SEX-CHOSEN \?CCL3
	SET	'SEX-CHOSEN,TRUE-VALUE
	MOVE	STOOL,LADIES-ROOM
	FSET	ME,FEMALEBIT
	FSET	SULTAN,FEMALEBIT
	FSET	SIDEKICK,FEMALEBIT
	FSET	THORBAST,FEMALEBIT
	PUTP	SIDEKICK,P?SDESC,STR?219
	PUTP	SIDEKICKS-BODY,P?SDESC,STR?220
	PUTP	SPLATTERED-SIDEKICK,P?SDESC,STR?221
	PUTP	THORBAST,P?SDESC,STR?222
	PUTP	THORBAST-SWORD,P?SDESC,STR?223
	PUTP	SULTAN,P?SDESC,STR?224
	PUTP	YOUNG-WOMAN,P?SDESC,STR?225
	PUTP	PHOTO,P?SDESC,STR?226
	PUTP	HAREM,P?ODOR,STR?227
	RETURN	LADIES-ROOM
?CCL3:	ZERO?	MALE /?CCL5
	PRINTD	LADIES-ROOM
	ICALL2	WRONG-BATHROOM,STR?228
	RFALSE	
?CCL5:	RETURN	LADIES-ROOM


	.FUNCT	WRONG-BATHROOM,STRING
	PRINTI	"
   As you enter the wrong bathroom, a "
	PRINT	STRING
	PRINTI	". You hustle out.

"
	CALL1	DESCRIBE-ROOM
	RSTACK	


	.FUNCT	BATHROOM-F,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTI	"This filthy bathroom belies the existence of disinfectant. A single toilet and sink are the only fixtures. More breathable air can be found to the south"
	EQUAL?	HERE,MENS-ROOM \?CCL6
	PRINTI	"ea"
	JUMP	?CND4
?CCL6:	PRINTI	"we"
?CND4:	PRINTI	"st."
	RTRUE	
?CCL3:	EQUAL?	RARG,M-SMELL \FALSE
	ICALL2	THIS-IS-IT,PIZZA
	MOVE	PIZZA,HERE
	PRINTI	"You trace the smell to"
	ICALL2	APRINT,PIZZA
	PRINTI	", crumpled in the corner. [Incidentally, we had some pretty putrid scents available, all of which would've seemed right at home in a filthy restroom. In the end, we were too kind to use them -- but we were sorely tempted!]"
	RTRUE	


	.FUNCT	MENS-ROOM-OBJECT-F
	EQUAL?	PRSA,V?ENTER,V?FIND \?CCL3
	EQUAL?	HERE,JOES-BAR \?CCL6
	CALL2	DO-WALK,P?NW
	RSTACK	
?CCL6:	PRINT	LOOK-AROUND
	RTRUE	
?CCL3:	EQUAL?	PRSA,V?WALK-TO \?CCL8
	EQUAL?	HERE,JOES-BAR \?CCL11
	CALL2	DO-WALK,P?NW
	RSTACK	
?CCL11:	EQUAL?	HERE,MENS-ROOM \FALSE
	CALL1	V-PEE
	RSTACK	
?CCL8:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE,V?EXIT \?CCL15
	EQUAL?	HERE,MENS-ROOM \?CCL18
	CALL2	DO-WALK,P?SE
	RSTACK	
?CCL18:	PRINT	LOOK-AROUND
	RTRUE	
?CCL15:	EQUAL?	PRSA,V?LOOK-INSIDE \?CCL20
	EQUAL?	HERE,MENS-ROOM \?CCL23
	PRINT	LOOK-AROUND
	RTRUE	
?CCL23:	PRINT	CANT-FROM-HERE
	RTRUE	
?CCL20:	EQUAL?	PRSA,V?SEARCH \?CCL25
	PRINT	NOTHING-NEW
	RTRUE	
?CCL25:	EQUAL?	PRSA,V?USE \?CCL27
	EQUAL?	HERE,JOES-BAR \?CCL30
	PRINT	LOOK-AROUND
	RTRUE	
?CCL30:	CALL1	V-PEE
	RSTACK	
?CCL27:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"Filthy."


	.FUNCT	LADIES-ROOM-OBJECT-F
	EQUAL?	PRSA,V?ENTER,V?FIND \?CCL3
	EQUAL?	HERE,JOES-BAR \?CCL6
	CALL2	DO-WALK,P?NE
	RSTACK	
?CCL6:	PRINT	LOOK-AROUND
	RTRUE	
?CCL3:	EQUAL?	PRSA,V?WALK-TO \?CCL8
	EQUAL?	HERE,JOES-BAR \?CCL11
	CALL2	DO-WALK,P?NE
	RSTACK	
?CCL11:	EQUAL?	HERE,LADIES-ROOM \FALSE
	CALL1	V-PEE
	RSTACK	
?CCL8:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE,V?EXIT \?CCL15
	EQUAL?	HERE,LADIES-ROOM \?CCL18
	CALL2	DO-WALK,P?SW
	RSTACK	
?CCL18:	PRINT	LOOK-AROUND
	RTRUE	
?CCL15:	EQUAL?	PRSA,V?LOOK-INSIDE \?CCL20
	EQUAL?	HERE,LADIES-ROOM \?CCL23
	PRINT	LOOK-AROUND
	RTRUE	
?CCL23:	PRINT	CANT-FROM-HERE
	RTRUE	
?CCL20:	EQUAL?	PRSA,V?SEARCH \?CCL25
	PRINT	NOTHING-NEW
	RTRUE	
?CCL25:	EQUAL?	PRSA,V?EXAMINE,V?USE \FALSE
	ICALL2	PERFORM-PRSA,MENS-ROOM-OBJECT
	RTRUE	


	.FUNCT	GENERIC-RESTROOM-F
	EQUAL?	PRSA,V?ENTER,V?FIND,V?WALK-TO \?CCL3
	EQUAL?	HERE,JOES-BAR \?CCL3
	PRINT	DOORS-MARKED
	CRLF	
	RETURN	NOT-HERE-OBJECT
?CCL3:	EQUAL?	PRSA,V?WALK-TO \?CCL7
	ICALL1	V-PEE
	RETURN	NOT-HERE-OBJECT
?CCL7:	ZERO?	SEX-CHOSEN /FALSE
	ZERO?	MALE \?CTR11
	RETURN	LADIES-ROOM-OBJECT
?CTR11:	RETURN	MENS-ROOM-OBJECT


	.FUNCT	TOILET-F
	EQUAL?	PRSA,V?USE,V?PEE-IN \?CCL3
	CALL1	V-PEE
	RSTACK	
?CCL3:	EQUAL?	PRSA,V?CLOSE \?CCL5
	CALL1	NO-LID
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?FLUSH \?CCL7
	PRINTR	"Probably the first fresh water to enter this john in a month."
?CCL7:	EQUAL?	PRSA,V?EXAMINE,V?LOOK-INSIDE \FALSE
	PRINT	YECHH
	RTRUE	


	.FUNCT	SINK-F
	EQUAL?	PRSA,V?EXAMINE,V?LOOK-INSIDE \FALSE
	ICALL	PERFORM,V?EXAMINE,TOILET
	RTRUE	


	.FUNCT	STOOL-F
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	FSET?	STOOL,TOUCHBIT /?CCL3
	PRINTR	"It's safe to take, if you receive my meaning."
?CCL3:	EQUAL?	PRSA,V?CLIMB,V?BOARD \FALSE
	FIRST?	STOOL \?CCL10
	CALL	DO-FIRST,STR?230,STOOL
	RSTACK	
?CCL10:	IN?	PROTAGONIST,TREE-HOLE \FALSE
	MOVE	PROTAGONIST,HERE
	SET	'OHERE,FALSE-VALUE
	PRINTI	"Using the stool, you"
	ICALL2	AND-SIDEKICK,HERE
	PRINTR	" climb out of the hole."


	.FUNCT	I-URGE
	ICALL	QUEUE,I-URGE,-1
	INC	'URGE-COUNTER
	PRINTI	"   "
	EQUAL?	URGE-COUNTER,1 \?CCL3
	PRINTR	"You feel an urge."
?CCL3:	EQUAL?	URGE-COUNTER,2 \?CCL5
	PRINTR	"You trace the urge to the region of your bladder."
?CCL5:	EQUAL?	URGE-COUNTER,3 \?CCL7
	PRINTI	"Though operating at far below normal speed, your mind begins to conclude that it would be best at this point to "
	EQUAL?	HERE,MENS-ROOM,LADIES-ROOM \?CCL10
	PRINTI	"use the"
	JUMP	?CND8
?CCL10:	PRINTI	"find a"
?CND8:	PRINTR	" bathroom."
?CCL7:	EQUAL?	URGE-COUNTER,4 \?CCL12
	PRINTR	"Even if you don't care about your clothes, imagine the embarrassment!"
?CCL12:	PRINT	YOU-CANT
	PRINTI	"wait another second. "
	EQUAL?	HERE,MENS-ROOM,LADIES-ROOM \?CCL15
	ICALL	QUEUE,I-KIDNAPPING,3
	ICALL2	DEQUEUE,I-URGE
	MOVE	PROTAGONIST,HERE
	SET	'OHERE,FALSE-VALUE
	PRINTI	"Fortunately, you've stumbled upon a bathroom. A moment later, you are feeling much better, although your thigh muscles are still quivering a tad."
	CALL1	NOTICE-PIZZA-ODOR
	RSTACK	
?CCL15:	PRINTI	"Without going into embarrassing detail, you've made a mess. A moment later, before even half the people in Joe's have begun tittering, a flash of green light precedes the arrival of two VERY odd patrons. They rotate their bellies to get a better look at you. As their mouth stalks open you find that, despite an evolution that occurred dozens of astronomical units from Upper Sandusky, these fellows speak in perfect midwestern English.
   ""This one?""
   ""A pitiful specimen ... can't even control simple bodily functions ... the tests would be worthless...""
   ""Agreed. Must've been a screw-up somewhere. Let's take this one instead.""
   They grab a blonde woman, whose scream is cut short by another green flash. Three weeks later, when the Earth is invaded and everyone is enslaved by "
	PRINTD	LGOP
	PRINTI	", you wonder if there was a connection."
	CRLF	
	CALL1	FINISH
	RSTACK	


	.FUNCT	PIZZA-F
	EQUAL?	PRSA,V?TAKE,V?TASTE,V?EAT \FALSE
	FSET	PIZZA,TOUCHBIT
	PRINTI	"The very thought is enough to make stronger "
	ZERO?	MALE \?CND4
	PRINTI	"wo"
?CND4:	PRINTI	"men than yourself "
	ZERO?	NAUGHTY-LEVEL \?CCL8
	PRINTI	"become quite ill"
	JUMP	?CND6
?CCL8:	EQUAL?	NAUGHTY-LEVEL,1 \?CCL10
	PRINTI	"vomit"
	JUMP	?CND6
?CCL10:	PRINTI	"puke their guts out"
?CND6:	PRINT	PERIOD-CR
	RTRUE	


	.FUNCT	NOTICE-PIZZA-ODOR
	FSET?	NOSE,MUNGBIT /FALSE
	ICALL2	THIS-IS-IT,ODOR
	CRLF	
	PRINTR	"   Now that the ""crisis"" has passed, you notice a strong and familiar odor pervading the room."


	.FUNCT	I-KIDNAPPING
	IN?	PROTAGONIST,STOOL \?CND1
	MOVE	STOOL,CELL
?CND1:	MOVE	PROTAGONIST,HERE
	SET	'OHERE,FALSE-VALUE
	ZERO?	MALE /?CCL5
	PUTP	GARMENT,P?SDESC,STR?231
	JUMP	?CND3
?CCL5:	PUTP	GARMENT,P?SDESC,STR?232
?CND3:	PUTP	COMIC-BOOK,P?SDESC,STR?233
	FCLEAR	GARMENT,NARTICLEBIT
	FCLEAR	GARMENT,VOWELBIT
	FCLEAR	GARMENT,PLURALBIT
	ICALL	ROB,PROTAGONIST,CELL
	MOVE	GARMENT,PROTAGONIST
	MOVE	COMIC-BOOK,PROTAGONIST
	ICALL	INCREMENT-SCORE,1,7
	ZERO?	VERBOSITY /?CND6
	PRINTI	"   A brilliant flash of green light seems less unusual when followed by the appearance of tentacled aliens, as is the case with the current flash of green light. The tentacles wrap roughly around you as you faint.
   After an unknown amount of time... Well, let's "
	ZERO?	NAUGHTY-LEVEL \?CCL10
	PRINTI	"be frank"
	JUMP	?CND8
?CCL10:	PRINTI	"cut the "
	EQUAL?	NAUGHTY-LEVEL,1 \?CCL13
	PRINTI	"crap"
	JUMP	?CND8
?CCL13:	PRINTI	"bullshit"
?CND8:	PRINTI	". 7.3 hours later, you wake. Your head feels as if it's been run over by several locomotives, or at least one very large locomotive, and your clothes are now unrecognizable"
	PRINT	ELLIPSIS
?CND6:	ICALL2	GOTO,CELL
	CALL2	CELL-F,M-END
	RSTACK	

	.ENDI