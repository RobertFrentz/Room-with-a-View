±E
…C:\Users\alexg\Documents\GitHub\Room-with-a-View\RoomManagementMicroservice\RoomManagementMicroservice\Controllers\RoomsController.cs
	namespace

 	&
RoomManagementMicroservice


 $
.

$ %
Controllers

% 0
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
RoomsController  
:! "
ControllerBase# 1
{ 
private 
readonly 
IRoomsRepository )
_repository* 5
;5 6
private 
readonly 

HttpClient #
client$ *
;* +
private 
readonly 
string *
usersManagementMicroserviceUri  >
=? @
$strA g
;g h
public 
RoomsController 
( 
IRoomsRepository /

repository0 :
): ;
{ 	
_repository 
= 

repository $
;$ %
client 
= 
new 

HttpClient #
(# $
)$ %
;% &
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetRoomsAsync) 6
(6 7
)7 8
{ 	
IEnumerable%% 
<%% 
RoomDescriptionDto%% *
>%%* +
result%%, 2
=%%3 4
await%%5 :
_repository%%; F
.%%F G
GetRoomsAsync%%G T
(%%T U
)%%U V
;%%V W
if&& 
(&& 
result&& 
==&& 
null&& 
)&& 
{'' 
return(( 
NotFound(( 
(((  
new((  #
Error(($ )
((() *
$str((* 4
)((4 5
)((5 6
;((6 7
})) 
return++ 
Ok++ 
(++ 
result++ 
)++ 
;++ 
},, 	
[.. 	
HttpGet..	 
(.. 
$str.. 
)..  
]..  !
public00 
async00 
Task00 
<00 
IActionResult00 '
>00' ( 
GetRoomByNumberAsync00) =
(00= >
int00> A

roomNumber00B L
,00L M
[00N O

FromHeader00O Y
]00Y Z
string00[ a
authorizationToken00b t
)00t u
{11 	
client22 
.22 !
DefaultRequestHeaders22 (
.22( )
Add22) ,
(22, -
$str22- A
,22A B
authorizationToken22C U
)22U V
;22V W
var33 !
responseAuthorization33 %
=33& '
await33( -
client33. 4
.334 5
GetAsync335 =
(33= >*
usersManagementMicroserviceUri33> \
+33] ^
$str33_ n
)33n o
;33o p
if44 
(44 !
responseAuthorization44 %
.44% &

StatusCode44& 0
==441 3
System444 :
.44: ;
Net44; >
.44> ?
HttpStatusCode44? M
.44M N
Unauthorized44N Z
)44Z [
{55 
return66 
Unauthorized66 #
(66# $!
responseAuthorization66$ 9
.669 :
Content66: A
.66A B
ReadAsStringAsync66B S
(66S T
)66T U
.66U V
Result66V \
)66\ ]
;66] ^
}77 
RoomDescriptionDto88 
result88 %
=88& '
await88( -
_repository88. 9
.889 : 
GetRoomByNumberAsync88: N
(88N O

roomNumber88O Y
)88Y Z
;88Z [
if99 
(99 
result99 
==99 
null99 
)99 
{:: 
return;; 
NotFound;; 
(;;  
new;;  #
Error;;$ )
(;;) *
$str;;* U
);;U V
);;V W
;;;W X
}<< 
return== 
Ok== 
(== 
JsonConvert== !
.==! "
SerializeObject==" 1
(==1 2
new==2 5
{>> 
room?? 
=?? 
result?? 
}@@ 
)@@ 
)@@ 
;@@ 
}AA 	
[BB 	
RouteBB	 
(BB 
$strBB 
)BB 
]BB 
[CC 	
HttpPostCC	 
]CC 
publicEE 
asyncEE 
TaskEE 
<EE 
IActionResultEE '
>EE' (
PostRoomAsyncEE) 6
(EE6 7
[EE7 8
FromBodyEE8 @
]EE@ A
PostRoomDtoEEB M
	roomToAddEEN W
,EEX Y
[EEZ [

FromHeaderEE[ e
]EEe f
stringEEg m
authorizationToken	EEn €
)
EE€ 
{FF 	
clientGG 
.GG !
DefaultRequestHeadersGG (
.GG( )
AddGG) ,
(GG, -
$strGG- A
,GGA B
authorizationTokenGGC U
)GGU V
;GGV W
varHH !
responseAuthorizationHH %
=HH& '
awaitHH( -
clientHH. 4
.HH4 5
GetAsyncHH5 =
(HH= >*
usersManagementMicroserviceUriHH> \
+HH] ^
$strHH_ n
)HHn o
;HHo p
ifII 
(II !
responseAuthorizationII %
.II% &

StatusCodeII& 0
==II1 3
SystemII4 :
.II: ;
NetII; >
.II> ?
HttpStatusCodeII? M
.IIM N
UnauthorizedIIN Z
)IIZ [
{JJ 
returnKK 
UnauthorizedKK #
(KK# $!
responseAuthorizationKK$ 9
.KK9 :
ContentKK: A
.KKA B
ReadAsStringAsyncKKB S
(KKS T
)KKT U
.KKU V
ResultKKV \
)KK\ ]
;KK] ^
}LL 
awaitMM 
_repositoryMM 
.MM 
AddRoomAsyncMM *
(MM* +
	roomToAddMM+ 4
)MM4 5
;MM5 6
returnNN 
CreatedAtActionNN "
(NN" #
$strNN# ,
,NN, -
	roomToAddNN. 7
)NN7 8
;NN8 9
}OO 	
[QQ 	
	HttpPatchQQ	 
(QQ 
$strQQ !
)QQ! "
]QQ" #
publicRR 
asyncRR 
TaskRR 
<RR 
IActionResultRR '
>RR' (
UpdateRoomAsyncRR) 8
(RR8 9
intRR9 <

roomNumberRR= G
,RRG H
[RRI J
FromBodyRRJ R
]RRR S
PatchRoomDtoRRT `
patchRoomDtoRRa m
,RRn o
[RRp q

FromHeaderRRq {
]RR{ |
string	RR} ƒ 
authorizationToken
RR„ –
)
RR– —
{SS 	
clientTT 
.TT !
DefaultRequestHeadersTT (
.TT( )
AddTT) ,
(TT, -
$strTT- A
,TTA B
authorizationTokenTTC U
)TTU V
;TTV W
varUU !
responseAuthorizationUU %
=UU& '
awaitUU( -
clientUU. 4
.UU4 5
GetAsyncUU5 =
(UU= >*
usersManagementMicroserviceUriUU> \
+UU] ^
$strUU_ n
)UUn o
;UUo p
ifVV 
(VV !
responseAuthorizationVV %
.VV% &

StatusCodeVV& 0
==VV1 3
SystemVV4 :
.VV: ;
NetVV; >
.VV> ?
HttpStatusCodeVV? M
.VVM N
UnauthorizedVVN Z
)VVZ [
{WW 
returnXX 
UnauthorizedXX #
(XX# $!
responseAuthorizationXX$ 9
.XX9 :
ContentXX: A
.XXA B
ReadAsStringAsyncXXB S
(XXS T
)XXT U
.XXU V
ResultXXV \
)XX\ ]
;XX] ^
}YY 
varZZ 
resultZZ 
=ZZ 
awaitZZ 
_repositoryZZ *
.ZZ* +
UpdateAsyncZZ+ 6
(ZZ6 7

roomNumberZZ7 A
,ZZA B
patchRoomDtoZZB N
)ZZN O
;ZZO P
if[[ 
([[ 
result[[ 
==[[ 
-[[ 
$num[[ 
)[[ 
{\\ 
return]] 
NotFound]] 
(]]  
new]]  #
Error]]$ )
(]]) *
$"]]* ,!
The room with number ]], A
{]]A B

roomNumber]]B L
}]]L M
 was not found.]]M \
"]]\ ]
)]]] ^
)]]^ _
;]]_ `
}^^ 
return__ 
	NoContent__ 
(__ 
)__ 
;__ 
}aa 	
}bb 
}cc ‡!
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
} ¼>
–C:\Users\alexg\Documents\GitHub\Room-with-a-View\RoomManagementMicroservice\RoomManagementMicroservice\Data\Migrations\20210422211514_InitialCreate.cs
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
$str	| ƒ
}
„ …
,
… †
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
$str	##| ƒ
}
##„ …
,
##… †
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
$str	((| ƒ
}
((„ …
,
((… †
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
$str	--| ƒ
}
--„ …
,
--… †
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
}77 è=
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

Facilities	99 ‰
)
99‰ Š
;
99Š ‹
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
}SS Þ
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
} ã
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
} 

C:\Users\alexg\Documents\GitHub\Room-with-a-View\RoomManagementMicroservice\RoomManagementMicroservice\DTOs\RoomDescriptionDto.cs
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
} ¬
‚C:\Users\alexg\Documents\GitHub\Room-with-a-View\RoomManagementMicroservice\RoomManagementMicroservice\DTOs\RoomResultSearchDto.cs
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
 ƒ
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
} Ù

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
} Æ"
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
}GG ì
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