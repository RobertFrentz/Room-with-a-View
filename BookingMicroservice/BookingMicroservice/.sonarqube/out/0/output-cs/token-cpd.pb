¸Ä
zC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Controllers\BookingsController.cs
	namespace 	
BookingMicroservice
 
. 
Controllers )
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
BookingsController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
IBookingsRepository ,
_repository- 8
;8 9
private 
readonly 

HttpClient #
client$ *
;* +
public 
BookingsController !
(! "
IBookingsRepository" 5

repository6 @
)@ A
{ 	
_repository 
= 

repository $
;$ %
client 
= 
new 

HttpClient #
(# $
)$ %
;% &
} 	
[ 	
Route	 
( 
$str 
) 
] 
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetBookings) 4
(4 5
[5 6

FromHeader6 @
]@ A
stringB H
authorizationTokenI [
)[ \
{ 	
client   
.   !
DefaultRequestHeaders   (
.  ( )
Add  ) ,
(  , -
$str  - A
,  A B
authorizationToken  C U
)  U V
;  V W
var!! !
responseAuthorization!! %
=!!& '
await!!( -
client!!. 4
.!!4 5
GetAsync!!5 =
(!!= >
$str!!> q
)!!q r
;!!r s
if"" 
("" !
responseAuthorization"" %
.""% &

StatusCode""& 0
==""1 3
System""4 :
."": ;
Net""; >
.""> ?
HttpStatusCode""? M
.""M N
Unauthorized""N Z
)""Z [
{## 
return$$ 
Unauthorized$$ #
($$# $!
responseAuthorization$$$ 9
.$$9 :
Content$$: A
.$$A B
ReadAsStringAsync$$B S
($$S T
)$$T U
.$$U V
Result$$V \
)$$\ ]
;$$] ^
}%% 
var&& 
bookings&& 
=&& 
await&&  
_repository&&! ,
.&&, -
GetBookings&&- 8
(&&8 9
)&&9 :
;&&: ;
return'' 
Ok'' 
('' 
bookings'' 
)'' 
;''  
}(( 	
[++ 	
HttpGet++	 
]++ 
public,, 
async,, 
Task,, 
<,, 
IActionResult,, '
>,,' (
GetBookingsByUserId,,) <
(,,< =
[,,= >

FromHeader,,> H
],,H I
string,,J P
authorizationToken,,Q c
),,c d
{-- 	
client.. 
... !
DefaultRequestHeaders.. (
...( )
Add..) ,
(.., -
$str..- A
,..A B
authorizationToken..C U
)..U V
;..V W
var// !
responseAuthorization// %
=//& '
await//( -
client//. 4
.//4 5
GetAsync//5 =
(//= >
$str//> q
)//q r
;//r s
if00 
(00 !
responseAuthorization00 %
.00% &

StatusCode00& 0
==001 3
System004 :
.00: ;
Net00; >
.00> ?
HttpStatusCode00? M
.00M N
Unauthorized00N Z
)00Z [
{11 
return22 
Unauthorized22 #
(22# $!
responseAuthorization22$ 9
.229 :
Content22: A
.22A B
ReadAsStringAsync22B S
(22S T
)22T U
.22U V
Result22V \
)22\ ]
;22] ^
}33 
var44 
userId44 
=44 
	ExtractId44 "
.44" #
ExtractUserId44# 0
(440 1!
responseAuthorization441 F
.44F G
Content44G N
.44N O
ReadAsStringAsync44O `
(44` a
)44a b
.44b c
Result44c i
)44i j
;44j k
var55 
bookings55 
=55 
await55  
_repository55! ,
.55, -
GetBookingsByUserId55- @
(55@ A
userId55A G
)55G H
;55H I
if66 
(66 
!66 
bookings66 
.66 
Any66 
(66 
)66 
)66  
{77 
return88 
NotFound88 
(88  
new88  #
Error88$ )
(88) *
$str88* A
)88A B
)88B C
;88C D
}99 
return:: 
Ok:: 
(:: 
bookings:: 
):: 
;::  
};; 	
[== 	
HttpGet==	 
(== 
$str== 
)== 
]== 
public>> 
async>> 
Task>> 
<>> 
IActionResult>> '
>>>' (
GetBookingByIdAsync>>) <
(>>< =
int>>= @
id>>A C
,>>C D
[>>E F

FromHeader>>F P
]>>P Q
string>>R X
authorizationToken>>Y k
)>>k l
{?? 	
client@@ 
.@@ !
DefaultRequestHeaders@@ (
.@@( )
Add@@) ,
(@@, -
$str@@- A
,@@A B
authorizationToken@@C U
)@@U V
;@@V W
varAA !
responseAuthorizationAA %
=AA& '
awaitAA( -
clientAA. 4
.AA4 5
GetAsyncAA5 =
(AA= >
$strAA> q
)AAq r
;AAr s
ifBB 
(BB !
responseAuthorizationBB %
.BB% &

StatusCodeBB& 0
==BB1 3
SystemBB4 :
.BB: ;
NetBB; >
.BB> ?
HttpStatusCodeBB? M
.BBM N
UnauthorizedBBN Z
)BBZ [
{CC 
returnDD 
UnauthorizedDD #
(DD# $!
responseAuthorizationDD$ 9
.DD9 :
ContentDD: A
.DDA B
ReadAsStringAsyncDDB S
(DDS T
)DDT U
.DDU V
ResultDDV \
)DD\ ]
;DD] ^
}EE 
varFF 
resultFF 
=FF 
awaitFF 
_repositoryFF *
.FF* +
GetBookingByIdAsyncFF+ >
(FF> ?
idFF? A
)FFA B
;FFB C
ifGG 
(GG 
resultGG 
==GG 
nullGG 
)GG 
{HH 
returnII 
NotFoundII 
(II  
newII  #
ErrorII$ )
(II) *
$"II* ,
Booking with id II, <
{II< =
idII= ?
}II? @
 does not exist.II@ P
"IIP Q
)IIQ R
)IIR S
;IIS T
}JJ 
returnKK 
OkKK 
(KK 
JsonConvertKK !
.KK! "
SerializeObjectKK" 1
(KK1 2
newKK2 5
{LL 
IdMM 
=MM 
resultMM 
.MM 
IdMM 
,MM 

RoomNumberNN 
=NN 
resultNN #
.NN# $

RoomNumberNN$ .
,NN. /
CheckInOO 
=OO 
resultOO  
.OO  !
CheckInOO! (
,OO( )
CheckOutPP 
=PP 
resultPP !
.PP! "
CheckOutPP" *
,PP* +
TotalPayQQ 
=QQ 
resultQQ !
.QQ! "
TotalPayQQ" *
,QQ* +
StatusRR 
=RR 
resultRR 
.RR  
StatusRR  &
}SS 
)SS 
)SS 
;SS 
}TT 	
[UU 	
RouteUU	 
(UU 
$strUU 
)UU 
]UU 
[VV 	
HttpGetVV	 
]VV 
publicWW 
asyncWW 
TaskWW 
<WW 
IActionResultWW '
>WW' (%
SearchAvailableRoomsAsyncWW) B
(WWB C
[WWC D
	FromQueryWWD M
]WWM N
RoomSearchDTOWWO \
roomSearchDTOWW] j
,WWj k
[WWk l

FromHeaderWWl v
]WWv w
stringWWx ~
authorizationToken	WW ë
)
WWë í
{XX 	
clientYY 
.YY !
DefaultRequestHeadersYY (
.YY( )
AddYY) ,
(YY, -
$strYY- A
,YYA B
authorizationTokenYYC U
)YYU V
;YYV W
varZZ !
responseAuthorizationZZ %
=ZZ& '
awaitZZ( -
clientZZ. 4
.ZZ4 5
GetAsyncZZ5 =
(ZZ= >
$strZZ> q
)ZZq r
;ZZr s
if[[ 
([[ !
responseAuthorization[[ $
.[[$ %

StatusCode[[% /
==[[/ 1
System[[1 7
.[[7 8
Net[[8 ;
.[[; <
HttpStatusCode[[< J
.[[J K
Unauthorized[[K W
)[[W X
{\\ 
return]] 
Unauthorized]] #
(]]# $!
responseAuthorization]]$ 9
.]]9 :
Content]]: A
.]]A B
ReadAsStringAsync]]B S
(]]S T
)]]T U
.]]U V
Result]]V \
)]]\ ]
;]]] ^
}^^ 
var__ 
httpResultContent__ !
=__" #
await__$ )
client__* 0
.__0 1
GetStringAsync__1 ?
(__? @
$str__@ e
)__e f
;__f g
List`` 
<`` 
RoomDescriptionDTO`` #
>``# $
rooms``% *
=``+ ,
JsonConvert``- 8
.``8 9
DeserializeObject``9 J
<``J K
List``K O
<``O P
RoomDescriptionDTO``P b
>``b c
>``c d
(``d e
httpResultContent``e v
)``v w
;``w x
varaa 
resultaa 
=aa 
_repositoryaa $
.aa$ %%
SearchAvailableRoomsAsyncaa% >
(aa> ?
roomSearchDTOaa? L
,aaL M
roomsaaN S
)aaS T
;aaT U
ifbb 
(bb 
resultbb 
==bb 
nullbb 
)bb 
{cc 
returndd 
NotFounddd 
(dd  
newdd  #
Errordd$ )
(dd) *
$strdd* >
)dd> ?
)dd? @
;dd@ A
}ee 
returngg 
Okgg 
(gg 
JsonConvertgg !
.gg! "
SerializeObjectgg" 1
(gg1 2
newgg2 5
{hh 
roomsii 
=ii 
resultii 
.ii 
Resultii %
}jj 
)jj 
)jj 
;jj 
}kk 	
[mm 	
HttpPostmm	 
]mm 
publicnn 
asyncnn 
Tasknn 
<nn 
IActionResultnn '
>nn' (
AddBookingAsyncnn) 8
(nn8 9
[nn9 :
FromBodynn: B
]nnB C
PostBookingDTOnnD R
postBookingnnS ^
,nn^ _
[nn` a

FromHeadernna k
]nnk l
stringnnm s
authorizationToken	nnt Ü
)
nnÜ á
{oo 	
clientpp 
.pp !
DefaultRequestHeaderspp (
.pp( )
Addpp) ,
(pp, -
$strpp- A
,ppA B
authorizationTokenppC U
)ppU V
;ppV W
varqq !
responseAuthorizationqq %
=qq& '
awaitqq( -
clientqq. 4
.qq4 5
GetAsyncqq5 =
(qq= >
$strqq> q
)qqq r
;qqr s
ifrr 
(rr !
responseAuthorizationrr %
.rr% &

StatusCoderr& 0
==rr1 3
Systemrr4 :
.rr: ;
Netrr; >
.rr> ?
HttpStatusCoderr? M
.rrM N
UnauthorizedrrN Z
)rrZ [
{ss 
returntt 
Unauthorizedtt #
(tt# $!
responseAuthorizationtt$ 9
.tt9 :
Contenttt: A
.ttA B
ReadAsStringAsyncttB S
(ttS T
)ttT U
.ttU V
ResultttV \
)tt\ ]
;tt] ^
}uu 
varvv 
resultvv 
=vv 
awaitvv 
_repositoryvv *
.vv* +
AddBookingAsyncvv+ :
(vv: ;
postBookingvv; F
)vvF G
;vvG H
ifww 
(ww 
resultww 
==ww 
-ww 
$numww 
)ww 
{xx 
returnyy 

BadRequestyy !
(yy! "
newyy" %
Erroryy& +
(yy+ ,
$stryy, E
)yyE F
)yyF G
;yyG H
}zz 
if{{ 
({{ 
result{{ 
=={{ 
-{{ 
$num{{ 
){{ 
{|| 
return}} 

BadRequest}} !
(}}! "
new}}" %
Error}}& +
(}}+ ,
$str}}, i
)}}i j
)}}j k
;}}k l
}~~ 
return 
CreatedAtAction "
(" #
$str# /
,/ 0
postBooking1 <
)< =
;= >
}
ÄÄ 	
[
ÇÇ 	
	HttpPatch
ÇÇ	 
]
ÇÇ 
public
ÉÉ 
async
ÉÉ 
Task
ÉÉ 
<
ÉÉ 
IActionResult
ÉÉ '
>
ÉÉ' ( 
UpdateBookingAsync
ÉÉ) ;
(
ÉÉ; <
[
ÉÉ< =
FromBody
ÉÉ= E
]
ÉÉE F
PatchBookingDTO
ÉÉG V
patchBooking
ÉÉW c
,
ÉÉc d
[
ÉÉe f

FromHeader
ÉÉf p
]
ÉÉp q
string
ÉÉr x!
authorizationTokenÉÉy ã
)ÉÉã å
{
ÑÑ 	
client
ÖÖ 
.
ÖÖ #
DefaultRequestHeaders
ÖÖ (
.
ÖÖ( )
Add
ÖÖ) ,
(
ÖÖ, -
$str
ÖÖ- A
,
ÖÖA B 
authorizationToken
ÖÖC U
)
ÖÖU V
;
ÖÖV W
var
ÜÜ #
responseAuthorization
ÜÜ %
=
ÜÜ& '
await
ÜÜ( -
client
ÜÜ. 4
.
ÜÜ4 5
GetAsync
ÜÜ5 =
(
ÜÜ= >
$str
ÜÜ> q
)
ÜÜq r
;
ÜÜr s
if
áá 
(
áá #
responseAuthorization
áá %
.
áá% &

StatusCode
áá& 0
==
áá1 3
System
áá4 :
.
áá: ;
Net
áá; >
.
áá> ?
HttpStatusCode
áá? M
.
ááM N
Unauthorized
ááN Z
)
ááZ [
{
àà 
return
ââ 
Unauthorized
ââ #
(
ââ# $#
responseAuthorization
ââ$ 9
.
ââ9 :
Content
ââ: A
.
ââA B
ReadAsStringAsync
ââB S
(
ââS T
)
ââT U
.
ââU V
Result
ââV \
)
ââ\ ]
;
ââ] ^
}
ää 
var
ãã 
result
ãã 
=
ãã 
await
ãã 
_repository
ãã *
.
ãã* + 
UpdateBookingAsync
ãã+ =
(
ãã= >
patchBooking
ãã> J
)
ããJ K
;
ããK L
if
åå 
(
åå 
result
åå 
==
åå 
-
åå 
$num
åå 
)
åå 
{
çç 
return
éé 
NotFound
éé 
(
éé  
new
éé  #
Error
éé$ )
(
éé) *
$"
éé* ,
Booking with id 
éé, <
{
éé< =
patchBooking
éé= I
.
ééI J
Id
ééJ L
}
ééL M
 does not exist.
ééM ]
"
éé] ^
)
éé^ _
)
éé_ `
;
éé` a
}
èè 
if
êê 
(
êê 
result
êê 
==
êê 
-
êê 
$num
êê 
)
êê 
{
ëë 
return
íí 

BadRequest
íí !
(
íí! "
new
íí" %
Error
íí& +
(
íí+ ,
$str
íí, i
)
ííi j
)
ííj k
;
íík l
}
ìì 
return
îî 
	NoContent
îî 
(
îî 
)
îî 
;
îî 
}
ïï 	
}
ññ 
}óó ús
sC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Data\BookingsRepository.cs
	namespace 	
BookingMicroservice
 
. 
Data "
{		 
public

 

class

 
BookingsRepository

 #
:

$ %
IBookingsRepository

& 9
{ 
private 
readonly 
DataContext $
_context% -
;- .
public 
BookingsRepository !
(! "
DataContext" -
context. 5
)5 6
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Booking& -
>- .
>. /
GetBookings0 ;
(; <
)< =
{ 	
return 
await 
_context !
.! "
Bookings" *
.* +
ToListAsync+ 6
(6 7
)7 8
;8 9
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Booking& -
>- .
>. /
GetBookingsByUserId0 C
(C D
intD G
userIdH N
)N O
{ 	
return 
await 
_context !
.! "
Bookings" *
.* +
Where+ 0
(0 1
booking1 8
=>9 ;
booking< C
.C D
UserIdD J
==J L
userIdL R
)R S
.S T
ToListAsyncT _
(_ `
)` a
;a b
} 	
public 
async 
Task 
< 
GetBookingDTO '
>' (
GetBookingByIdAsync) <
(< =
int= @
idA C
)C D
{ 	
var 
result 
= 
await 
_context '
.' (
Bookings( 0
.0 1
Where1 6
(6 7
booking7 >
=>? A
bookingB I
.I J
IdJ L
==M O
idP R
)R S
.S T
FirstOrDefaultAsyncT g
(g h
)h i
;i j
if 
( 
result 
== 
null 
) 
{ 
return   
null   
;   
}!! 
return"" 
new"" 
GetBookingDTO"" $
(""$ %
)""% &
{## 
Id$$ 
=$$ 
result$$ 
.$$ 
Id$$ 
,$$ 

RoomNumber%% 
=%% 
result%% #
.%%# $

RoomNumber%%$ .
,%%. /
CheckIn&& 
=&& 
result&&  
.&&  !
CheckIn&&! (
,&&( )
CheckOut'' 
='' 
result'' !
.''! "
CheckOut''" *
,''* +
TotalPay(( 
=(( 
result(( !
.((! "
TotalPay((" *
,((* +
Status)) 
=)) 
result)) 
.))  
Status))  &
}** 
;** 
}++ 	
public-- 
async-- 
Task-- 
<-- 
int-- 
>-- 
AddBookingAsync-- .
(--. /
PostBookingDTO--/ =
postBooking--> I
)--I J
{.. 	
var// 
result// 
=// 
await// 
_context// '
.//' (
Bookings//( 0
.//0 1
AnyAsync//1 9
(//9 :
booking//: A
=>//B D
booking//E L
.//L M

RoomNumber//M W
==//X Z
postBooking//[ f
.//f g

RoomNumber//g q
&&//r t
booking//u |
.//| }
CheckIn	//} Ñ
==
//Ö á
postBooking
//à ì
.
//ì î
CheckIn
//î õ
&&00: <
booking00= D
.00D E
CheckOut00E M
==00N P
postBooking00Q \
.00\ ]
CheckOut00] e
&&00f h
booking00i p
.00p q
UserId00q w
==00x z
postBooking	00{ Ü
.
00Ü á
UserId
00á ç
)
00ç é
;
00é è
if11 
(11 
result11 
==11 
true11 
)11 
{22 
return33 
-33 
$num33 
;33 
}44 
var55 
isAddingPossible55  
=55! "
await55# (
_context55) 1
.551 2
Bookings552 :
.55: ;
AnyAsync55; C
(55C D
booking55D K
=>55L N
!55O P
(55P Q
booking55Q X
.55X Y

RoomNumber55Y c
==55d f
postBooking55g r
.55r s

RoomNumber55s }
&&	55~ Ä
(665 6
(666 7
booking667 >
.66> ?
CheckIn66? F
>66G H
postBooking66I T
.66T U
CheckIn66U \
&&66] _
booking66` g
.66g h
CheckOut66h p
<66q r
postBooking66s ~
.66~ 
CheckOut	66 á
)
66á à
||
66â ã
(776 7
booking777 >
.77> ?
CheckIn77? F
<77G H
postBooking77I T
.77T U
CheckIn77U \
&&77] _
booking77` g
.77g h
CheckOut77h p
<77q r
postBooking77s ~
.77~ 
CheckOut	77 á
)
77á à
||
77â ã
(886 7
booking887 >
.88> ?
CheckIn88? F
>88G H
postBooking88I T
.88T U
CheckIn88U \
&&88] _
booking88` g
.88g h
CheckOut88h p
>88q r
postBooking88s ~
.88~ 
CheckOut	88 á
)
88á à
||
88â ã
(996 7
booking997 >
.99> ?
CheckIn99? F
<99G H
postBooking99I T
.99T U
CheckIn99U \
&&99] _
booking99` g
.99g h
CheckOut99h p
>99q r
postBooking99s ~
.99~ 
CheckOut	99 á
)
99á à
)
99à â
)
99â ä
)
99ä ã
;
99ã å
if:: 
(:: 
isAddingPossible::  
==::! #
true::$ (
)::( )
{;; 
_context<< 
.<< 
Add<< 
(<< 
new<<  
Booking<<! (
(<<( )
)<<) *
{== 
Id>> 
=>> 
$num>> 
,>> 

RoomNumber?? 
=??  
postBooking??! ,
.??, -

RoomNumber??- 7
,??7 8
CheckIn@@ 
=@@ 
postBooking@@ )
.@@) *
CheckIn@@* 1
,@@1 2
CheckOutAA 
=AA 
postBookingAA *
.AA* +
CheckOutAA+ 3
,AA3 4
UserIdBB 
=BB 
postBookingBB (
.BB( )
UserIdBB) /
,BB/ 0
TotalPayCC 
=CC 
$numCC "
,CC" #
StatusDD 
=DD 
$strDD )
}FF 
)FF 
;FF 
awaitGG 
_contextGG 
.GG 
SaveChangesAsyncGG /
(GG/ 0
)GG0 1
;GG1 2
returnHH 
$numHH 
;HH 
}II 
returnJJ 
-JJ 
$numJJ 
;JJ 
}KK 	
publicMM 
asyncMM 
TaskMM 
<MM 
intMM 
>MM 
UpdateBookingAsyncMM 1
(MM1 2
PatchBookingDTOMM2 A
patchBookingMMB N
)MMN O
{NN 	
varOO 
resultOO 
=OO 
awaitOO 
_contextOO '
.OO' (
BookingsOO( 0
.OO0 1
WhereOO1 6
(OO6 7
bookingOO7 >
=>OO? A
bookingOOB I
.OOI J
IdOOJ L
==OOM O
patchBookingOOP \
.OO\ ]
IdOO] _
)OO_ `
.OO` a
FirstOrDefaultAsyncOOa t
(OOt u
)OOu v
;OOv w
ifPP 
(PP 
resultPP 
==PP 
nullPP 
)PP 
{QQ 
returnRR 
-RR 
$numRR 
;RR 
}SS 
intTT 

roomNumberTT 
=TT 
resultTT #
.TT# $

RoomNumberTT$ .
;TT. /
varUU 
isUpdatePossibleUU  
=UU! "
awaitUU# (
_contextUU) 1
.UU1 2
BookingsUU2 :
.UU: ;
AnyAsyncUU; C
(UUC D
bookingUUD K
=>UUL N
!UUO P
(UUP Q
bookingUUQ X
.UUX Y

RoomNumberUUY c
==UUd f

roomNumberUUg q
&&UUr t
bookingUUu |
.UU| }
IdUU} 
!=
UUÄ Ç
patchBooking
UUÉ è
.
UUè ê
Id
UUê í
&&
UUì ï
(VV5 6
(VV6 7
bookingVV7 >
.VV> ?
CheckInVV? F
>VVG H
patchBookingVVI U
.VVU V
CheckInVVV ]
&&VV^ `
bookingVVa h
.VVh i
CheckOutVVi q
<VVr s
patchBooking	VVt Ä
.
VVÄ Å
CheckOut
VVÅ â
)
VVâ ä
||
VVã ç
(WW6 7
bookingWW7 >
.WW> ?
CheckInWW? F
<WWG H
patchBookingWWI U
.WWU V
CheckInWWV ]
&&WW^ `
bookingWWa h
.WWh i
CheckOutWWi q
<WWr s
patchBooking	WWt Ä
.
WWÄ Å
CheckOut
WWÅ â
)
WWâ ä
||
WWã ç
(XX6 7
bookingXX7 >
.XX> ?
CheckInXX? F
>XXG H
patchBookingXXI U
.XXU V
CheckInXXV ]
&&XX^ `
bookingXXa h
.XXh i
CheckOutXXi q
>XXr s
patchBooking	XXt Ä
.
XXÄ Å
CheckOut
XXÅ â
)
XXâ ä
||
XXã ç
(YY6 7
bookingYY7 >
.YY> ?
CheckInYY? F
<YYG H
patchBookingYYI U
.YYU V
CheckInYYV ]
&&YY^ `
bookingYYa h
.YYh i
CheckOutYYi q
>YYr s
patchBooking	YYt Ä
.
YYÄ Å
CheckOut
YYÅ â
)
YYâ ä
)
YYä ã
)
YYã å
)
YYå ç
;
YYç é
ifZZ 
(ZZ 
isUpdatePossibleZZ 
==ZZ  "
falseZZ# (
)ZZ( )
{[[ 
return\\ 
-\\ 
$num\\ 
;\\ 
}]] 
result^^ 
.^^ 
CheckIn^^ 
=^^ 
patchBooking^^ )
.^^) *
CheckIn^^* 1
;^^1 2
result__ 
.__ 
CheckOut__ 
=__ 
patchBooking__ *
.__* +
CheckOut__+ 3
;__3 4
await`` 
_context`` 
.`` 
SaveChangesAsync`` +
(``+ ,
)``, -
;``- .
returnaa 
$numaa 
;aa 
}dd 	
publicff 
asyncff 
Taskff 
<ff 
IEnumerableff %
<ff% &
RoomDescriptionDTOff& 8
>ff8 9
>ff9 :%
SearchAvailableRoomsAsyncff; T
(ffT U
RoomSearchDTOffU b
roomSearchDTOffc p
,ffp q
Listffr v
<ffv w
RoomDescriptionDTO	ffw â
>
ffâ ä
rooms
ffã ê
)
ffê ë
{gg 	
Listhh 
<hh 
RoomDescriptionDTOhh #
>hh# $
returnValuehh% 0
=hh1 2
newhh3 6
Listhh7 ;
<hh; <
RoomDescriptionDTOhh< N
>hhN O
(hhO P
)hhP Q
;hhQ R
foreachii 
(ii 
varii 
roomii 
inii 
roomsii  %
)ii% &
{jj 
ifkk 
(kk 
roomkk 
.kk 
PersonsNumberkk %
!=kk& (
roomSearchDTOkk) 6
.kk6 7
PersonsNumberkk7 D
)kkD E
{ll 
continuemm 
;mm 
}nn 
varoo 
isAvailableoo 
=oo  !
awaitoo" '
_contextoo( 0
.oo0 1
Bookingsoo1 9
.oo9 :
AnyAsyncoo: B
(ooB C
bookingooC J
=>ooK M
!ooN O
(ooO P
bookingooP W
.ooW X

RoomNumberooX b
==ooc e
roomoof j
.ooj k

RoomNumberook u
&&oov x
(pp5 6
(pp6 7
bookingpp7 >
.pp> ?
CheckInpp? F
>ppG H
roomSearchDTOppI V
.ppV W
CheckInppW ^
&&pp_ a
bookingppb i
.ppi j
CheckOutppj r
<pps t
roomSearchDTO	ppu Ç
.
ppÇ É
CheckOut
ppÉ ã
)
ppã å
||
ppç è
(qq6 7
bookingqq7 >
.qq> ?
CheckInqq? F
<qqG H
roomSearchDTOqqI V
.qqV W
CheckInqqW ^
&&qq_ a
bookingqqb i
.qqi j
CheckOutqqj r
<qqs t
roomSearchDTO	qqu Ç
.
qqÇ É
CheckOut
qqÉ ã
)
qqã å
||
qqç è
(rr6 7
bookingrr7 >
.rr> ?
CheckInrr? F
>rrG H
roomSearchDTOrrI V
.rrV W
CheckInrrW ^
&&rr_ a
bookingrrb i
.rri j
CheckOutrrj r
>rrs t
roomSearchDTO	rru Ç
.
rrÇ É
CheckOut
rrÉ ã
)
rrã å
||
rrç è
(ss6 7
bookingss7 >
.ss> ?
CheckInss? F
<ssG H
roomSearchDTOssI V
.ssV W
CheckInssW ^
&&ss_ a
bookingssb i
.ssi j
CheckOutssj r
>sss t
roomSearchDTO	ssu Ç
.
ssÇ É
CheckOut
ssÉ ã
)
ssã å
)
sså ç
)
ssç é
)
ssé è
;
ssè ê
iftt 
(tt 
isAvailablett 
==tt !
falsett" '
)tt' (
{uu 
continuevv 
;vv 
}ww 
returnValuexx 
.xx 
Addxx 
(xx  
roomxx  $
)xx$ %
;xx% &
}yy 
returnzz 
returnValuezz 
;zz 
}{{ 	
}~~ 
} ≠

lC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Data\DataContext.cs
	namespace 	
BookingMicroservice
 
. 
Data "
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
< 
Booking 
> 
Bookings &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
modelBuilder 
. 
Entity 
<  
Booking  '
>' (
(( )
)) *
.* +
Property+ 3
(3 4
$str4 8
)8 9
.9 :
ValueGeneratedOnAdd: M
(M N
)N O
;O P
} 	
} 
} …
tC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Data\IBookingsRepository.cs
	namespace 	
BookingMicroservice
 
. 
Data "
{ 
public 

	interface 
IBookingsRepository (
{		 
Task 
< 
IEnumerable 
< 
Booking  
>  !
>! "
GetBookings# .
(. /
)/ 0
;0 1
Task 
< 
IEnumerable 
< 
Booking  
>  !
>! "
GetBookingsByUserId# 6
(6 7
int7 :
userId; A
)A B
;B C
Task 
< 
GetBookingDTO 
> 
GetBookingByIdAsync /
(/ 0
int0 3
id4 6
)6 7
;7 8
Task 
< 
int 
> 
AddBookingAsync !
(! "
PostBookingDTO" 0
postBooking1 <
)< =
;= >
Task 
< 
int 
> 
UpdateBookingAsync $
($ %
PatchBookingDTO% 4
patchBooking5 A
)A B
;B C
Task 
< 
IEnumerable 
< 
RoomDescriptionDTO +
>+ ,
>, -%
SearchAvailableRoomsAsync. G
(G H
RoomSearchDTOH U
roomSearchDTOV c
,c d
Liste i
<i j
RoomDescriptionDTOj |
>| }
rooms	~ É
)
É Ñ
;
Ñ Ö
} 
} ≠
àC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Data\Migrations\20210420162326_InitialCreate.cs
	namespace 	
BookingMicroservice
 
. 
Data "
." #

Migrations# -
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
$str  
,  !
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
,T U
CheckIn 
= 
table #
.# $
Column$ *
<* +
DateTime+ 3
>3 4
(4 5
type5 9
:9 :
$str; A
,A B
nullableC K
:K L
falseM R
)R S
,S T
CheckOut 
= 
table $
.$ %
Column% +
<+ ,
DateTime, 4
>4 5
(5 6
type6 :
:: ;
$str< B
,B C
nullableD L
:L M
falseN S
)S T
,T U
UserId 
= 
table "
." #
Column# )
<) *
int* -
>- .
(. /
type/ 3
:3 4
$str5 >
,> ?
nullable@ H
:H I
falseJ O
)O P
,P Q
TotalPay 
= 
table $
.$ %
Column% +
<+ ,
int, /
>/ 0
(0 1
type1 5
:5 6
$str7 @
,@ A
nullableB J
:J K
falseL Q
)Q R
,R S
Status 
= 
table "
." #
Column# )
<) *
string* 0
>0 1
(1 2
type2 6
:6 7
$str8 >
,> ?
nullable@ H
:H I
trueJ N
)N O
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
$str% 2
,2 3
x4 5
=>6 8
x9 :
.: ;
Id; =
)= >
;> ?
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
$str    
)    !
;  ! "
}!! 	
}"" 
}## ú
nC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\DTOs\GetBookingDTO.cs
	namespace 	
BookingMicroservice
 
. 
DTOs "
{ 
public 

class 
GetBookingDTO 
{		 
public

 
GetBookingDTO

 
(

 
)

 
{ 	
} 	
public 
GetBookingDTO 
( 
int  
id! #
,# $
int% (

roomNumber) 3
,3 4
DateTime5 =
checkIn> E
,E F
DateTimeG O
checkOutP X
,X Y
intZ ]
totalPay^ f
,f g
stringh n
statuso u
)u v
{ 	
Id 
= 
id 
; 

RoomNumber 
= 

roomNumber #
;# $
CheckIn 
= 
checkIn 
; 
CheckOut 
= 
checkOut 
;  
TotalPay 
= 
totalPay 
;  
Status 
= 
status 
; 
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
public 
int 

RoomNumber 
{ 
get  #
;# $
set% (
;( )
}* +
public 
DateTime 
CheckIn 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DateTime 
CheckOut  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 
TotalPay 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Status 
{ 
get "
;" #
set$ '
;' (
}) *
} 
}   ì
pC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\DTOs\PatchBookingDTO.cs
	namespace 	
BookingMicroservice
 
. 
DTOs "
{ 
public 

class 
PatchBookingDTO  
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public		 
DateTime		 
CheckIn		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
public

 
DateTime

 
CheckOut

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
} 
} ∞
oC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\DTOs\PostBookingDTO.cs
	namespace 	
BookingMicroservice
 
. 
DTOs "
{ 
public 

class 
PostBookingDTO 
{ 
public 
int 

RoomNumber 
{ 
get  #
;# $
set% (
;( )
}* +
public 
DateTime 
CheckIn 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
DateTime		 
CheckOut		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
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
& '
} 
} ˜	
sC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\DTOs\RoomDescriptionDTO.cs
	namespace 	
BookingMicroservice
 
. 
DTOs "
{ 
public 

class 
RoomDescriptionDTO #
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
public 
int 

RoomNumber 
{ 
get  #
;# $
set% (
;( )
}* +
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
public 
int 
PersonsNumber  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} ÿ
nC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\DTOs\RoomSearchDTO.cs
	namespace 	
BookingMicroservice
 
. 
DTOs "
{ 
public 

class 
RoomSearchDTO 
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
public		 
DateTime		 
?		 
CheckIn		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
public

 
DateTime

 
?

 
CheckOut

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
int 
PersonsNumber  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} 

lC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Entities\Booking.cs
	namespace 	
BookingMicroservice
 
. 
Entities &
{ 
public 

class 
Booking 
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
public		 
DateTime		 
CheckIn		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
public

 
DateTime

 
CheckOut

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 
TotalPay 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Status 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ƒ

cC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Program.cs
	namespace 	
BookingMicroservice
 
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
} Ú$
cC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Startup.cs
	namespace

 	
BookingMicroservice


 
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
services 
. 
AddDbContext !
<! "
DataContext" -
>- .
(. /
options/ 6
=>7 9
{ 
options 
. 
	UseSqlite !
(! "
Configuration" /
./ 0
GetConnectionString0 C
(C D
$strD W
)W X
)X Y
;Y Z
} 
) 
; 
services 
. 
AddControllers #
(# $
)$ %
.% &
AddJsonOptions& 4
(4 5
options5 <
=>= ?
{ 
options 
. !
JsonSerializerOptions -
.- .'
PropertyNameCaseInsensitive. I
=J K
trueL P
;P Q
}   
)   
;   
services"" 
."" 
AddCors"" 
("" 
options"" $
=>""% '
{## 
options$$ 
.$$ 
	AddPolicy$$ !
($$! "$
MyAllowedSpecificOrigins$$" :
,$$: ;
builder$$< C
=>$$D F
{%% 
builder&& 
.&& 
AllowAnyHeader&& *
(&&* +
)&&+ ,
.'' 
AllowAnyMethod'' #
(''# $
)''$ %
.(( 
AllowAnyOrigin(( #
(((# $
)(($ %
;((% &
})) 
))) 
;)) 
}** 
)** 
;** 
services,, 
.,, 
AddTransient,, !
<,,! "
IBookingsRepository,," 5
,,,5 6
BookingsRepository,,7 I
>,,I J
(,,J K
),,K L
;,,L M
services-- 
.-- 
AddSwaggerGen-- "
(--" #
c--# $
=>--% '
{.. 
c// 
.// 

SwaggerDoc// 
(// 
$str// !
,//! "
new//# &
OpenApiInfo//' 2
{//3 4
Title//5 :
=//; <
$str//= R
,//R S
Version//T [
=//\ ]
$str//^ b
}//c d
)//d e
;//e f
}00 
)00 
;00 
}11 	
public44 
void44 
	Configure44 
(44 
IApplicationBuilder44 1
app442 5
,445 6
IWebHostEnvironment447 J
env44K N
)44N O
{55 	
if66 
(66 
env66 
.66 
IsDevelopment66 !
(66! "
)66" #
)66# $
{77 
app88 
.88 %
UseDeveloperExceptionPage88 -
(88- .
)88. /
;88/ 0
app99 
.99 

UseSwagger99 
(99 
)99  
;99  !
app:: 
.:: 
UseSwaggerUI::  
(::  !
c::! "
=>::# %
c::& '
.::' (
SwaggerEndpoint::( 7
(::7 8
$str::8 R
,::R S
$str::T l
)::l m
)::m n
;::n o
};; 
app== 
.== 
UseCors== 
(== $
MyAllowedSpecificOrigins== 0
)==0 1
;==1 2
app?? 
.?? 

UseRouting?? 
(?? 
)?? 
;?? 
appAA 
.AA 
UseAuthorizationAA  
(AA  !
)AA! "
;AA" #
appCC 
.CC 
UseEndpointsCC 
(CC 
	endpointsCC &
=>CC' )
{DD 
	endpointsEE 
.EE 
MapControllersEE (
(EE( )
)EE) *
;EE* +
}FF 
)FF 
;FF 
}GG 	
}HH 
}II ◊
gC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Utils\Error.cs
	namespace 	
BookingMicroservice
 
. 
Utils #
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
} ƒ

kC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Utils\ExtractId.cs
	namespace 	
BookingMicroservice
 
. 
Utils #
{ 
public 

class 
	ExtractId 
{		 
public

 
static

 
int

 
ExtractUserId

 '
(

' (
string

( .
jwt

/ 2
)

2 3
{ 	
string 
claims 
= 
jwt 
.  
Split  %
(% &
$char& )
)) *
.* +
ToList+ 1
(1 2
)2 3
[3 4
$num4 5
]5 6
.6 7
Split7 <
(< =
$char= @
)@ A
.A B
ToListB H
(H I
)I J
[J K
$numK L
]L M
;M N
string 
id 
= 
claims 
. 
Remove %
(% &
claims& ,
., -
Length- 3
-4 5
$num6 7
)7 8
;8 9
return 
Int32 
. 
Parse 
( 
id !
)! "
;" #
} 	
} 
} 