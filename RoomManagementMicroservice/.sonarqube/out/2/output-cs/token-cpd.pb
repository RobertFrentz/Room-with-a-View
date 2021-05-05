˜E
ÖC:\Users\alexg\Documents\GitHub\Room-with-a-View\RoomManagementMicroservice\RoomManagementMicroservice\Controllers\RoomsController.cs
	namespace 	&
RoomManagementMicroservice
 $
.$ %
Controllers% 0
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
RoomsController  
:! "
ControllerBase# 1
{ 
private 
readonly 
IRoomsRepository )
_repository* 5
;5 6
private 
readonly 

HttpClient #
client$ *
;* +
private 
readonly 
string *
usersManagementMicroserviceUri  >
=? @
$strA g
;g h
[ 	)
ActivatorUtilitiesConstructor	 &
]& '
public 
RoomsController 
( 
IRoomsRepository /

repository0 :
): ;
{ 	
_repository 
= 

repository $
;$ %
client 
= 
new 

HttpClient #
(# $
)$ %
;% &
} 	
public 
RoomsController 
( 
)  
{ 	
client   
=   
new   

HttpClient   #
(  # $
)  $ %
;  % &
}!! 	
["" 	
HttpGet""	 
]"" 
public$$ 
async$$ 
Task$$ 
<$$ 
IActionResult$$ '
>$$' (
GetRoomsAsync$$) 6
($$6 7
)$$7 8
{%% 	
IEnumerable&& 
<&& 
RoomDescriptionDto&& *
>&&* +
result&&, 2
=&&3 4
await&&5 :
_repository&&; F
.&&F G
GetRoomsAsync&&G T
(&&T U
)&&U V
;&&V W
if'' 
('' 
!'' 
result'' 
.'' 
Any'' 
('' 
)'' 
)'' 
{(( 
return)) 
NotFound)) 
())  
new))  #
Error))$ )
())) *
$str))* 4
)))4 5
)))5 6
;))6 7
}** 
return,, 
Ok,, 
(,, 
result,, 
),, 
;,, 
}-- 	
[// 	
Route//	 
(// 
$str// 
)// 
]// 
[00 	
HttpGet00	 
]00 
public11 
async11 
Task11 
<11 
IActionResult11 '
>11' (
VerifyAuthorization11) <
(11< =
string11= C
authorizationToken11D V
)11V W
{22 	
client33 
.33 !
DefaultRequestHeaders33 (
.33( )
Add33) ,
(33, -
$str33- A
,33A B
authorizationToken33C U
)33U V
;33V W
var44 !
responseAuthorization44 %
=44& '
await44( -
client44. 4
.444 5
GetAsync445 =
(44= >*
usersManagementMicroserviceUri44> \
+44] ^
$str44_ n
)44n o
;44o p
if55 
(55 !
responseAuthorization55 %
.55% &

StatusCode55& 0
==551 3
System554 :
.55: ;
Net55; >
.55> ?
HttpStatusCode55? M
.55M N
Unauthorized55N Z
)55Z [
{66 
return77 
Unauthorized77 #
(77# $!
responseAuthorization77$ 9
.779 :
Content77: A
.77A B
ReadAsStringAsync77B S
(77S T
)77T U
.77U V
Result77V \
)77\ ]
;77] ^
}88 
return99 
Ok99 
(99 !
responseAuthorization99 +
.99+ ,
Content99, 3
.993 4
ReadAsStringAsync994 E
(99E F
)99F G
.99G H
Result99H N
)99N O
;99O P
}:: 	
[;; 	
HttpGet;;	 
(;; 
$str;; 
);;  
];;  !
public== 
async== 
Task== 
<== 
IActionResult== '
>==' ( 
GetRoomByNumberAsync==) =
(=== >
int==> A

roomNumber==B L
,==L M
[==N O

FromHeader==O Y
]==Y Z
string==[ a
authorizationToken==b t
)==t u
{>> 	
var?? 
verify?? 
=?? 
await?? 
VerifyAuthorization?? 0
(??0 1
authorizationToken??1 C
)??C D
;??D E
if@@ 
(@@ 
verify@@ 
is@@ $
UnauthorizedObjectResult@@ 1
)@@1 2
{AA 
returnBB 
verifyBB 
;BB 
}CC 
RoomDescriptionDtoDD 
resultDD %
=DD& '
awaitDD( -
_repositoryDD. 9
.DD9 : 
GetRoomByNumberAsyncDD: N
(DDN O

roomNumberDDO Y
)DDY Z
;DDZ [
ifEE 
(EE 
resultEE 
==EE 
nullEE 
)EE 
{FF 
returnGG 
NotFoundGG 
(GG  
newGG  #
ErrorGG$ )
(GG) *
$strGG* U
)GGU V
)GGV W
;GGW X
}HH 
returnII 
OkII 
(II 
JsonConvertII !
.II! "
SerializeObjectII" 1
(II1 2
newII2 5
{JJ 
roomKK 
=KK 
resultKK 
}LL 
)LL 
)LL 
;LL 
}MM 	
[NN 	
RouteNN	 
(NN 
$strNN 
)NN 
]NN 
[OO 	
HttpPostOO	 
]OO 
publicQQ 
asyncQQ 
TaskQQ 
<QQ 
IActionResultQQ '
>QQ' (
PostRoomAsyncQQ) 6
(QQ6 7
[QQ7 8
FromBodyQQ8 @
]QQ@ A
PostRoomDtoQQB M
	roomToAddQQN W
,QQX Y
[QQZ [

FromHeaderQQ[ e
]QQe f
stringQQg m
authorizationToken	QQn Ä
)
QQÄ Å
{RR 	
varSS 
verifySS 
=SS 
awaitSS 
VerifyAuthorizationSS 2
(SS2 3
authorizationTokenSS3 E
)SSE F
;SSF G
ifTT 
(TT 
verifyTT 
isTT $
UnauthorizedObjectResultTT 2
)TT2 3
{UU 
returnVV 
verifyVV 
;VV 
}WW 
awaitXX 
_repositoryXX 
.XX 
AddRoomAsyncXX *
(XX* +
	roomToAddXX+ 4
)XX4 5
;XX5 6
returnYY 
CreatedAtActionYY "
(YY" #
$strYY# ,
,YY, -
	roomToAddYY. 7
)YY7 8
;YY8 9
}ZZ 	
[\\ 	
	HttpPatch\\	 
(\\ 
$str\\ !
)\\! "
]\\" #
public]] 
async]] 
Task]] 
<]] 
IActionResult]] '
>]]' (
UpdateRoomAsync]]) 8
(]]8 9
int]]9 <

roomNumber]]= G
,]]G H
[]]I J
FromBody]]J R
]]]R S
PatchRoomDto]]T `
patchRoomDto]]a m
,]]n o
[]]p q

FromHeader]]q {
]]]{ |
string	]]} É 
authorizationToken
]]Ñ ñ
)
]]ñ ó
{^^ 	
var__ 
verify__ 
=__ 
await__ 
VerifyAuthorization__ 2
(__2 3
authorizationToken__3 E
)__E F
;__F G
if`` 
(`` 
verify`` 
is`` $
UnauthorizedObjectResult`` 2
)``2 3
{aa 
returnbb 
verifybb 
;bb 
}cc 
vardd 
resultdd 
=dd 
awaitdd 
_repositorydd *
.dd* +
UpdateAsyncdd+ 6
(dd6 7

roomNumberdd7 A
,ddA B
patchRoomDtoddB N
)ddN O
;ddO P
ifee 
(ee 
resultee 
==ee 
-ee 
$numee 
)ee 
{ff 
returngg 
NotFoundgg 
(gg  
newgg  #
Errorgg$ )
(gg) *
$"gg* ,!
The room with number gg, A
{ggA B

roomNumberggB L
}ggL M
 was not found.ggM \
"gg\ ]
)gg] ^
)gg^ _
;gg_ `
}hh 
returnii 
	NoContentii 
(ii 
)ii 
;ii 
}kk 	
}ll 
}mm á!
zC:\Users\alexg\Documents\GitHub\Room-with-a-View\RoomManagementMicroservice\RoomManagementMicroservice\Data\DataContext.cs
	namespace 	&
RoomManagementMicroservice
 $
.$ %
Data% )
{ 
public 

class 
DataContext 
: 
	DbContext (
{ 
public		 
DataContext		 
(		 
DbContextOptions		 +
options		, 3
)		3 4
:		5 6
base		7 ;
(		; <
options		< C
)		C D
{

 	
} 	
public 
DbSet 
< 
Room 
> 
Rooms  
{! "
get# &
;& '
set( +
;+ ,
}- .
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
modelBuilder 
. 
Entity 
<  
Room  $
>$ %
(% &
)& '
.' (
Property( 0
(0 1
$str1 5
)5 6
.6 7
ValueGeneratedOnAdd7 J
(J K
)K L
;L M
modelBuilder 
. 
Entity 
<  
Room  $
>$ %
(% &
)& '
. 
HasData  
(  !
new! $
List% )
<) *
Room* .
>. /
(/ 0
)0 1
{ 
new 
Room  
{ 
Id 
=  
$num! "
," #
RoomCategory (
=) *
$str+ 5
,5 6

RoomNumber &
=' (
$num) ,
,, -
PersonsNumber )
=* +
$num, -
,- .
Price !
=" #
$num$ '
,' (
Description '
=' (
$str( 0
,0 1

Facilities &
=' (
$str) 5
,5 6
State   !
=  " #
$str  $ /
}!! 
,!! 
new"" 
Room""  
{## 
Id$$ 
=$$  
$num$$! "
,$$" #
RoomCategory%% (
=%%) *
$str%%+ 5
,%%5 6

RoomNumber&& &
=&&' (
$num&&) ,
,&&, -
PersonsNumber'' )
=''* +
$num'', -
,''- .
Price(( !
=((" #
$num(($ '
,((' (
Description)) '
=))( )
$str))* 2
,))2 3

Facilities** &
=**' (
$str**) 5
,**5 6
State++ !
=++" #
$str++$ ,
,++, -
},, 
,,, 
new-- 
Room--  
{.. 
Id// 
=// 
$num//  
,//  !
RoomCategory00 (
=00) *
$str00+ 5
,005 6

RoomNumber11 &
=11' (
$num11) ,
,11, -
PersonsNumber22 )
=22* +
$num22, -
,22- .
Price33 !
=33" #
$num33$ '
,33' (
Description44 '
=44( )
$str44* 2
,442 3

Facilities55 &
=55' (
$str55) 5
,555 6
State66 !
=66" #
$str66$ ,
}77 
,77 
new88 
Room88 
{99 
Id:: 
=:: 
$num:: 
,:: 
RoomCategory;; 
=;; 
$str;; )
,;;) *

RoomNumber<< 
=<< 
$num<<  
,<<  !
PersonsNumber== 
=== 
$num==  !
,==! "
Price>> 
=>> 
$num>> 
,>> 
Description?? 
=?? 
$str?? &
,??& '

Facilities@@ 
=@@ 
$str@@ )
,@@) *
StateAA 
=AA 
$strAA  
,AA  !
}BB 
}BB 
)BB 
;BB 
}DD 	
}EE 
}FF ¢	
C:\Users\alexg\Documents\GitHub\Room-with-a-View\RoomManagementMicroservice\RoomManagementMicroservice\Data\IRoomsRepository.cs
	namespace 	&
RoomManagementMicroservice
 $
.$ %
Data% )
{ 
public 

	interface 
IRoomsRepository %
{ 
Task

 
<

 
IEnumerable

 
<

 
RoomDescriptionDto

 +
>

+ ,
>

, -
GetRoomsAsync

. ;
(

; <
)

< =
;

= >
Task 
< 
RoomDescriptionDto 
>   
GetRoomByNumberAsync! 5
(5 6
int6 9

roomNumber: D
)D E
;E F
Task 
< 
int 
> 
AddRoomAsync 
( 
PostRoomDto *
	roomToAdd+ 4
)4 5
;5 6
Task 
< 
int 
> 
UpdateAsync 
( 
int !

roomNumber" ,
,, -
PatchRoomDto- 9
patchRoomDto: F
)F G
;G H
} 
} º>
ñC:\Users\alexg\Documents\GitHub\Room-with-a-View\RoomManagementMicroservice\RoomManagementMicroservice\Data\Migrations\20210422211514_InitialCreate.cs
	namespace 	&
RoomManagementMicroservice
 $
.$ %
Data% )
.) *

Migrations* 4
{ 
public 

partial 
class 
InitialCreate &
:' (
	Migration) 2
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder		 
.		 
CreateTable		 (
(		( )
name

 
:

 
$str

 
,

 
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
int& )
>) *
(* +
type+ /
:/ 0
$str1 :
,: ;
nullable< D
:D E
falseF K
)K L
. 

Annotation #
(# $
$str$ :
,: ;
true< @
)@ A
,A B

RoomNumber 
=  
table! &
.& '
Column' -
<- .
int. 1
>1 2
(2 3
type3 7
:7 8
$str9 B
,B C
nullableD L
:L M
falseN S
)S T
,T U
RoomCategory  
=! "
table# (
.( )
Column) /
</ 0
string0 6
>6 7
(7 8
type8 <
:< =
$str> D
,D E
nullableF N
:N O
trueP T
)T U
,U V
PersonsNumber !
=" #
table$ )
.) *
Column* 0
<0 1
int1 4
>4 5
(5 6
type6 :
:: ;
$str< E
,E F
nullableG O
:O P
falseQ V
)V W
,W X
Description 
=  !
table" '
.' (
Column( .
<. /
string/ 5
>5 6
(6 7
type7 ;
:; <
$str= C
,C D
nullableE M
:M N
trueO S
)S T
,T U
Price 
= 
table !
.! "
Column" (
<( )
int) ,
>, -
(- .
type. 2
:2 3
$str4 =
,= >
nullable? G
:G H
falseI N
)N O
,O P

Facilities 
=  
table! &
.& '
Column' -
<- .
string. 4
>4 5
(5 6
type6 :
:: ;
$str< B
,B C
nullableD L
:L M
trueN R
)R S
,S T
State 
= 
table !
.! "
Column" (
<( )
string) /
>/ 0
(0 1
type1 5
:5 6
$str7 =
,= >
nullable? G
:G H
trueI M
)M N
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% /
,/ 0
x1 2
=>3 5
x6 7
.7 8
Id8 :
): ;
;; <
} 
) 
; 
migrationBuilder 
. 

InsertData '
(' (
table 
: 
$str 
, 
columns 
: 
new 
[ 
] 
{  
$str! %
,% &
$str' 4
,4 5
$str6 B
,B C
$strD S
,S T
$strU \
,\ ]
$str^ l
,l m
$strn z
,z {
$str	| É
}
Ñ Ö
,
Ö Ü
values 
: 
new 
object "
[" #
]# $
{% &
$num' (
,( )
$str* 2
,2 3
$str4 @
,@ A
$numB C
,C D
$numE H
,H I
$strJ T
,T U
$numV Y
,Y Z
$str[ f
}g h
)h i
;i j
migrationBuilder!! 
.!! 

InsertData!! '
(!!' (
table"" 
:"" 
$str"" 
,"" 
columns## 
:## 
new## 
[## 
]## 
{##  
$str##! %
,##% &
$str##' 4
,##4 5
$str##6 B
,##B C
$str##D S
,##S T
$str##U \
,##\ ]
$str##^ l
,##l m
$str##n z
,##z {
$str	##| É
}
##Ñ Ö
,
##Ö Ü
values$$ 
:$$ 
new$$ 
object$$ "
[$$" #
]$$# $
{$$% &
$num$$' (
,$$( )
$str$$* 2
,$$2 3
$str$$4 @
,$$@ A
$num$$B C
,$$C D
$num$$E H
,$$H I
$str$$J T
,$$T U
$num$$V Y
,$$Y Z
$str$$[ c
}$$d e
)$$e f
;$$f g
migrationBuilder&& 
.&& 

InsertData&& '
(&&' (
table'' 
:'' 
$str'' 
,'' 
columns(( 
:(( 
new(( 
[(( 
](( 
{((  
$str((! %
,((% &
$str((' 4
,((4 5
$str((6 B
,((B C
$str((D S
,((S T
$str((U \
,((\ ]
$str((^ l
,((l m
$str((n z
,((z {
$str	((| É
}
((Ñ Ö
,
((Ö Ü
values)) 
:)) 
new)) 
object)) "
[))" #
]))# $
{))% &
$num))' (
,))( )
$str))* 2
,))2 3
$str))4 @
,))@ A
$num))B C
,))C D
$num))E H
,))H I
$str))J T
,))T U
$num))V Y
,))Y Z
$str))[ c
}))d e
)))e f
;))f g
migrationBuilder++ 
.++ 

InsertData++ '
(++' (
table,, 
:,, 
$str,, 
,,, 
columns-- 
:-- 
new-- 
[-- 
]-- 
{--  
$str--! %
,--% &
$str--' 4
,--4 5
$str--6 B
,--B C
$str--D S
,--S T
$str--U \
,--\ ]
$str--^ l
,--l m
$str--n z
,--z {
$str	--| É
}
--Ñ Ö
,
--Ö Ü
values.. 
:.. 
new.. 
object.. "
[.." #
]..# $
{..% &
$num..' (
,..( )
$str..* 2
,..2 3
$str..4 @
,..@ A
$num..B C
,..C D
$num..E H
,..H I
$str..J T
,..T U
$num..V Y
,..Y Z
$str..[ c
}..d e
)..e f
;..f g
}// 	
	protected11 
override11 
void11 
Down11  $
(11$ %
MigrationBuilder11% 5
migrationBuilder116 F
)11F G
{22 	
migrationBuilder33 
.33 
	DropTable33 &
(33& '
name44 
:44 
$str44 
)44 
;44 
}55 	
}66 
}77 Ë=
~C:\Users\alexg\Documents\GitHub\Room-with-a-View\RoomManagementMicroservice\RoomManagementMicroservice\Data\RoomsRepository.cs
	namespace

 	&
RoomManagementMicroservice


 $
.

$ %
Data

% )
{ 
public 

class 
RoomsRepository  
:! "
IRoomsRepository# 3
{ 
private 
readonly 
DataContext $
context% ,
;, -
public 
RoomsRepository 
( 
DataContext *
context+ 2
)2 3
{ 	
this 
. 
context 
= 
context "
;" #
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
RoomDescriptionDto& 8
>8 9
>9 :
GetRoomsAsync; H
(H I
)I J
{ 	
var 
rooms 
= 
await 
context %
.% &
Rooms& +
.+ ,
Select, 2
(2 3
room3 7
=>8 :
new 
RoomDescriptionDto "
(" #
)# $
{ 
RoomCategory 
= 
room #
.# $
RoomCategory$ 0
,0 1

RoomNumber 
= 
room !
.! "

RoomNumber" ,
,, -
Description 
= 
room "
." #
Description# .
,. /

Facilities 
= 
room !
.! "

Facilities" ,
,, -
PersonsNumber 
= 
room  $
.$ %
PersonsNumber% 2
,2 3
Price   
=   
room   
.   
Price   "
}!! 
)!! 
.!! 
OrderBy!! 
(!! 
room!! 
=>!! 
room!! #
.!!# $
Price!!$ )
)!!) *
.!!* +
Take!!+ /
(!!/ 0
$num!!0 2
)!!2 3
.!!3 4
ToListAsync!!4 ?
(!!? @
)!!@ A
;!!A B
return"" 
rooms"" 
;"" 
}## 	
public%% 
async%% 
Task%% 
<%% 
RoomDescriptionDto%% ,
>%%, - 
GetRoomByNumberAsync%%. B
(%%B C
int%%C F

roomNumber%%G Q
)%%Q R
{&& 	
var'' 
room'' 
='' 
await'' 
context'' $
.''$ %
Rooms''% *
.''* +
Where''+ 0
(''0 1
room''1 5
=>''6 8
room''9 =
.''= >

RoomNumber''> H
==''I K

roomNumber''L V
)''V W
.''W X
FirstOrDefaultAsync''X k
(''k l
)''l m
;''m n
if(( 
((( 
room(( 
==(( 
null(( 
)(( 
{)) 
return** 
null** 
;** 
}++ 
RoomDescriptionDto,, 
roomDescription,, .
=,,/ 0
new,,1 4
RoomDescriptionDto,,5 G
(,,G H
),,H I
{-- 
RoomCategory.. 
=.. 
room.. #
...# $
RoomCategory..$ 0
,..0 1

RoomNumber// 
=// 
room// !
.//! "

RoomNumber//" ,
,//, -
Description00 
=00 
room00 "
.00" #
Description00# .
,00. /

Facilities11 
=11 
room11 !
.11! "

Facilities11" ,
,11, -
PersonsNumber22 
=22 
room22  $
.22$ %
PersonsNumber22% 2
,222 3
Price33 
=33 
room33 
.33 
Price33 "
}44 
;44 
return55 
roomDescription55 "
;55" #
}66 	
public77 
async77 
Task77 
<77 
int77 
>77 
AddRoomAsync77 +
(77+ ,
PostRoomDto77, 7
	roomToAdd778 A
)77A B
{88 	
Room99 
room99 
=99 
new99 
(99 
	roomToAdd99 %
.99% &
RoomCategory99& 2
,992 3
	roomToAdd994 =
.99= >
PersonsNumber99> K
,99K L
	roomToAdd99M V
.99V W
Description99W b
,99b c
	roomToAdd99d m
.99m n
Price99n s
,99s t
	roomToAdd99u ~
.99~ 

Facilities	99 â
)
99â ä
;
99ä ã
int:: 
numberOfRooms:: 
=:: 
context::  '
.::' (
Rooms::( -
.::- .
Count::. 3
(::3 4
)::4 5
;::5 6
room;; 
.;; 

RoomNumber;; 
=;; 
(;; 
numberOfRooms;; ,
/;;- .
$num;;/ 1
+;;2 3
$num;;4 5
);;5 6
*;;7 8
$num;;9 <
+;;= >
numberOfRooms;;? L
%;;M N
$num;;O Q
;;;Q R
room<< 
.<< 
State<< 
=<< 
$str<< $
;<<$ %
this>> 
.>> 
context>> 
.>> 
Add>> 
(>> 
room>> !
)>>! "
;>>" #
await?? 
this?? 
.?? 
context?? 
.?? 
SaveChangesAsync?? /
(??/ 0
)??0 1
;??1 2
return@@ 
$num@@ 
;@@ 
}AA 	
publicCC 
asyncCC 
TaskCC 
<CC 
intCC 
>CC 
UpdateAsyncCC *
(CC* +
intCC+ .

roomNumberCC/ 9
,CC9 :
PatchRoomDtoCC: F
patchRoomDtoCCG S
)CCS T
{DD 	
varEE 
resultEE 
=EE 
awaitEE 
contextEE &
.EE& '
RoomsEE' ,
.EE, -
WhereEE- 2
(EE2 3
roomEE3 7
=>EE8 :
roomEE; ?
.EE? @

RoomNumberEE@ J
==EEK M

roomNumberEEN X
)EEX Y
.EEY Z
FirstOrDefaultAsyncEEZ m
(EEm n
)EEn o
;EEo p
ifFF 
(FF 
resultFF 
==FF 
nullFF 
)FF 
{GG 
returnHH 
-HH 
$numHH 
;HH 
}II 
resultJJ 
.JJ 
PersonsNumberJJ  
=JJ! "
patchRoomDtoJJ# /
.JJ/ 0
PersonsNumberJJ0 =
;JJ= >
resultKK 
.KK 
DescriptionKK 
=KK  
patchRoomDtoKK! -
.KK- .
DescriptionKK. 9
??KK: <
resultKK= C
.KKC D
DescriptionKKD O
;KKO P
resultLL 
.LL 
PriceLL 
=LL 
patchRoomDtoLL '
.LL' (
PriceLL( -
;LL- .
resultMM 
.MM 

FacilitiesMM 
=MM 
patchRoomDtoMM  ,
.MM, -

FacilitiesMM- 7
??MM8 :
resultMM; A
.MMA B

FacilitiesMMB L
;MML M
resultNN 
.NN 
StateNN 
=NN 
patchRoomDtoNN '
.NN' (
StateNN( -
??NN- /
resultNN/ 5
.NN5 6
StateNN6 ;
;NN; <
awaitOO 
contextOO 
.OO 
SaveChangesAsyncOO *
(OO* +
)OO+ ,
;OO, -
returnPP 
$numPP 
;PP 
}QQ 	
}RR 
}SS ﬁ
{C:\Users\alexg\Documents\GitHub\Room-with-a-View\RoomManagementMicroservice\RoomManagementMicroservice\DTOs\PatchRoomDto.cs
	namespace 	&
RoomManagementMicroservice
 $
.$ %
DTOs% )
{ 
public 

class 
PatchRoomDto 
{		 
public 
int 
PersonsNumber  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 
Price 
{ 
get 
; 
set  #
;# $
}% &
public 
string 

Facilities  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
State 
{ 
get !
;! "
set# &
;& '
}( )
} 
} „
zC:\Users\alexg\Documents\GitHub\Room-with-a-View\RoomManagementMicroservice\RoomManagementMicroservice\DTOs\PostRoomDto.cs
	namespace 	&
RoomManagementMicroservice
 $
.$ %
DTOs% )
{ 
public 

class 
PostRoomDto 
{ 
public 
string 
RoomCategory "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
PersonsNumber  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 
Price 
{ 
get 
; 
set  #
;# $
}% &
public		 
string		 

Facilities		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
}

 
} ç

ÅC:\Users\alexg\Documents\GitHub\Room-with-a-View\RoomManagementMicroservice\RoomManagementMicroservice\DTOs\RoomDescriptionDto.cs
	namespace 	&
RoomManagementMicroservice
 $
.$ %
DTOs% )
{ 
public 

class 
RoomDescriptionDto #
{ 
public 
string 
RoomCategory "
{# $
get% (
;( )
set* -
;- .
}/ 0
public		 
int		 

RoomNumber		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 
Price 
{ 
get 
; 
set  #
;# $
}% &
public 
string 

Facilities  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 
PersonsNumber  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} ¨
ÇC:\Users\alexg\Documents\GitHub\Room-with-a-View\RoomManagementMicroservice\RoomManagementMicroservice\DTOs\RoomResultSearchDto.cs
	namespace 	&
RoomManagementMicroservice
 $
.$ %
DTOs% )
{ 
public 

class 
RoomResultSearchDto $
{ 
public 
string 
RoomCategory "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
int 
Price 
{ 
get 
; 
set  #
;# $
}% &
}		 
}

 É
wC:\Users\alexg\Documents\GitHub\Room-with-a-View\RoomManagementMicroservice\RoomManagementMicroservice\Entities\Room.cs
	namespace 	&
RoomManagementMicroservice
 $
.$ %
Entities% -
{ 
public 

class 
Room 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
int 

RoomNumber 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
RoomCategory "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
PersonsNumber  
{! "
get# &
;& '
set( +
;+ ,
}- .
public		 
string		 
Description		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
public

 
int

 
Price

 
{

 
get

 
;

 
set

  #
;

# $
}

% &
public 
string 

Facilities  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
State 
{ 
get !
;! "
set# &
;& '
}( )
public 
Room 
( 
string 
roomCategory '
,' (
int) ,
personsNumber- :
,: ;
string< B
descriptionC N
,N O
intP S
priceT Y
,Y Z
string[ a

facilitiesb l
)l m
{ 	
RoomCategory 
= 
roomCategory '
;' (
PersonsNumber 
= 
personsNumber )
;) *
Description 
= 
description %
;% &
Price 
= 
price 
; 

Facilities 
= 

facilities #
;# $
} 	
public 
Room 
( 
) 
{ 	
} 	
} 
} Ÿ

qC:\Users\alexg\Documents\GitHub\Room-with-a-View\RoomManagementMicroservice\RoomManagementMicroservice\Program.cs
	namespace 	&
RoomManagementMicroservice
 $
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{		 	
CreateHostBuilder

 
(

 
args

 "
)

" #
.

# $
Build

$ )
(

) *
)

* +
.

+ ,
Run

, /
(

/ 0
)

0 1
;

1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} ∆"
qC:\Users\alexg\Documents\GitHub\Room-with-a-View\RoomManagementMicroservice\RoomManagementMicroservice\Startup.cs
	namespace

 	&
RoomManagementMicroservice


 $
{ 
public 

class 
Startup 
{ 
readonly 
string $
MyAllowedSpecificOrigins 0
=1 2
$str3 J
;J K
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. 
AddControllers #
(# $
)$ %
;% &
services 
. 
AddDbContext !
<! "
DataContext" -
>- .
(. /
options/ 6
=>7 9
{ 
options 
. 
	UseSqlite !
(! "
Configuration" /
./ 0
GetConnectionString0 C
(C D
$strD W
)W X
)X Y
;Y Z
} 
) 
; 
services   
.   
AddCors   
(   
options   $
=>  % '
{!! 
options"" 
."" 
	AddPolicy"" !
(""! "$
MyAllowedSpecificOrigins""" :
,"": ;
builder""< C
=>""D F
{## 
builder$$ 
.$$ 
AllowAnyHeader$$ *
($$* +
)$$+ ,
.%% 
AllowAnyMethod%% #
(%%# $
)%%$ %
.&& 
AllowAnyOrigin&& #
(&&# $
)&&$ %
;&&% &
}'' 
)'' 
;'' 
}(( 
)(( 
;(( 
services** 
.** 
AddTransient** !
<**! "
IRoomsRepository**" 2
,**2 3
RoomsRepository**4 C
>**C D
(**D E
)**E F
;**F G
services++ 
.++ 
AddSwaggerGen++ "
(++" #
c++# $
=>++% '
{,, 
c-- 
.-- 

SwaggerDoc-- 
(-- 
$str-- !
,--! "
new--# &
OpenApiInfo--' 2
{--3 4
Title--5 :
=--; <
$str--= Y
,--Y Z
Version--[ b
=--c d
$str--e i
}--j k
)--k l
;--l m
}.. 
).. 
;.. 
}// 	
public22 
void22 
	Configure22 
(22 
IApplicationBuilder22 1
app222 5
,225 6
IWebHostEnvironment227 J
env22K N
)22N O
{33 	
if44 
(44 
env44 
.44 
IsDevelopment44 !
(44! "
)44" #
)44# $
{55 
app66 
.66 %
UseDeveloperExceptionPage66 -
(66- .
)66. /
;66/ 0
app77 
.77 

UseSwagger77 
(77 
)77  
;77  !
app88 
.88 
UseSwaggerUI88  
(88  !
c88! "
=>88# %
c88& '
.88' (
SwaggerEndpoint88( 7
(887 8
$str888 R
,88R S
$str88T s
)88s t
)88t u
;88u v
}99 
app;; 
.;; 
UseCors;; 
(;; $
MyAllowedSpecificOrigins;; 0
);;0 1
;;;1 2
app== 
.== 

UseRouting== 
(== 
)== 
;== 
app?? 
.?? 
UseAuthorization??  
(??  !
)??! "
;??" #
appAA 
.AA 
UseEndpointsAA 
(AA 
	endpointsAA &
=>AA' )
{BB 
	endpointsCC 
.CC 
MapControllersCC (
(CC( )
)CC) *
;CC* +
}DD 
)DD 
;DD 
}EE 	
}FF 
}GG Ï
uC:\Users\alexg\Documents\GitHub\Room-with-a-View\RoomManagementMicroservice\RoomManagementMicroservice\Utils\Error.cs
	namespace 	&
RoomManagementMicroservice
 $
.$ %
Utils% *
{ 
public 

class 
Error 
{ 
public 
Error 
( 
string 
errorMessage (
)( )
{ 	
this 
. 
ErrorMessage 
= 
errorMessage  ,
;, -
} 	
public		 
string		 
ErrorMessage		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
}

 
} 