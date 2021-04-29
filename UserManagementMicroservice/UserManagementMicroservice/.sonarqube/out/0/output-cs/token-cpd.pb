Ÿç
ÖC:\Users\alexg\Documents\GitHub\Room-with-a-View\UserManagementMicroservice\UserManagementMicroservice\Controllers\UsersController.cs
	namespace 	&
UserManagementMicroservice
 $
.$ %
Controllers% 0
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
UsersController  
:! "
ControllerBase# 1
{ 
private 
readonly 
IUsersRepository )
_repository* 5
;5 6
public 
UsersController 
( 
IUsersRepository /

repository0 :
): ;
{ 	
_repository 
= 

repository $
;$ %
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetAllAsync) 4
(4 5
[5 6

FromHeader6 @
]@ A
stringB H
authorizationTokenI [
)[ \
{ 	
var 
result 
= 
	CheckAuth  
(  !
authorizationToken! 3
)3 4
as5 7
ObjectResult8 D
;D E
var   
response   
=   
await    
_repository  ! ,
.  , -
GetAllAsync  - 8
(  8 9
Jwt  9 <
.  < =
ExtractUserId  = J
(  J K
result  K Q
.  Q R
Value  R W
.  W X
ToString  X `
(  ` a
)  a b
)  b c
)  c d
;  d e
if!! 
(!! 
response!! 
==!! 
null!!  
)!!  !
{"" 
return## 
Unauthorized## #
(### $
new##$ '
Error##( -
(##- .
$str##. I
)##I J
)##J K
;##K L
}$$ 
return%% 
Ok%% 
(%% 
response%% 
)%% 
;%%  
}&& 	
[(( 	
HttpGet((	 
((( 
$str(( 
,(( 
Name(( 
=(( 
$str((  )
)(() *
]((* +
public)) 
async)) 
Task)) 
<)) 
User)) 
>)) 
GetById))  '
())' (
int))( +
id)), .
))). /
=>))0 2
await))3 8
_repository))9 D
.))D E
GetByIdAsync))E Q
())Q R
id))R T
)))T U
;))U V
[++ 	
Route++	 
(++ 
$str++ 
)++ 
]++  
[,, 	
HttpGet,,	 
],, 
public.. 
IActionResult.. 
	CheckAuth.. &
(..& '
[..' (

FromHeader..( 2
]..2 3
string..4 :
authorizationToken..; M
)..M N
{// 	
var00 
result00 
=00 
Jwt00 
.00 
CheckJWT00 %
(00% &
authorizationToken00& 8
)008 9
;009 :
if11 
(11 
!11 
Jwt11 
.11 

IsValidJWT11 
(11  
result11  &
)11& '
)11' (
{22 
return33 
Unauthorized33 #
(33# $
new33$ '
Error33( -
(33- .
result33. 4
)334 5
)335 6
;336 7
}44 
return55 
Ok55 
(55 
result55 
)55 
;55 
}66 	
[88 	
Route88	 
(88 
$str88 
)88 
]88 
[99 	
HttpGet99	 
]99 
public:: 
async:: 
Task:: 
<:: 
IActionResult:: '
>::' (
GetAsync::) 1
(::1 2
[::2 3

FromHeader::3 =
]::= >
string::? E
authorizationToken::F X
)::X Y
{;; 	
var<< 
result<< 
=<< 
	CheckAuth<< "
(<<" #
authorizationToken<<# 5
)<<5 6
as<<7 9
ObjectResult<<: F
;<<F G
var== 
response== 
=== 
await==  
_repository==! ,
.==, -
GetByIdAsync==- 9
(==9 :
Jwt==: =
.=== >
ExtractUserId==> K
(==K L
result==L R
.==R S
Value==S X
.==X Y
ToString==Y a
(==a b
)==b c
)==c d
)==d e
;==e f
return>> 
Ok>> 
(>> 
response>> 
)>> 
;>>  
}?? 	
[AA 	
RouteAA	 
(AA 
$strAA 
)AA 
]AA 
[BB 	
HttpGetBB	 
]BB 
publicCC 
asyncCC 
TaskCC 
<CC 
IActionResultCC '
>CC' (
GetUsernameAsyncCC) 9
(CC9 :
[CC: ;

FromHeaderCC; E
]CCE F
stringCCG M
authorizationTokenCCN `
)CC` a
{DD 	
varEE 
resultEE 
=EE 
	CheckAuthEE "
(EE" #
authorizationTokenEE# 5
)EE5 6
asEE7 9
ObjectResultEE: F
;EEF G
varFF 
userFF 
=FF 
awaitFF 
_repositoryFF (
.FF( )
GetByIdAsyncFF) 5
(FF5 6
JwtFF6 9
.FF9 :
ExtractUserIdFF: G
(FFG H
resultFFH N
.FFN O
ValueFFO T
.FFT U
ToStringFFU ]
(FF] ^
)FF^ _
)FF_ `
)FF` a
;FFa b
ifGG 
(GG 
userGG 
==GG 
nullGG 
)GG 
{HH 
returnII 
NotFoundII 
(II  
newII  #
ErrorII$ )
(II) *
$strII* ?
)II? @
)II@ A
;IIA B
}JJ 
returnKK 
OkKK 
(KK 
JsonConvertKK !
.KK! "
SerializeObjectKK" 1
(KK1 2
newKK2 5
{KK6 7
usernameKK8 @
=KKA B
userKKC G
.KKG H
UsernameKKH P
}KKQ R
)KKR S
)KKS T
;KKT U
}LL 	
[NN 	
RouteNN	 
(NN 
$strNN 
)NN  
]NN  !
[OO 	
HttpPostOO	 
]OO 
publicPP 
asyncPP 
TaskPP 
<PP 
IActionResultPP '
>PP' (
RegisterGuestAsyncPP) ;
(PP; <
[PP< =
FromBodyPP= E
]PPE F
UserRegisterDtoPPG V
userRegisterPPW c
)PPc d
{QQ 	
varRR 
resultRR 
=RR 
awaitRR 
_repositoryRR *
.RR* +
RegisterAsyncRR+ 8
(RR8 9
userRegisterRR9 E
,RRE F
$numRRG H
)RRH I
;RRI J
ifSS 
(SS 
resultSS 
==SS 
-SS 
$numSS 
)SS 
{TT 
returnUU 
ConflictUU 
(UU  
newUU  #
ErrorUU$ )
(UU) *
$strUU* @
)UU@ A
)UUA B
;UUB C
}VV 
ifWW 
(WW 
resultWW 
==WW 
-WW 
$numWW 
)WW 
{XX 
returnYY 
ConflictYY 
(YY  
newYY  #
ErrorYY$ )
(YY) *
$strYY* C
)YYC D
)YYD E
;YYE F
}ZZ 
return[[ 
CreatedAtAction[[ "
([[" #
nameof[[# )
([[) *
GetById[[* 1
)[[1 2
,[[2 3
new[[4 7
{[[8 9
id[[: <
=[[= >
result[[? E
}[[F G
,[[G H
userRegister[[I U
)[[U V
;[[V W
}\\ 	
[^^ 	
Route^^	 
(^^ 
$str^^ 
)^^  
]^^  !
[__ 	
HttpPost__	 
]__ 
public`` 
async`` 
Task`` 
<`` 
IActionResult`` '
>``' (
RegisterAdminAsync``) ;
(``; <
[``< =

FromHeader``= G
]``G H
string``I O
authorizationToken``P b
,``b c
[``d e
FromBody``e m
]``m n
UserRegisterDto``o ~
userRegister	`` ã
)
``ã å
{aa 	
varbb 
jwtbb 
=bb 
	CheckAuthbb 
(bb  
authorizationTokenbb  2
)bb2 3
asbb4 6
ObjectResultbb7 C
;bbC D
ifcc 
(cc 
!cc 
awaitcc 
_repositorycc #
.cc# $
HasAdminPrivilegescc$ 6
(cc6 7
Jwtcc7 :
.cc: ;
ExtractUserIdcc; H
(ccH I
jwtccI L
.ccL M
ValueccM R
.ccR S
ToStringccS [
(cc[ \
)cc\ ]
)cc] ^
)cc^ _
)cc_ `
{dd 
returnee 
Unauthorizedee #
(ee# $
newee$ '
Erroree( -
(ee- .
$stree. I
)eeI J
)eeJ K
;eeK L
}ff 
vargg 
resultgg 
=gg 
awaitgg 
_repositorygg *
.gg* +
RegisterAsyncgg+ 8
(gg8 9
userRegistergg9 E
,ggE F
$numggG H
)ggH I
;ggI J
ifhh 
(hh 
resulthh 
==hh 
-hh 
$numhh 
)hh 
{ii 
returnjj 
Conflictjj 
(jj  
newjj  #
Errorjj$ )
(jj) *
$strjj* @
)jj@ A
)jjA B
;jjB C
}kk 
ifll 
(ll 
resultll 
==ll 
-ll 
$numll 
)ll 
{mm 
returnnn 
Conflictnn 
(nn  
newnn  #
Errornn$ )
(nn) *
$strnn* C
)nnC D
)nnD E
;nnE F
}oo 
returnpp 
CreatedAtActionpp "
(pp" #
nameofpp# )
(pp) *
GetByIdpp* 1
)pp1 2
,pp2 3
newpp4 7
{pp8 9
idpp: <
=pp= >
resultpp? E
}ppF G
,ppG H
userRegisterppI U
)ppU V
;ppV W
}qq 	
[ss 	
Routess	 
(ss 
$strss 
)ss  
]ss  !
[tt 	
HttpPosttt	 
]tt 
publicuu 
asyncuu 
Taskuu 
<uu 
IActionResultuu '
>uu' (
RegisterStaffAsyncuu) ;
(uu; <
[uu< =

FromHeaderuu= G
]uuG H
stringuuI O
authorizationTokenuuP b
,uub c
[uud e
FromBodyuue m
]uum n
UserRegisterDtouuo ~
userRegister	uu ã
)
uuã å
{vv 	
varww 
jwtww 
=ww 
	CheckAuthww 
(ww  
authorizationTokenww  2
)ww2 3
asww4 6
ObjectResultww7 C
;wwC D
ifxx 
(xx 
!xx 
awaitxx 
_repositoryxx "
.xx" #
HasAdminPrivilegesxx# 5
(xx5 6
Jwtxx6 9
.xx9 :
ExtractUserIdxx: G
(xxG H
jwtxxH K
.xxK L
ValuexxL Q
.xxQ R
ToStringxxR Z
(xxZ [
)xx[ \
)xx\ ]
)xx] ^
)xx^ _
{yy 
returnzz 
Unauthorizedzz #
(zz# $
newzz$ '
Errorzz( -
(zz- .
$strzz. I
)zzI J
)zzJ K
;zzK L
}{{ 
var|| 
result|| 
=|| 
await|| 
_repository|| *
.||* +
RegisterAsync||+ 8
(||8 9
userRegister||9 E
,||E F
$num||G H
)||H I
;||I J
if}} 
(}} 
result}} 
==}} 
-}} 
$num}} 
)}} 
{~~ 
return 
Conflict 
(  
new  #
Error$ )
() *
$str* @
)@ A
)A B
;B C
}
ÄÄ 
if
ÅÅ 
(
ÅÅ 
result
ÅÅ 
==
ÅÅ 
-
ÅÅ 
$num
ÅÅ 
)
ÅÅ 
{
ÇÇ 
return
ÉÉ 
Conflict
ÉÉ 
(
ÉÉ  
new
ÉÉ  #
Error
ÉÉ$ )
(
ÉÉ) *
$str
ÉÉ* C
)
ÉÉC D
)
ÉÉD E
;
ÉÉE F
}
ÑÑ 
return
ÖÖ 
CreatedAtAction
ÖÖ "
(
ÖÖ" #
nameof
ÖÖ# )
(
ÖÖ) *
GetById
ÖÖ* 1
)
ÖÖ1 2
,
ÖÖ2 3
new
ÖÖ4 7
{
ÖÖ8 9
id
ÖÖ: <
=
ÖÖ= >
result
ÖÖ? E
}
ÖÖF G
,
ÖÖG H
userRegister
ÖÖI U
)
ÖÖU V
;
ÖÖV W
}
ÜÜ 	
[
àà 	
Route
àà	 
(
àà 
$str
àà 
)
àà 
]
àà 
[
ââ 	
HttpPost
ââ	 
]
ââ 
public
ää 
async
ää 
Task
ää 
<
ää 
IActionResult
ää '
>
ää' (

LoginAsync
ää) 3
(
ää3 4
[
ää4 5
FromBody
ää5 =
]
ää= > 
UserCredentialsDto
ää? Q
userCredentials
ääR a
)
ääa b
{
ãã 	
var
åå 
user
åå 
=
åå 
await
åå 
_repository
åå (
.
åå( )

LoginAsync
åå) 3
(
åå3 4
userCredentials
åå4 C
)
ååC D
;
ååD E
if
çç 
(
çç 
user
çç 
==
çç 
null
çç 
)
çç 
{
éé 
return
èè 

BadRequest
èè !
(
èè! "
new
èè" %
Error
èè& +
(
èè+ ,
$str
èè, G
)
èèG H
)
èèH I
;
èèI J
}
êê 
string
ëë 
userRole
ëë 
=
ëë 
(
ëë 
(
ëë  
Role
ëë  $
)
ëë$ %
user
ëë% )
.
ëë) *
Role
ëë* .
)
ëë. /
.
ëë/ 0
ToString
ëë0 8
(
ëë8 9
)
ëë9 :
;
ëë: ;
return
íí 
Ok
íí 
(
íí 
JsonConvert
íí !
.
íí! "
SerializeObject
íí" 1
(
íí1 2
new
íí2 5
{
íí6 7
jwt
íí8 ;
=
íí< =
Jwt
íí> A
.
ííA B
	CreateJWT
ííB K
(
ííK L
user
ííL P
.
ííP Q
Id
ííQ S
,
ííS T
$num
ííU V
)
ííV W
,
ííW X
role
ííY ]
=
íí^ _
userRole
íí` h
}
ííi j
)
ííj k
)
íík l
;
ííl m
}
ïï 	
[
óó 	
HttpPut
óó	 
]
óó 
public
òò 
async
òò 
Task
òò 
<
òò 
IActionResult
òò '
>
òò' (
UpdateAsync
òò) 4
(
òò4 5
[
òò5 6
FromBody
òò6 >
]
òò> ?
UserRegisterDto
òò@ O
user
òòP T
,
òòT U
[
òòU V

FromHeader
òòV `
]
òò` a
string
òòb h 
authorizationToken
òòi {
)
òò{ |
{
ôô 	
var
öö 
result
öö 
=
öö 
	CheckAuth
öö "
(
öö" # 
authorizationToken
öö# 5
)
öö5 6
as
öö7 9
ObjectResult
öö: F
;
ööF G
bool
õõ 
	isUpdated
õõ 
=
õõ 
await
õõ "
_repository
õõ# .
.
õõ. /
UpdateAsync
õõ/ :
(
õõ: ;
user
õõ; ?
,
õõ? @
Jwt
õõA D
.
õõD E
ExtractUserId
õõE R
(
õõR S
result
õõS Y
.
õõY Z
Value
õõZ _
.
õõ_ `
ToString
õõ` h
(
õõh i
)
õõi j
)
õõj k
)
õõk l
;
õõl m
if
úú 
(
úú 
!
úú 
	isUpdated
úú 
)
úú 
{
ùù 
return
ûû 
NotFound
ûû 
(
ûû  
new
ûû  #
Error
ûû$ )
(
ûû) *
$str
ûû* >
)
ûû> ?
)
ûû? @
;
ûû@ A
}
üü 
return
†† 
	NoContent
†† 
(
†† 
)
†† 
;
†† 
}
°° 	
[
££ 	

HttpDelete
££	 
]
££ 
public
§§ 
async
§§ 
Task
§§ 
<
§§ 
IActionResult
§§ '
>
§§' (
DeleteAsync
§§) 4
(
§§4 5
[
§§5 6

FromHeader
§§6 @
]
§§@ A
string
§§B H 
authorizationToken
§§I [
)
§§[ \
{
•• 	
var
¶¶ 
result
¶¶ 
=
¶¶ 
	CheckAuth
¶¶ "
(
¶¶" # 
authorizationToken
¶¶# 5
)
¶¶5 6
as
¶¶7 9
ObjectResult
¶¶: F
;
¶¶F G
await
ßß 
_repository
ßß 
.
ßß 
DeleteByIdAsync
ßß -
(
ßß- .
Jwt
ßß. 1
.
ßß1 2
ExtractUserId
ßß2 ?
(
ßß? @
result
ßß@ F
.
ßßF G
Value
ßßG L
.
ßßL M
ToString
ßßM U
(
ßßU V
)
ßßV W
)
ßßW X
)
ßßX Y
;
ßßY Z
return
®® 
	NoContent
®® 
(
®® 
)
®® 
;
®® 
}
™™ 	
}
¨¨ 
}≠≠ ˙

zC:\Users\alexg\Documents\GitHub\Room-with-a-View\UserManagementMicroservice\UserManagementMicroservice\Data\DataContext.cs
	namespace 	&
UserManagementMicroservice
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
User 
> 
Users  
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
User  $
>$ %
(% &
)& '
. 
Property !
(! "
user" &
=>' )
user* .
.. /
Id/ 1
)1 2
. 
ValueGeneratedOnAdd ,
(, -
)- .
;. /
} 	
} 
} »
C:\Users\alexg\Documents\GitHub\Room-with-a-View\UserManagementMicroservice\UserManagementMicroservice\Data\IUsersRepository.cs
	namespace 	&
UserManagementMicroservice
 $
.$ %
Data% )
{ 
public		 

	interface		 
IUsersRepository		 %
{

 
Task 
< 
int 
> 
RegisterAsync 
(  
UserRegisterDto  /
userRegister0 <
,< =
int> A
roleB F
)F G
;G H
Task 
< 
User 
> 

LoginAsync 
( 
UserCredentialsDto 0
userCredentials1 @
)@ A
;A B
Task 
< 
IEnumerable 
< 
User 
> 
> 
GetAllAsync  +
(+ ,
int, /
userId0 6
)6 7
;7 8
Task 
< 
User 
> 
GetByIdAsync 
(  
int  #
userId$ *
)* +
;+ ,
Task 
< 
bool 
> 
UpdateAsync 
( 
UserRegisterDto .
user/ 3
,3 4
int5 8
userId9 ?
)? @
;@ A
Task 
DeleteByIdAsync 
( 
int  
userId! '
)' (
;( )
Task 
< 
bool 
> 
HasAdminPrivileges %
(% &
int& )
userId* 0
)0 1
;1 2
} 
} ÷
ñC:\Users\alexg\Documents\GitHub\Room-with-a-View\UserManagementMicroservice\UserManagementMicroservice\Data\Migrations\20210420162254_InitialCreate.cs
	namespace 	&
UserManagementMicroservice
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
,A B
Username 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
type4 8
:8 9
$str: @
,@ A
nullableB J
:J K
trueL P
)P Q
,Q R
Email 
= 
table !
.! "
Column" (
<( )
string) /
>/ 0
(0 1
type1 5
:5 6
$str7 =
,= >
nullable? G
:G H
trueI M
)M N
,N O
Password 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
type4 8
:8 9
$str: @
,@ A
nullableB J
:J K
trueL P
)P Q
,Q R
Role 
= 
table  
.  !
Column! '
<' (
int( +
>+ ,
(, -
type- 1
:1 2
$str3 <
,< =
nullable> F
:F G
falseH M
)M N
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% /
,/ 0
x1 2
=>3 5
x6 7
.7 8
Id8 :
): ;
;; <
} 
) 
; 
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder 
. 
	DropTable &
(& '
name 
: 
$str 
) 
; 
} 	
} 
}   ö
sC:\Users\alexg\Documents\GitHub\Room-with-a-View\UserManagementMicroservice\UserManagementMicroservice\Data\Role.cs
	namespace 	&
UserManagementMicroservice
 $
.$ %
Data% )
{ 
public 

enum 
Role 
{		 
Guest

 
,

 
Admin 
, 
Staff 
} 
} ¢G
~C:\Users\alexg\Documents\GitHub\Room-with-a-View\UserManagementMicroservice\UserManagementMicroservice\Data\UsersRepository.cs
	namespace

 	&
UserManagementMicroservice
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
UsersRepository  
:! "
IUsersRepository# 3
{ 
private 
readonly 
DataContext $
context% ,
;, -
public 
UsersRepository 
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
< 
int 
> 
RegisterAsync ,
(, -
UserRegisterDto- <
userRegister= I
,I J
intK N
roleO S
)S T
{ 	
if 
( 
this 
. 
context 
. 
Users !
.! "
Any" %
(% &
user& *
=>+ -
user. 2
.2 3
Username3 ;
==< >
userRegister? K
.K L
UsernameL T
)T U
)U V
{ 
return 
- 
$num 
; 
} 
if 
( 
this 
. 
context 
. 
Users !
.! "
Any" %
(% &
user& *
=>+ -
user. 2
.2 3
Email3 8
==9 ;
Cryptography< H
.H I

HashStringI S
(S T
userRegisterT `
.` a
Emaila f
)f g
)g h
)h i
{ 
return 
- 
$num 
; 
} 
User 
registerUser 
= 
new "
User# '
(' (
userRegister( 4
.4 5
Username5 =
,= >
userRegister? K
.K L
EmailL Q
,Q R
userRegisterS _
._ `
Password` h
,h i
rolej n
)n o
;o p
var   
user   
=   
this   
.   
context   #
.  # $
Add  $ '
(  ' (
Cryptography  ( 4
.  4 5
HashUserData  5 A
(  A B
registerUser  B N
)  N O
)  O P
;  P Q
await!! 
this!! 
.!! 
context!! 
.!! 
SaveChangesAsync!! /
(!!/ 0
)!!0 1
;!!1 2
return"" 
user"" 
."" 
Entity"" 
."" 
Id"" !
;""! "
}## 	
public%% 
async%% 
Task%% 
<%% 
User%% 
>%% 

LoginAsync%%  *
(%%* +
UserCredentialsDto%%+ =
userCredentials%%> M
)%%M N
{&& 	
var'' 
user'' 
='' 
await'' 
this'' !
.''! "
context''" )
.'') *
Users''* /
.''/ 0
Where''0 5
(''5 6
user''6 :
=>''; =
user''> B
.''B C
Email''C H
==''I K
Cryptography''L X
.''X Y

HashString''Y c
(''c d
userCredentials''d s
.''s t
Email''t y
)''y z
&&((* ,
user((- 1
.((1 2
Password((2 :
==((; =
Cryptography((> J
.((J K

HashString((K U
(((U V
userCredentials((V e
.((e f
Password((f n
)((n o
)((o p
.((p q 
FirstOrDefaultAsync	((q Ñ
(
((Ñ Ö
)
((Ö Ü
;
((Ü á
if)) 
()) 
user)) 
==)) 
null)) 
))) 
{** 
return++ 
null++ 
;++ 
},, 
return-- 
user-- 
;-- 
}// 	
public11 
async11 
Task11 
<11 
bool11 
>11 
UpdateAsync11  +
(11+ ,
UserRegisterDto11, ;
user11< @
,11@ A
int11B E
userId11F L
)11L M
{22 	
var33
 
result33 
=33 
this33 
.33 
context33 #
.33# $
Users33$ )
.33) *
Find33* .
(33. /
userId33/ 5
)335 6
;336 7
result44
 
.44 
Username44 
=44 
user44  
.44  !
Username44! )
??44* ,
result44- 3
.443 4
Username444 <
;44< =
result55
 
.55 
Email55 
=55 
Cryptography55 %
.55% &

HashString55& 0
(550 1
user551 5
.555 6
Email556 ;
)55; <
??55= ?
result55@ F
.55F G
Email55G L
;55L M
result66
 
.66 
Password66 
=66 
Cryptography66 (
.66( )

HashString66) 3
(663 4
user664 8
.668 9
Password669 A
)66A B
??66C E
result66F L
.66L M
Password66M U
;66U V
await77
 
this77 
.77 
context77 
.77 
SaveChangesAsync77 -
(77- .
)77. /
;77/ 0
return88
 
true88 
;88 
}99 	
public;; 
async;; 
Task;; 
<;; 
IEnumerable;; %
<;;% &
User;;& *
>;;* +
>;;+ ,
GetAllAsync;;- 8
(;;8 9
int;;9 <
userId;;= C
);;C D
{<< 	
var== 
result== 
=== 
await== 
this== #
.==# $
context==$ +
.==+ ,
Users==, 1
.==1 2
	FindAsync==2 ;
(==; <
userId==< B
)==B C
;==C D
if>> 
(>> 
result>> 
==>> 
null>> 
||>>  
result>>! '
.>>' (
Role>>( ,
!=>>- /
$num>>0 1
)>>1 2
{?? 
return@@ 
null@@ 
;@@ 
}AA 
returnBB 
awaitBB 
thisBB 
.BB 
contextBB %
.BB% &
UsersBB& +
.BB+ ,
ToListAsyncBB, 7
(BB7 8
)BB8 9
;BB9 :
}CC 	
publicEE 
asyncEE 
TaskEE 
<EE 
UserEE 
>EE 
GetByIdAsyncEE  ,
(EE, -
intEE- 0
userIdEE1 7
)EE7 8
{FF 	
returnGG 
awaitGG 
thisGG 
.GG 
contextGG %
.GG% &
UsersGG& +
.GG+ ,
	FindAsyncGG, 5
(GG5 6
userIdGG6 <
)GG< =
;GG= >
}HH 	
publicJJ 
asyncJJ 
TaskJJ 
DeleteByIdAsyncJJ )
(JJ) *
intJJ* -
userIdJJ. 4
)JJ4 5
{KK 	
varLL 
userLL 
=LL 
awaitLL 
thisLL !
.LL! "
contextLL" )
.LL) *
UsersLL* /
.LL/ 0
	FindAsyncLL0 9
(LL9 :
userIdLL: @
)LL@ A
;LLA B
thisMM 
.MM 
contextMM 
.MM 
RemoveMM 
(MM  
userMM  $
)MM$ %
;MM% &
awaitNN 
thisNN 
.NN 
contextNN 
.NN 
SaveChangesAsyncNN /
(NN/ 0
)NN0 1
;NN1 2
}PP 	
publicQQ 
asyncQQ 
TaskQQ 
<QQ 
boolQQ 
>QQ 
HasAdminPrivilegesQQ  2
(QQ2 3
intQQ3 6
userIdQQ7 =
)QQ= >
{RR 	
varSS 
userSS 
=SS 
awaitSS 
thisSS !
.SS! "
contextSS" )
.SS) *
UsersSS* /
.SS/ 0
	FindAsyncSS0 9
(SS9 :
userIdSS: @
)SS@ A
;SSA B
ifTT 
(TT 
userTT 
==TT 
nullTT 
)TT 
{UU 
returnVV 
falseVV 
;VV 
}WW 
ifXX 
(XX 
userXX 
.XX 
RoleXX 
==XX 
$numXX 
)XX 
{YY 
returnZZ 
trueZZ 
;ZZ 
}[[ 
return\\ 
false\\ 
;\\ 
}]] 	
}^^ 
}__ ñ
ÅC:\Users\alexg\Documents\GitHub\Room-with-a-View\UserManagementMicroservice\UserManagementMicroservice\DTOs\UserCredentialsDto.cs
	namespace 	&
UserManagementMicroservice
 $
.$ %
DTOs% )
{ 
public 

class 
UserCredentialsDto #
{ 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
}		 ´
~C:\Users\alexg\Documents\GitHub\Room-with-a-View\UserManagementMicroservice\UserManagementMicroservice\DTOs\UserRegisterDto.cs
	namespace 	&
UserManagementMicroservice
 $
.$ %
DTOs% )
{ 
public 

class 
UserRegisterDto  
{ 
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
}		 
}

 –
wC:\Users\alexg\Documents\GitHub\Room-with-a-View\UserManagementMicroservice\UserManagementMicroservice\Entities\User.cs
	namespace 	&
UserManagementMicroservice
 $
.$ %
Entities% -
{ 
public 

class 
User 
{ 
public 
User 
( 
) 
{ 	
} 	
public		 
User		 
(		 
string		 
username		 #
,		# $
string		% +
email		, 1
,		1 2
string		3 9
password		: B
,		B C
int		C F
role		G K
)		K L
{

 	
Username 
= 
username 
;  
Email 
= 
email 
; 
Password 
= 
password 
;  
Role 
= 
role 
; 
} 	
public 
User 
( 
int 
Id 
, 
string "
username# +
,+ ,
string- 3
email4 9
,9 :
string; A
passwordB J
)J K
{ 	
this 
. 
Id 
= 
Id 
; 
Username 
= 
username 
;  
Email 
= 
email 
; 
Password 
= 
password 
;  
} 	
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
Role 
{ 
get 
; 
set "
;" #
}$ %
} 
}   Ì

qC:\Users\alexg\Documents\GitHub\Room-with-a-View\UserManagementMicroservice\UserManagementMicroservice\Program.cs
	namespace 	&
UserManagementMicroservice
 $
{ 
public 

static 
class 
Program 
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
qC:\Users\alexg\Documents\GitHub\Room-with-a-View\UserManagementMicroservice\UserManagementMicroservice\Startup.cs
	namespace

 	&
UserManagementMicroservice
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
IUsersRepository**" 2
,**2 3
UsersRepository**4 C
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
}GG ⁄
|C:\Users\alexg\Documents\GitHub\Room-with-a-View\UserManagementMicroservice\UserManagementMicroservice\Utils\Cryptography.cs
	namespace 	&
UserManagementMicroservice
 $
.$ %
Utils% *
{ 
public 

static 
class 
Cryptography $
{ 
static		 
readonly		 
byte		 
[		 
]		 
salt		 #
=		$ %
{		& '
$num		( ,
,		, -
$num		. 2
,		2 3
$num		4 8
,		8 9
$num		: >
,		> ?
$num		@ D
,		D E
$num		F J
,		J K
$num		L P
,		P Q
$num		R V
,		V W
$num		X \
,		\ ]
$num		^ b
,		b c
$num		d h
,		h i
$num		j n
,		n o
$num		p t
,		t u
$num		v z
,		z {
$num			| Ä
,
		Ä Å
$num
		Ç Ü
}
		á à
;
		à â
public

 
static

 
User

 
HashUserData

 (
(

( )
User

) -
user

. 2
)

2 3
{ 	
User 

userHashed 
= 
new !
User" &
(& '
user' +
.+ ,
Username, 4
,4 5

HashString6 @
(@ A
userA E
.E F
EmailF K
)K L
,L M

HashStringN X
(X Y
userY ]
.] ^
Password^ f
)f g
,g h
useri m
.m n
Rolen r
)r s
;s t
return 

userHashed 
; 
} 	
public 
static 
string 

HashString '
(' (
string( .
	plaintext/ 8
)8 9
{ 	
if 
( 
	plaintext 
== 
null  
)  !
{ 
return 
null 
; 
} 
string 
hashed 
= 
Convert #
.# $
ToBase64String$ 2
(2 3
KeyDerivation3 @
.@ A
Pbkdf2A G
(G H
password 
: 
	plaintext 
, 
salt 
: 
salt 
, 
prf 
: 
KeyDerivationPrf  
.  !
HMACSHA1! )
,) *
iterationCount 
: 
$num  
,  !
numBytesRequested 
: 
$num !
/" #
$num$ %
)% &
)& '
;' (
return 
hashed 
; 
} 	
} 
} Ï
uC:\Users\alexg\Documents\GitHub\Room-with-a-View\UserManagementMicroservice\UserManagementMicroservice\Utils\Error.cs
	namespace 	&
UserManagementMicroservice
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
} ‡'
sC:\Users\alexg\Documents\GitHub\Room-with-a-View\UserManagementMicroservice\UserManagementMicroservice\Utils\Jwt.cs
	namespace

 	&
UserManagementMicroservice


 $
.

$ %
Utils

% *
{ 
public 

static 
class 
Jwt 
{ 
public 
static 
string 
	CreateJWT &
(& '
int' *
userId+ 1
,1 2
int3 6
time7 ;
); <
{ 	
var 
token 
= 
new 

JwtBuilder &
(& '
)' (
. 
WithAlgorithm )
() *
new* -
HMACSHA256Algorithm. A
(A B
)B C
)C D
. 

WithSecret &
(& '
$str' Q
)Q R
. 
AddClaim $
($ %
$str% *
,* +
DateTimeOffset, :
.: ;
UtcNow; A
.A B
AddHoursB J
(J K
timeK O
)O P
.P Q
ToUnixTimeSecondsQ b
(b c
)c d
)d e
. 
AddClaim $
($ %
$str% -
,- .
userId/ 5
)5 6
. 
Encode "
(" #
)# $
;$ %
return 
token 
; 
} 	
public 
static 
string 
CheckJWT %
(% &
string& ,
jwt- 0
)0 1
{ 	
string 
json 
; 
try 
{ 
IJsonSerializer 

serializer  *
=+ ,
new- 0
JsonNetSerializer1 B
(B C
)C D
;D E
var 
provider 
= 
new "
UtcDateTimeProvider# 6
(6 7
)7 8
;8 9
IJwtValidator   
	validator   '
=  ( )
new  * -
JwtValidator  . :
(  : ;

serializer  ; E
,  E F
provider  G O
)  O P
;  P Q
IBase64UrlEncoder!! !

urlEncoder!!" ,
=!!- .
new!!/ 2
JwtBase64UrlEncoder!!3 F
(!!F G
)!!G H
;!!H I
IJwtAlgorithm"" 
	algorithm"" '
=""( )
new""* -
HMACSHA256Algorithm"". A
(""A B
)""B C
;""C D
IJwtDecoder## 
decoder## #
=##$ %
new##& )

JwtDecoder##* 4
(##4 5

serializer##5 ?
,##? @
	validator##A J
,##J K

urlEncoder##L V
,##V W
	algorithm##X a
)##a b
;##b c
json$$ 
=$$ 
decoder$$ 
.$$ 
Decode$$ %
($$% &
jwt$$& )
,$$) *
$str$$+ U
,$$U V
verify$$W ]
:$$] ^
true$$_ c
)$$c d
;$$d e
}%% 
catch&& 
(&& !
TokenExpiredException&& (
)&&( )
{'' 
return(( 
$str(( *
;((* +
})) 
catch** 
(** *
SignatureVerificationException** 1
)**1 2
{++ 
return,, 
$str,, 4
;,,4 5
}-- 
return.. 
json.. 
;.. 
}// 	
public11 
static11 
bool11 

IsValidJWT11 %
(11% &
string11& ,
jwt11- 0
)110 1
{22 	
if33 
(33 
jwt33 
==33 
$str33 )
||33* ,
jwt33- 0
==331 3
$str334 Q
)33Q R
{44 
return55 
false55 
;55 
}66 
return77 
true77 
;77 
}88 	
public:: 
static:: 
int:: 
ExtractUserId:: '
(::' (
string::( .
jwt::/ 2
)::2 3
{;; 	
string<< 
claims<< 
=<< 
jwt<< 
.<<  
Split<<  %
(<<% &
$char<<& )
)<<) *
.<<* +
ToList<<+ 1
(<<1 2
)<<2 3
[<<3 4
$num<<4 5
]<<5 6
.<<6 7
Split<<7 <
(<<< =
$char<<= @
)<<@ A
.<<A B
ToList<<B H
(<<H I
)<<I J
[<<J K
$num<<K L
]<<L M
;<<M N
string== 
id== 
=== 
claims== 
.== 
Remove== %
(==% &
claims==& ,
.==, -
Length==- 3
-==4 5
$num==6 7
)==7 8
;==8 9
return>> 
Int32>> 
.>> 
Parse>> 
(>> 
id>> !
)>>! "
;>>" #
}?? 	
}@@ 
}AA 