�-
�C:\Users\alexg\Documents\GitHub\Room-with-a-View\UserManagementMicroservice\UserManagementMicroservice\Controllers\UsersController.cs
	namespace		 	&
UserManagementMicroservice		
 $
.		$ %
Controllers		% 0
{

 
[ 
Route 

(
 
$str 
) 
] 
[ 

] 
public 

class 
UsersController  
:! "
ControllerBase# 1
{ 
private 
readonly 
IUsersRepository )
_repository* 5
;5 6
public 
UsersController 
( 
IUsersRepository /

repository0 :
): ;
{ 	
_repository 
= 

repository $
;$ %
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IEnumerable %
<% &
User& *
>* +
>+ ,
GetAsync- 5
(5 6
)6 7
{ 	
return 
await 
_repository $
.$ %
GetAllAsync% 0
(0 1
)1 2
;2 3
} 	
[ 	
HttpGet	 
( 
$str 
, 
Name 
= 
$str  )
)) *
]* +
public   
async   
Task   
<   
User   
>   
GetByIdAsync    ,
(  , -
int  - 0
id  1 3
)  3 4
=>  5 7
await  8 =
_repository  > I
.  I J
GetByIdAsync  J V
(  V W
id  W Y
)  Y Z
;  Z [
["" 	
Route""	 
("" 
$str"" 
)"" 
]"" 
[## 	
HttpPost##	 
]## 
public$$ 
async$$ 
Task$$ 
<$$ 

>$$' (

($$6 7
[$$7 8
FromBody$$8 @
]$$@ A
UserRegister$$B N
userRegister$$O [
)$$[ \
{%% 	
var&& 
result&& 
=&& 
await&& 
_repository&& *
.&&* +

(&&8 9
userRegister&&9 E
)&&E F
;&&F G
if'' 
('' 
result'' 
=='' 
-'' 
$num'' 
)'' 
{(( 
return)) 
Conflict)) 
())  
new))  #
Error))$ )
())) *
$str))* @
)))@ A
)))A B
;))B C
}** 
if++ 
(++ 
result++ 
==++ 
-++ 
$num++ 
)++ 
{,, 
return-- 
Conflict-- 
(--  
new--  #
Error--$ )
(--) *
$str--* C
)--C D
)--D E
;--E F
}.. 
return// 
Ok// 
(// 
)// 
;// 
}00 	
[22 	
Route22	 
(22 
$str22 
)22 
]22 
[33 	
HttpPost33	 
]33 
public44 
async44 
Task44 
<44 

>44' (

LoginAsync44) 3
(443 4
[444 5
FromBody445 =
]44= >
UserCredentials44? N
userCredentials44O ^
)44^ _
{55 	
var66 
result66 
=66 
await66 
_repository66 *
.66* +

LoginAsync66+ 5
(665 6
userCredentials666 E
)66E F
;66F G
if77 
(77 
!77 
result77 
.77 
Equals77 
(77 
$str77 &
)77& '
)77' (
{88 
return99 
Ok99 
(99 
result99  
)99  !
;99! "
}:: 
return;; 
NotFound;; 
(;; 
new;; 
Error;;  %
(;;% &
$str;;& A
);;A B
);;B C
;;;C D
}== 	
[?? 	
HttpPut??	 
]?? 
public@@ 
async@@ 
Task@@ 
<@@ 

>@@' (
UpdateAsync@@) 4
(@@4 5
[@@5 6
FromBody@@6 >
]@@> ?
User@@@ D
user@@E I
,@@I J
[@@J K

FromHeader@@K U
]@@U V
string@@W ]"
authentification_Token@@^ t
)@@t u
{AA 	
boolBB 
	isUpdatedBB 
=BB 
awaitBB "
_repositoryBB# .
.BB. /
UpdateAsyncBB/ :
(BB: ;
userBB; ?
,BB? @"
authentification_TokenBBA W
)BBW X
;BBX Y
ifCC 
(CC 
!CC 
	isUpdatedCC 
)CC 
{DD 
returnEE 
NotFoundEE 
(EE  
newEE  #
ErrorEE$ )
(EE) *
$strEE* >
)EE> ?
)EE? @
;EE@ A
}FF 
returnGG 
	NoContentGG 
(GG 
)GG 
;GG 
}HH 	
[II 	

HttpDeleteII	 
]II 
publicJJ 
asyncJJ 
TaskJJ 
DeleteAsyncJJ %
(JJ% &
intJJ& )
idJJ* ,
)JJ, -
=>JJ. 0
awaitJJ1 6
_repositoryJJ7 B
.JJB C
DeleteByIdAsyncJJC R
(JJR S
idJJS U
)JJU V
;JJV W
}KK 
}LL �

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
} �
C:\Users\alexg\Documents\GitHub\Room-with-a-View\UserManagementMicroservice\UserManagementMicroservice\Data\IUsersRepository.cs
	namespace 	&
UserManagementMicroservice
 $
.$ %
Data% )
{ 
public 

	interface 
IUsersRepository %
{		 
Task

 
<

 
int


>

 


 
(

  
UserRegister

  ,
userRegister

- 9
)

9 :
;

: ;
Task 
< 
string
> 

LoginAsync 
(  
UserCredentials  /
userCredentials0 ?
)? @
;@ A
Task 
< 
IEnumerable
< 
User 
> 
> 
GetAllAsync  +
(+ ,
), -
;- .
Task
<
User
>
GetByIdAsync
(
int
id
)
;
Task 
< 
bool
> 
UpdateAsync 
( 
User #
user$ (
,( )
string) /"
authentification_Token0 F
)F G
;G H
Task 
DeleteByIdAsync
( 
int  
id! #
)# $
;$ %
} 
} �
�C:\Users\alexg\Documents\GitHub\Room-with-a-View\UserManagementMicroservice\UserManagementMicroservice\Data\Migrations\20210330151656_InitialCreate.cs
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
Id
=
table
.
Column
<
int
>
(
type
:
$str
,
nullable
:
false
)
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
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% /
,/ 0
x1 2
=>3 5
x6 7
.7 8
Id8 :
): ;
;; <
} 
) 
; 
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder 
. 
	DropTable &
(& '
name 
: 
$str 
) 
; 
} 	
} 
} �>
~C:\Users\alexg\Documents\GitHub\Room-with-a-View\UserManagementMicroservice\UserManagementMicroservice\Data\UsersRepository.cs
	namespace		 	&
UserManagementMicroservice		
 $
.		$ %
Data		% )
{

 
public 

class 
UsersRepository  
:! "
IUsersRepository# 3
{ 
private
readonly
DataContext
context
;
public 
UsersRepository 
( 
DataContext *
context+ 2
)2 3
{ 	
this 
. 
context 
= 
context "
;" #
} 	
public 
async 
Task 
< 
int 
> 

(, -
UserRegister- 9
userRegister: F
)F G
{ 	
if 
( 
this 
. 
context 
. 
Users !
.! "
Any" %
(% &
user& *
=>+ -
user. 2
.2 3
Username3 ;
==< >
userRegister? K
.K L
UsernameL T
)T U
)U V
{ 
return 
- 
$num 
; 
} 
if 
( 
this 
. 
context 
. 
Users !
.! "
Any" %
(% &
user& *
=>+ -
user. 2
.2 3
Email3 8
==9 ;
Cryptography< H
.H I

HashStringI S
(S T
userRegisterT `
.` a
Emaila f
)f g
)g h
)h i
{ 
return 
- 
$num 
; 
} 
User 
registerUser 
= 
new "
User# '
(' (
$num( )
,) *
userRegister+ 7
.7 8
Username8 @
,@ A
userRegisterB N
.N O
EmailO T
,T U
userRegisterV b
.b c
Passwordc k
)k l
;l m
this 
. 
context 
. 
Add 
( 
Cryptography )
.) *
HashUserData* 6
(6 7
registerUser7 C
)C D
)D E
;E F
await   
this   
.   
context   
.   
SaveChangesAsync   /
(  / 0
)  0 1
;  1 2
return!! 
$num!! 
;!! 
}"" 	
public$$ 
async$$ 
Task$$ 
<$$ 
string$$  
>$$  !

LoginAsync$$" ,
($$, -
UserCredentials$$- <
userCredentials$$= L
)$$L M
{%% 	
var&& 
user&& 
=&& 
await&& 
this&& !
.&&! "
context&&" )
.&&) *
Users&&* /
.&&/ 0
Where&&0 5
(&&5 6
user&&6 :
=>&&; =
user&&> B
.&&B C
Email&&C H
==&&I K
Cryptography&&L X
.&&X Y

HashString&&Y c
(&&c d
userCredentials&&d s
.&&s t
Email&&t y
)&&y z
&&''* ,
user''- 1
.''1 2
Password''2 :
==''; =
Cryptography''> J
.''J K

HashString''K U
(''U V
userCredentials''V e
.''e f
Password''f n
)''n o
)''o p
.''p q 
FirstOrDefaultAsync	''q �
(
''� �
)
''� �
;
''� �
if(( 
((( 
user(( 
==(( 
null(( 
)(( 
{)) 
return** 
$str** 
;** 
}++ 
var,, 
token,, 
=,, 
JsonConvert,, #
.,,# $
SerializeObject,,$ 3
(,,3 4
new,,4 7
{,,7 8
jwt,,8 ;
=,,; <
Jwt,,< ?
.,,? @
	CreateJWT,,@ I
(,,I J
user,,J N
.,,N O
Id,,O Q
,,,Q R
$num,,S T
),,T U
},,V W
),,W X
;,,X Y
return-- 
token-- 
;-- 
}// 	
public11 
async11 
Task11 
<11 
bool11 
>11 
UpdateAsync11  +
(11+ ,
User11, 0
user111 5
,115 6
string116 <"
authentification_Token11= S
)11S T
{22 	
string33 

decodeAuth33 
=33 
Jwt33  #
.33# $
CheckJWT33$ ,
(33, -"
authentification_Token33- C
)33C D
;33D E
if44 
(44 

decodeAuth44 
.44 
Equals44  
(44  !
$str44! 4
)444 5
||446 8

decodeAuth449 C
.44C D
Equals44D J
(44J K
$str44K h
)44h i
)44i j
{55 
return66 
false66 
;66 
}77 
else88 
{99 
int:: 
userId:: 
=:: 
Jwt::  
.::  !

(::. /

decodeAuth::/ 9
)::9 :
;::: ;
if;; 
(;; 
this;; 
.;; 
context;;  
.;;  !
Users;;! &
.;;& '
Find;;' +
(;;+ ,
userId;;, 2
);;2 3
==;;3 5
null;;5 9
);;9 :
{<< 
return== 
false==  
;==  !
}>> 
}?? 
this@@ 
.@@ 
context@@ 
.@@ 
Update@@ 
(@@  
user@@  $
)@@$ %
;@@% &
awaitAA 
thisAA 
.AA 
contextAA 
.AA 
SaveChangesAsyncAA /
(AA/ 0
)AA0 1
;AA1 2
returnBB 
trueBB 
;BB 
}CC 	
publicEE 
asyncEE 
TaskEE 
<EE 
IEnumerableEE %
<EE% &
UserEE& *
>EE* +
>EE+ ,
GetAllAsyncEE- 8
(EE8 9
)EE9 :
{FF 	
returnGG 
awaitGG 
thisGG 
.GG 
contextGG %
.GG% &
UsersGG& +
.GG+ ,
ToListAsyncGG, 7
(GG7 8
)GG8 9
;GG9 :
}HH 	
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
UserJJ 
>JJ 
GetByIdAsyncJJ  ,
(JJ, -
intJJ- 0
idJJ1 3
)JJ3 4
{KK 	
returnLL 
awaitLL 
thisLL 
.LL 
contextLL %
.LL% &
UsersLL& +
.LL+ ,
	FindAsyncLL, 5
(LL5 6
idLL6 8
)LL8 9
;LL9 :
}MM 	
publicOO 
asyncOO 
TaskOO 
DeleteByIdAsyncOO )
(OO) *
intOO* -
idOO. 0
)OO0 1
{PP 	
varQQ 
userQQ 
=QQ 
awaitQQ 
thisQQ !
.QQ! "
contextQQ" )
.QQ) *
UsersQQ* /
.QQ/ 0
	FindAsyncQQ0 9
(QQ9 :
idQQ: <
)QQ< =
;QQ= >
thisRR 
.RR 
contextRR 
.RR 
RemoveRR 
(RR  
userRR  $
)RR$ %
;RR% &
awaitSS 
thisSS 
.SS 
contextSS 
.SS 
SaveChangesAsyncSS /
(SS/ 0
)SS0 1
;SS1 2
}TT 	
}UU 
}VV �
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
(		 
int		 
Id		 
,		 
string		 "
username		# +
,		+ ,
string		- 3
email		4 9
,		9 :
string		; A
password		B J
)		J K
{

 	
this 
. 
Id 
= 
Id 
; 
Username 
= 
username 
;  
Email
=
email
;
Password 
= 
password 
;  
} 	
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} �

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
public
static
IHostBuilder
CreateHostBuilder
(
string
[
]
args
)
=>
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
} �"
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
{
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

)3 4
{ 	

= 

;) *
} 	
public 
IConfiguration 

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
{ 
options 
. 
	UseSqlite !
(! "

./ 0
GetConnectionString0 C
(C D
$strD W
)W X
)X Y
;Y Z
} 
)
; 
services   
.   
AddCors   
(   
options   $
=>  % '
{!! 
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
}(( 
)((
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

(++" #
c++# $
=>++% '
{,, 
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
}.. 
)..
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

(44! "
)44" #
)44# $
{55 
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
}99 
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
{BB 
	endpointsCC 
.CC 
MapControllersCC (
(CC( )
)CC) *
;CC* +
}DD 
)DD
;DD 
}EE 	
}FF 
}GG �
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
$num			| �
,
		� �
$num
		� �
}
		� �
;
		� �
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
(& '
)' (
;( )

userHashed
.
Username
=
user
.
Username
;

userHashed 
. 
Email 
= 

HashString )
() *
user* .
.. /
Email/ 4
)4 5
;5 6

userHashed 
. 
Password 
=  !

HashString" ,
(, -
user- 1
.1 2
Password2 :
): ;
;; <
return 

userHashed 
; 
} 	
public 
static 
string 

HashString (
(( )
string) /
	plaintext0 9
)9 :
{ 	
string 
hashed 
= 
Convert #
.# $
ToBase64String$ 2
(2 3

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
} �
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
} �$
sC:\Users\alexg\Documents\GitHub\Room-with-a-View\UserManagementMicroservice\UserManagementMicroservice\Utils\Jwt.cs
	namespace		 	&
UserManagementMicroservice		
 $
.		$ %
Utils		% *
{

 
public 

static 
class 
Jwt 
{ 
public
static
string
	CreateJWT
(
int
userId
,
int
time
)
{ 	
var 
token 
= 
new 

JwtBuilder &
(& '
)' (
. 

() *
new* -
HMACSHA256Algorithm. A
(A B
)B C
)C D
. 

WithSecret &
(& '
$str' Q
)Q R
. 
AddClaim $
($ %
$str% *
,* +
DateTimeOffset, :
.: ;
UtcNow; A
.A B
AddHoursB J
(J K
timeK O
)O P
.P Q
ToUnixTimeSecondsQ b
(b c
)c d
)d e
. 
AddClaim $
($ %
$str% -
,- .
userId/ 5
)5 6
. 
Encode "
(" #
)# $
;$ %
return 
token 
; 
} 	
public 
static 
string 
CheckJWT %
(% &
string& ,
jwt- 0
)0 1
{ 	
string 
json 
; 
try 
{ 
IJsonSerializer 

serializer  *
=+ ,
new- 0
JsonNetSerializer1 B
(B C
)C D
;D E
var 
provider 
= 
new "
UtcDateTimeProvider# 6
(6 7
)7 8
;8 9

	validator '
=( )
new* -
JwtValidator. :
(: ;

serializer; E
,E F
providerG O
)O P
;P Q
IBase64UrlEncoder   !

urlEncoder  " ,
=  - .
new  / 2
JwtBase64UrlEncoder  3 F
(  F G
)  G H
;  H I

	algorithm!! '
=!!( )
new!!* -
HMACSHA256Algorithm!!. A
(!!A B
)!!B C
;!!C D
IJwtDecoder"" 
decoder"" #
=""$ %
new""& )

JwtDecoder""* 4
(""4 5

serializer""5 ?
,""? @
	validator""A J
,""J K

urlEncoder""L V
,""V W
	algorithm""X a
)""a b
;""b c
json## 
=## 
decoder## 
.## 
Decode## %
(##% &
jwt##& )
,##) *
$str##+ U
,##U V
verify##W ]
:##] ^
true##_ c
)##c d
;##d e
}$$ 
catch%% 
(%% !
TokenExpiredException%% (
)%%( )
{&& 
return'' 
$str'' *
;''* +
}(( 
catch)) 
()) *
SignatureVerificationException)) 1
)))1 2
{** 
return++ 
$str++ 4
;++4 5
},, 
return-- 
json-- 
;-- 
}.. 	
public00 
static00 
int00 

(00' (
string00( .
jwt00/ 2
)002 3
{11 	
string22 
claims22 
=22 
jwt22 
.22  
Split22  %
(22% &
$char22& )
)22) *
.22* +
ToList22+ 1
(221 2
)222 3
[223 4
$num224 5
]225 6
.226 7
Split227 <
(22< =
$char22= @
)22@ A
.22A B
ToList22B H
(22H I
)22I J
[22J K
$num22K L
]22L M
;22M N
string33 
id33 
=33 
claims33 
.33 
Remove33 %
(33% &
claims33& ,
.33, -
Length33- 3
-334 5
$num336 7
)337 8
;338 9
return44 
Int3244 
.44 
Parse44 
(44 
id44 !
)44! "
;44" #
}55 	
}66 
}77 �
C:\Users\alexg\Documents\GitHub\Room-with-a-View\UserManagementMicroservice\UserManagementMicroservice\Utils\UserCredentials.cs
	namespace 	&
UserManagementMicroservice
 $
.$ %
Entities% -
{ 
public 

class 
UserCredentials  
{		 
public

 
string

 
Email

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
}
|C:\Users\alexg\Documents\GitHub\Room-with-a-View\UserManagementMicroservice\UserManagementMicroservice\Utils\UserRegister.cs
	namespace 	&
UserManagementMicroservice
 $
.$ %
Entities% -
{ 
public 

class 
UserRegister 
{		 
public

 
string

 
Username

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
}
} 