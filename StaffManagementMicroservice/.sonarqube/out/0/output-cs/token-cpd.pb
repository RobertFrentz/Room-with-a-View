ÇÇ
çC:\Users\alexg\Documents\GitHub\Room-with-a-View\StaffManagementMicroservice\StaffManagementMicroservice\Controllers\AssignmentsController.cs
	namespace		 	'
StaffManagementMicroservice		
 %
.		% &
Controllers		& 1
{

 
[ 
Route 

(
 
$str 
)  
]  !
[ 
ApiController 
] 
public 

class !
AssignmentsController &
:' (
ControllerBase) 7
{ 
private 
readonly "
IAssignmentsRepository /
_repository0 ;
;; <
private 
readonly 

HttpClient #
client$ *
;* +
private 
readonly 
string *
usersManagementMicroserviceUri  >
=? @
$strA g
;g h
private 
readonly 
string *
roomsManagementMicroserviceUri  >
=? @
$strA f
;f g
public !
AssignmentsController $
($ %"
IAssignmentsRepository% ;

repository< F
)F G
{ 	
_repository 
= 

repository $
;$ %
client 
= 
new 

HttpClient #
(# $
)$ %
;% &
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetAssignmentsAsync) <
(< =
)= >
{ 	
var 
result 
= 
await 
_repository *
.* +
GetAssignmentsAsync+ >
(> ?
)? @
;@ A
return 
Ok 
( 
result 
) 
; 
} 	
[!! 	
HttpGet!!	 
(!! 
$str!! 
)!! 
]!! 
public"" 
async"" 
Task"" 
<"" 
IActionResult"" '
>""' (
GetAssignmentAsync"") ;
(""; <
[""< =

FromHeader""= G
]""G H
string""I O
authorizationToken""P b
,""b c
int""d g
id""h j
)""j k
{## 	
var$$ 
verify$$ 
=$$ 
await$$ 
VerifyAuthorization$$ 2
($$2 3
authorizationToken$$3 E
)$$E F
;$$F G
if%% 
(%% 
verify%% 
is%% $
UnauthorizedObjectResult%% 2
)%%2 3
{&& 
return'' 
verify'' 
;'' 
}(( 
var)) 
result)) 
=)) 
await)) 
_repository)) *
.))* +
GetAssignmentAsync))+ =
())= >
id))> @
)))@ A
;))A B
if** 
(** 
result** 
==** 
null** 
)** 
{++ 
return,, 
NotFound,, 
(,,  
new,,  #
Error,,$ )
(,,) *
$",,* ,
$str,,, ?
{,,? @
id,,@ B
},,B C
$str,,C R
",,R S
),,S T
),,T U
;,,U V
}-- 
return.. 
Ok.. 
(.. 
result.. 
).. 
;.. 
}// 	
[00 	
Route00	 
(00 
$str00 
)00 
]00 
[11 	
HttpGet11	 
]11 
public22 
async22 
Task22 
<22 
IActionResult22 '
>22' (
VerifyAuthorization22) <
(22< =
string22= C
authorizationToken22D V
)22V W
{33 	
client44 
.44 !
DefaultRequestHeaders44 (
.44( )
Add44) ,
(44, -
$str44- A
,44A B
authorizationToken44C U
)44U V
;44V W
var55 !
responseAuthorization55 %
=55& '
await55( -
client55. 4
.554 5
GetAsync555 =
(55= >*
usersManagementMicroserviceUri55> \
+55] ^
$str55_ n
)55n o
;55o p
if66 
(66 !
responseAuthorization66 %
.66% &

StatusCode66& 0
==661 3
System664 :
.66: ;
Net66; >
.66> ?
HttpStatusCode66? M
.66M N
Unauthorized66N Z
)66Z [
{77 
return88 
Unauthorized88 #
(88# $!
responseAuthorization88$ 9
.889 :
Content88: A
.88A B
ReadAsStringAsync88B S
(88S T
)88T U
.88U V
Result88V \
)88\ ]
;88] ^
}99 
return:: 
Ok:: 
(:: !
responseAuthorization:: +
.::+ ,
Content::, 3
.::3 4
ReadAsStringAsync::4 E
(::E F
)::F G
.::G H
Result::H N
)::N O
;::O P
};; 	
[== 	
Route==	 
(== 
$str== "
)==" #
]==# $
[>> 	
HttpGet>>	 
]>> 
public?? 
async?? 
Task?? 
<?? 
IActionResult?? '
>??' (&
GetStaffAssignmentByUserId??) C
(??C D
[??D E

FromHeader??E O
]??O P
string??Q W
authorizationToken??X j
,??j k
int??l o
userId??p v
)??v w
{@@ 	
varAA 
verifyAA 
=AA 
awaitAA 
VerifyAuthorizationAA 2
(AA2 3
authorizationTokenAA3 E
)AAE F
;AAF G
ifBB 
(BB 
verifyBB 
isBB $
UnauthorizedObjectResultBB 2
)BB2 3
{CC 
returnDD 
verifyDD 
;DD 
}EE 
varFF 
resultFF 
=FF 
awaitFF 
_repositoryFF *
.FF* +'
GetAssignmentsByUserIdAsyncFF+ F
(FFF G
userIdFFG M
)FFM N
;FFN O
ifGG 
(GG 
resultGG 
==GG 
nullGG 
)GG 
{HH 
returnII 
NotFoundII 
(II  
newII  #
ErrorII$ )
(II) *
$"II* ,
$strII, ;
{II; <
userIdII< B
}IIB C
$strIIC f
"IIf g
)IIg h
)IIh i
;IIi j
}JJ 
returnKK 
OkKK 
(KK 
resultKK 
)KK 
;KK 
}LL 	
[NN 	
RouteNN	 
(NN 
$strNN 
)NN 
]NN 
[OO 	
HttpGetOO	 
]OO 
publicPP 
asyncPP 
TaskPP 
<PP 
IActionResultPP '
>PP' ('
GetAssignmentsByUserIdAsyncPP) D
(PPD E
[PPE F

FromHeaderPPF P
]PPP Q
stringPPR X
authorizationTokenPPY k
)PPk l
{QQ 	
varRR 
verifyRR 
=RR 
awaitRR 
VerifyAuthorizationRR 2
(RR2 3
authorizationTokenRR3 E
)RRE F
;RRF G
ifSS 
(SS 
verifySS 
isSS $
UnauthorizedObjectResultSS 2
)SS2 3
{TT 
returnUU 
verifyUU 
;UU 
}VV 
varXX 
userIdXX 
=XX 
ExtractXX  
.XX  !
ExtractUserIdXX! .
(XX. /
(XX/ 0
verifyXX0 6
asXX7 9
ObjectResultXX: F
)XXF G
.XXG H
ValueXXH M
.XXM N
ToStringXXN V
(XXV W
)XXW X
)XXX Y
;XXY Z
varYY 
resultYY 
=YY 
awaitYY 
_repositoryYY *
.YY* +'
GetAssignmentsByUserIdAsyncYY+ F
(YYF G
userIdYYG M
)YYM N
;YYN O
returnZZ 
OkZZ 
(ZZ 
resultZZ 
)ZZ 
;ZZ 
}[[ 	
[]] 	
HttpPost]]	 
]]] 
public^^ 
async^^ 
Task^^ 
<^^ 
IActionResult^^ '
>^^' (
PostAssignmentAsync^^) <
(^^< =
[^^= >

FromHeader^^> H
]^^H I
string^^J P
authorizationToken^^Q c
,^^c d
[^^e f
FromBody^^f n
]^^n o
PostAssignmentDto	^^p Å
postAssignmentDto
^^Ç ì
)
^^ì î
{__ 	
client`` 
.`` !
DefaultRequestHeaders`` (
.``( )
Add``) ,
(``, -
$str``- A
,``A B
authorizationToken``C U
)``U V
;``V W
varaa 
responseRoomNumberaa "
=aa# $
awaitaa% *
clientaa+ 1
.aa1 2
GetAsyncaa2 :
(aa: ;*
roomsManagementMicroserviceUriaa; Y
+aaZ [
$"aa\ ^
$straa^ _
{aa_ `
postAssignmentDtoaa` q
.aaq r

RoomNumberaar |
}aa| }
"aa} ~
)aa~ 
;	aa Ä
ifbb 
(bb 
responseRoomNumberbb "
.bb" #

StatusCodebb# -
==bb. 0
Systembb1 7
.bb7 8
Netbb8 ;
.bb; <
HttpStatusCodebb< J
.bbJ K
NotFoundbbK S
)bbS T
{cc 
returndd 

BadRequestdd !
(dd! "
newdd" %
Errordd& +
(dd+ ,
$"dd, .
$strdd. D
{ddD E
postAssignmentDtoddE V
.ddV W

RoomNumberddW a
}dda b
$strddb r
"ddr s
)dds t
)ddt u
;ddu v
}ee 
varff 
responseUserDetailsff #
=ff$ %
awaitff& +
clientff, 2
.ff2 3
GetAsyncff3 ;
(ff; <*
usersManagementMicroserviceUriff< Z
+ff[ \
$"ff] _
{ff_ `
postAssignmentDtoff` q
.ffq r
UserIdffr x
}ffx y
"ffy z
)ffz {
;ff{ |
ifgg 
(gg 
responseUserDetailsgg #
.gg# $

StatusCodegg$ .
==gg/ 1
Systemgg2 8
.gg8 9
Netgg9 <
.gg< =
HttpStatusCodegg= K
.ggK L
NotFoundggL T
)ggT U
{hh 
returnii 

BadRequestii !
(ii! "
newii" %
Errorii& +
(ii+ ,
$"ii, .
$strii. ;
{ii; <
postAssignmentDtoii< M
.iiM N
UserIdiiN T
}iiT U
$striiU e
"iie f
)iif g
)iig h
;iih i
}jj 
intkk 
rolekk 
=kk 
Extractkk 
.kk 
ExtractRolekk *
(kk* +
responseUserDetailskk+ >
.kk> ?
Contentkk? F
.kkF G
ReadAsStringAsynckkG X
(kkX Y
)kkY Z
.kkZ [
Resultkk[ a
)kka b
;kkb c
ifll 
(ll 
rolell 
!=ll 
$numll 
)ll 
{mm 
returnnn 

BadRequestnn !
(nn! "
newnn" %
Errornn& +
(nn+ ,
$"nn, .
$strnn. =
{nn= >
postAssignmentDtonn> O
.nnO P
UserIdnnP V
}nnV W
$strnnW m
"nnm n
)nnn o
)nno p
;nnp q
}oo 
awaitpp 
_repositorypp 
.pp 
PostAssignmentAsyncpp 1
(pp1 2
postAssignmentDtopp2 C
,ppC D
postAssignmentDtoppE V
.ppV W
UserIdppW ]
)pp] ^
;pp^ _
returnqq 
Okqq 
(qq 
postAssignmentDtoqq '
)qq' (
;qq( )
}rr 	
[tt 	
Routett	 
(tt 
$strtt 
)tt 
]tt 
[uu 	
	HttpPatchuu	 
]uu 
publicvv 
asyncvv 
Taskvv 
<vv 
IActionResultvv '
>vv' (%
PrioritizeAssignmentAsyncvv) B
(vvB C
[vvC D

FromHeadervvD N
]vvN O
stringvvP V
authorizationTokenvvW i
,vvi j
intvvk n
idvvo q
)vvq r
{ww 	
varxx 
verifyxx 
=xx 
awaitxx 
VerifyAuthorizationxx 2
(xx2 3
authorizationTokenxx3 E
)xxE F
;xxF G
ifyy 
(yy 
verifyyy 
isyy $
UnauthorizedObjectResultyy 2
)yy2 3
{zz 
return{{ 
verify{{ 
;{{ 
}|| 
bool}} 
isPrioritized}} 
=}}  
await}}! &
_repository}}' 2
.}}2 3%
PrioritizeAssignmentAsync}}3 L
(}}L M
id}}M O
)}}O P
;}}P Q
if~~ 
(~~ 
!~~ 
isPrioritized~~ 
)~~ 
{ 
return
ÄÄ 
NotFound
ÄÄ 
(
ÄÄ  
new
ÄÄ  #
Error
ÄÄ$ )
(
ÄÄ) *
$str
ÄÄ* D
)
ÄÄD E
)
ÄÄE F
;
ÄÄF G
}
ÅÅ 
return
ÇÇ 
	NoContent
ÇÇ 
(
ÇÇ 
)
ÇÇ 
;
ÇÇ 
}
ÉÉ 	
[
ÖÖ 	
HttpPut
ÖÖ	 
]
ÖÖ 
public
ÜÜ 
async
ÜÜ 
Task
ÜÜ 
<
ÜÜ 
IActionResult
ÜÜ '
>
ÜÜ' (
UpdateAsync
ÜÜ) 4
(
ÜÜ4 5
[
ÜÜ5 6

FromHeader
ÜÜ6 @
]
ÜÜ@ A
string
ÜÜB H 
authorizationToken
ÜÜI [
,
ÜÜ[ \
[
ÜÜ] ^
FromBody
ÜÜ^ f
]
ÜÜf g
int
ÜÜh k
status
ÜÜl r
,
ÜÜr s
int
ÜÜt w
id
ÜÜx z
)
ÜÜz {
{
áá 	
var
àà 
verify
àà 
=
àà 
await
àà !
VerifyAuthorization
àà 2
(
àà2 3 
authorizationToken
àà3 E
)
ààE F
;
ààF G
if
ââ 
(
ââ 
verify
ââ 
is
ââ &
UnauthorizedObjectResult
ââ 2
)
ââ2 3
{
ää 
return
ãã 
verify
ãã 
;
ãã 
}
åå 
bool
çç 
	isUpdated
çç 
=
çç 
await
çç "
_repository
çç# .
.
çç. /
UpdateAsync
çç/ :
(
çç: ;
status
çç; A
,
ççA B
id
ççC E
)
ççE F
;
ççF G
if
éé 
(
éé 
!
éé 
	isUpdated
éé 
)
éé 
{
èè 
return
êê 
NotFound
êê 
(
êê  
new
êê  #
Error
êê$ )
(
êê) *
$str
êê* D
)
êêD E
)
êêE F
;
êêF G
}
ëë 
return
íí 
	NoContent
íí 
(
íí 
)
íí 
;
íí 
}
ìì 	
[
ïï 	

HttpDelete
ïï	 
]
ïï 
public
ññ 
async
ññ 
Task
ññ 
<
ññ 
IActionResult
ññ '
>
ññ' (
DeleteAsync
ññ) 4
(
ññ4 5
[
ññ5 6

FromHeader
ññ6 @
]
ññ@ A
string
ññB H 
authorizationToken
ññI [
,
ññ[ \
int
ññ] `
id
ñña c
)
ññc d
{
óó 	
var
òò 
verify
òò 
=
òò 
await
òò !
VerifyAuthorization
òò 2
(
òò2 3 
authorizationToken
òò3 E
)
òòE F
;
òòF G
if
ôô 
(
ôô 
verify
ôô 
is
ôô &
UnauthorizedObjectResult
ôô 2
)
ôô2 3
{
öö 
return
õõ 
verify
õõ 
;
õõ 
}
úú 
await
ùù 
_repository
ùù 
.
ùù 
DeleteByIdAsync
ùù -
(
ùù- .
id
ùù. 0
)
ùù0 1
;
ùù1 2
return
ûû 
	NoContent
ûû 
(
ûû 
)
ûû 
;
ûû 
}
üü 	
}
†† 
}°° «
|C:\Users\alexg\Documents\GitHub\Room-with-a-View\StaffManagementMicroservice\StaffManagementMicroservice\Data\DataContext.cs
	namespace 	'
StaffManagementMicroservice
 %
.% &
Repositories& 2
{ 
public 

class 
DataContext 
: 
	DbContext (
{ 
public 
DataContext 
( 
DbContextOptions +
options, 3
)3 4
:5 6
base7 ;
(; <
options< C
)C D
{		 	
} 	
public 
DbSet 
< 

Assignment 
>  
Assignments! ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
} 
}  
òC:\Users\alexg\Documents\GitHub\Room-with-a-View\StaffManagementMicroservice\StaffManagementMicroservice\Data\Migrations\20210518181910_InitialCreate.cs
	namespace 	'
StaffManagementMicroservice
 %
.% &
Repositories& 2
.2 3

Migrations3 =
{ 
public 

partial 
class 
InitialCreate &
:' (
	Migration) 2
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{		 	
migrationBuilder

 
.

 
CreateTable

 (
(

( )
name 
: 
$str #
,# $
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
int& )
>) *
(* +
type+ /
:/ 0
$str1 :
,: ;
nullable< D
:D E
falseF K
)K L
. 

Annotation #
(# $
$str$ :
,: ;
true< @
)@ A
,A B

RoomNumber 
=  
table! &
.& '
Column' -
<- .
int. 1
>1 2
(2 3
type3 7
:7 8
$str9 B
,B C
nullableD L
:L M
falseN S
)S T
,T U
UserId 
= 
table "
." #
Column# )
<) *
int* -
>- .
(. /
type/ 3
:3 4
$str5 >
,> ?
nullable@ H
:H I
falseJ O
)O P
,P Q
Type 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 <
,< =
nullable> F
:F G
trueH L
)L M
,M N
Observations  
=! "
table# (
.( )
Column) /
</ 0
string0 6
>6 7
(7 8
type8 <
:< =
$str> D
,D E
nullableF N
:N O
trueP T
)T U
,U V
AddedAt 
= 
table #
.# $
Column$ *
<* +
DateTime+ 3
>3 4
(4 5
type5 9
:9 :
$str; A
,A B
nullableC K
:K L
falseM R
)R S
,S T
Status 
= 
table "
." #
Column# )
<) *
int* -
>- .
(. /
type/ 3
:3 4
$str5 >
,> ?
nullable@ H
:H I
falseJ O
)O P
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
$str% 5
,5 6
x7 8
=>9 ;
x< =
.= >
Id> @
)@ A
;A B
} 
) 
; 
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder 
. 
	DropTable &
(& '
name   
:   
$str   #
)  # $
;  $ %
}!! 	
}"" 
}## é

âC:\Users\alexg\Documents\GitHub\Room-with-a-View\StaffManagementMicroservice\StaffManagementMicroservice\DTOs\AssignmentDescriptionDto.cs
	namespace 	'
StaffManagementMicroservice
 %
.% &
DTOs& *
{ 
public 

class $
AssignmentDescriptionDto )
{ 
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 

RoomNumber 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
string		 
Type		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
string

 
Observations

 "
{

# $
get

% (
;

( )
set

* -
;

- .
}

/ 0
public 
DateTime 
AddedAt 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
Status 
{ 
get 
;  
set! $
;$ %
}& '
} 
} Ã
ÇC:\Users\alexg\Documents\GitHub\Room-with-a-View\StaffManagementMicroservice\StaffManagementMicroservice\DTOs\PostAssignmentDto.cs
	namespace 	'
StaffManagementMicroservice
 %
.% &
DTOs& *
{ 
public 

class 
PostAssignmentDto "
{		 
public

 
int

 
UserId

 
{

 
get

 
;

  
set

! $
;

$ %
}

& '
public 
int 

RoomNumber 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Observations "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} å
C:\Users\alexg\Documents\GitHub\Room-with-a-View\StaffManagementMicroservice\StaffManagementMicroservice\Entities\Assignment.cs
	namespace 	'
StaffManagementMicroservice
 %
.% &
Entities& .
{ 
public 

class 

Assignment 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
int 

RoomNumber 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
int		 
UserId		 
{		 
get		 
;		  
set		! $
;		$ %
}		& '
public

 
string

 
Type

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
Observations "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
DateTime 
AddedAt 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
Status 
{ 
get 
;  
set! $
;$ %
}& '
} 
} ‹

sC:\Users\alexg\Documents\GitHub\Room-with-a-View\StaffManagementMicroservice\StaffManagementMicroservice\Program.cs
	namespace 	'
StaffManagementMicroservice
 %
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
} ï8
éC:\Users\alexg\Documents\GitHub\Room-with-a-View\StaffManagementMicroservice\StaffManagementMicroservice\Repositories\AssignmentsRepository.cs
	namespace		 	'
StaffManagementMicroservice		
 %
.		% &
Repositories		& 2
{

 
public 

class !
AssignmentsRepository &
:' ("
IAssignmentsRepository) ?
{ 
private 
readonly 
DataContext $
_context% -
;- .
public !
AssignmentsRepository $
($ %
DataContext% 0
context1 8
)8 9
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &

Assignment& 0
>0 1
>1 2
GetAssignmentsAsync3 F
(F G
)G H
{ 	
var 
assignments 
= 
await #
_context$ ,
., -
Assignments- 8
.8 9
ToListAsync9 D
(D E
)E F
;F G
return 
assignments 
; 
} 	
public 
async 
Task 
< 

Assignment $
>$ %
GetAssignmentAsync& 8
(8 9
int9 <
id= ?
)? @
{ 	
var 

assignment 
= 
await "
_context# +
.+ ,
Assignments, 7
.7 8
Where8 =
(= >

assignment> H
=>I K

assignmentL V
.V W
IdW Y
==Z \
id] _
)_ `
.` a
FirstOrDefaultAsynca t
(t u
)u v
;v w
return 

assignment 
; 
} 	
public   
async   
Task   
<   
int   
>   
PostAssignmentAsync   2
(  2 3
PostAssignmentDto  3 D
postAssignmentDto  E V
,  V W
int  X [
userId  \ b
)  b c
{!! 	

Assignment"" 

assignment"" !
=""" #
new""$ '

Assignment""( 2
(""2 3
)""3 4
{## 
UserId$$ 
=$$ 
userId$$ 
,$$  

RoomNumber%% 
=%% 
postAssignmentDto%% .
.%%. /

RoomNumber%%/ 9
,%%9 :
Type&& 
=&& 
postAssignmentDto&& (
.&&( )
Type&&) -
,&&- .
Observations'' 
='' 
postAssignmentDto'' 0
.''0 1
Observations''1 =
,''= >
AddedAt(( 
=(( 
DateTime(( "
.((" #
Now((# &
,((& '
Status)) 
=)) 
$num)) 
}** 
;** 
_context++ 
.++ 
Add++ 
(++ 

assignment++ #
)++# $
;++$ %
await,, 
_context,, 
.,, 
SaveChangesAsync,, +
(,,+ ,
),,, -
;,,- .
return-- 
$num-- 
;-- 
}.. 	
public00 
async00 
Task00 
<00 
IEnumerable00 %
<00% &

Assignment00& 0
>000 1
>001 2'
GetAssignmentsByUserIdAsync003 N
(00N O
int00O R
userId00S Y
)00Y Z
{11 	
return22 
await22 
_context22 !
.22! "
Assignments22" -
.22- .
Where22. 3
(223 4

assignment224 >
=>22? A

assignment22B L
.22L M
UserId22M S
==22T V
userId22W ]
)22] ^
.22^ _
ToListAsync22_ j
(22j k
)22k l
;22l m
}44 	
public66 
async66 
Task66 
<66 
bool66 
>66 
UpdateAsync66  +
(66+ ,
int66, /
status660 6
,666 7
int668 ;
id66< >
)66> ?
{77 	
var88 
result88 
=88 
_context88 !
.88! "
Assignments88" -
.88- .
Find88. 2
(882 3
id883 5
)885 6
;886 7
if99 
(99 
result99 
==99 
null99 
)99 
{:: 
return;; 
false;; 
;;; 
}<< 
result== 
.== 
Status== 
=== 
status== "
;==" #
await>> 
_context>> 
.>> 
SaveChangesAsync>> +
(>>+ ,
)>>, -
;>>- .
return?? 
true?? 
;?? 
}AA 	
publicCC 
asyncCC 
TaskCC 
DeleteByIdAsyncCC )
(CC) *
intCC* -
idCC. 0
)CC0 1
{DD 	
varEE 

assignmentEE 
=EE 
awaitEE "
_contextEE# +
.EE+ ,
AssignmentsEE, 7
.EE7 8
	FindAsyncEE8 A
(EEA B
idEEB D
)EED E
;EEE F
_contextFF 
.FF 
RemoveFF 
(FF 

assignmentFF &
)FF& '
;FF' (
awaitGG 
_contextGG 
.GG 
SaveChangesAsyncGG +
(GG+ ,
)GG, -
;GG- .
}HH 	
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
boolJJ 
>JJ %
PrioritizeAssignmentAsyncJJ  9
(JJ9 :
intJJ: =
idJJ> @
)JJ@ A
{KK 	
varLL 
resultLL 
=LL 
_contextLL !
.LL! "
AssignmentsLL" -
.LL- .
FindLL. 2
(LL2 3
idLL3 5
)LL5 6
;LL6 7
ifMM 
(MM 
resultMM 
==MM 
nullMM 
)MM 
{NN 
returnOO 
falseOO 
;OO 
}PP 
foreachQQ 
(QQ 
varQQ 

assignmentQQ "
inQQ# %
_contextQQ& .
.QQ. /
AssignmentsQQ/ :
.QQ: ;
WhereQQ; @
(QQ@ A

assignmentQQA K
=>QQL N

assignmentQQO Y
.QQY Z
UserIdQQZ `
==QQa c
resultQQd j
.QQj k
UserIdQQk q
)QQq r
)QQr s
{RR 

assignmentSS 
.SS 
StatusSS !
=SS" #
$numSS$ %
;SS% &
}TT 
resultUU 
.UU 
StatusUU 
=UU 
$numUU 
;UU 
awaitVV 
_contextVV 
.VV 
SaveChangesAsyncVV +
(VV+ ,
)VV, -
;VV- .
returnWW 
trueWW 
;WW 
}XX 	
}YY 
}ZZ è
èC:\Users\alexg\Documents\GitHub\Room-with-a-View\StaffManagementMicroservice\StaffManagementMicroservice\Repositories\IAssignmentsRepository.cs
	namespace 	'
StaffManagementMicroservice
 %
.% &
Repositories& 2
{ 
public 

	interface "
IAssignmentsRepository +
{		 
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
 

Assignment

 #
>

# $
>

$ %
GetAssignmentsAsync

& 9
(

9 :
)

: ;
;

; <
Task 
< 

Assignment 
> 
GetAssignmentAsync +
(+ ,
int, /
id0 2
)2 3
;3 4
Task 
< 
int 
> 
PostAssignmentAsync %
(% &
PostAssignmentDto& 7
postAssignmentDto8 I
,I J
intK N
userIdO U
)U V
;V W
Task 
< 
IEnumerable 
< 

Assignment #
># $
>$ %'
GetAssignmentsByUserIdAsync& A
(A B
intB E
userIdF L
)L M
;M N
Task 
< 
bool 
> %
PrioritizeAssignmentAsync ,
(, -
int- 0
id1 3
)3 4
;4 5
Task 
< 
bool 
> 
UpdateAsync 
( 
int "
status# )
,) *
int+ .
id/ 1
)1 2
;2 3
Task 
DeleteByIdAsync 
( 
int  
id! #
)# $
;$ %
} 
} ’"
sC:\Users\alexg\Documents\GitHub\Room-with-a-View\StaffManagementMicroservice\StaffManagementMicroservice\Startup.cs
	namespace

 	'
StaffManagementMicroservice


 %
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
.** 
AddSwaggerGen** "
(**" #
c**# $
=>**% '
{++ 
c,, 
.,, 

SwaggerDoc,, 
(,, 
$str,, !
,,,! "
new,,# &
OpenApiInfo,,' 2
{,,3 4
Title,,5 :
=,,; <
$str,,= Z
,,,Z [
Version,,\ c
=,,d e
$str,,f j
},,k l
),,l m
;,,m n
}-- 
)-- 
;-- 
services.. 
... 
AddTransient.. !
<..! ""
IAssignmentsRepository.." 8
,..8 9!
AssignmentsRepository..: O
>..O P
(..P Q
)..Q R
;..R S
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
$str88T t
)88t u
)88u v
;88v w
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
}GG Ô
wC:\Users\alexg\Documents\GitHub\Room-with-a-View\StaffManagementMicroservice\StaffManagementMicroservice\Utils\Error.cs
	namespace 	'
StaffManagementMicroservice
 %
.% &
Utils& +
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
} ¿
yC:\Users\alexg\Documents\GitHub\Room-with-a-View\StaffManagementMicroservice\StaffManagementMicroservice\Utils\Extract.cs
	namespace 	'
StaffManagementMicroservice
 %
.% &
Utils& +
{ 
public 

static 
class 
Extract 
{		 
public

 
static

 
int

 
ExtractUserId

 +
(

+ ,
string

, 2
jwt

3 6
)

6 7
{ 
string 
claims 
= 
jwt  #
.# $
Split$ )
() *
$char* -
)- .
.. /
ToList/ 5
(5 6
)6 7
[7 8
$num8 9
]9 :
.: ;
Split; @
(@ A
$charA D
)D E
.E F
ToListF L
(L M
)M N
[N O
$numO P
]P Q
;Q R
string 
id 
= 
claims "
." #
Remove# )
() *
claims* 0
.0 1
Length1 7
-8 9
$num: ;
); <
;< =
return 
Int32 
. 
Parse "
(" #
id# %
)% &
;& '
} 
public 
static 
int 
ExtractRole )
() *
string* 0
data1 5
)5 6
{ 
int 
startPos 
= 
data #
.# $
IndexOf$ +
(+ ,
$str, 5
)5 6
;6 7
var 
res 
= 
Int32 
.  
Parse  %
(% &
data& *
.* +
	Substring+ 4
(4 5
startPos5 =
+> ?
$num@ A
,A B
$numC D
)D E
)E F
;F G
return 
res 
; 
} 
} 
} 