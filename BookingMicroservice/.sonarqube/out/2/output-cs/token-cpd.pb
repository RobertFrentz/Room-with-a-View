à≤
zC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Controllers\BookingsController.cs
	namespace 	
BookingMicroservice
 
. 
Controllers )
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
BookingsController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
IBookingsRepository ,
_repository- 8
;8 9
private 
readonly 

HttpClient #
client$ *
;* +
private 
readonly 
string *
usersManagementMicroserviceUri  >
=? @
$strA g
;g h
private 
readonly 
string *
roomsManagementMicroserviceUri  >
=? @
$strA f
;f g
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
(!!= >*
usersManagementMicroserviceUri!!> \
+!!\ ]
$str!!] l
)!!l m
;!!m n
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
.&&, -
GetBookingsAsync&&- =
(&&= >
)&&> ?
;&&? @
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
>,,' ($
GetBookingsByUserIdAsync,,) A
(,,A B
[,,B C

FromHeader,,C M
],,M N
string,,O U
authorizationToken,,V h
),,h i
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
(//= >*
usersManagementMicroserviceUri//> \
+//] ^
$str//_ n
)//n o
;//o p
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
.55, -$
GetBookingsByUserIdAsync55- E
(55E F
userId55F L
)55L M
;55M N
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
(AA= >*
usersManagementMicroserviceUriAA> \
+AA] ^
$strAA_ n
)AAn o
;AAo p
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
RoomSearchDtoWWO \
roomSearchDTOWW] j
)WWj k
{XX 	
ifYY 
(YY 
!YY 

ValidationYY 
.YY 
CheckValidDatesYY +
(YY+ ,
roomSearchDTOYY, 9
.YY9 :
CheckInYY: A
,YYA B
roomSearchDTOYYC P
.YYP Q
CheckOutYYQ Y
)YYY Z
)YYZ [
{ZZ 
return[[ 

BadRequest[[ !
([[! "
new[[" %
Error[[& +
([[+ ,
$str[[, O
)[[O P
)[[P Q
;[[Q R
}\\ 
var]] 
httpResultContent]] !
=]]" #
await]]$ )
client]]* 0
.]]0 1
GetStringAsync]]1 ?
(]]? @*
roomsManagementMicroserviceUri]]@ ^
)]]^ _
;]]_ `
if^^ 
(^^ 
httpResultContent^^  
!=^^  "
null^^" &
)^^& '
{__ 
List`` 
<`` 
RoomDescriptionDto`` '
>``' (
?``( )
rooms``* /
=``0 1
JsonConvert``2 =
.``= >
DeserializeObject``> O
<``O P
List``P T
<``T U
RoomDescriptionDto``U g
>``g h
>``h i
(``i j
httpResultContent``j {
)``{ |
;``| }
ifaa 
(aa 
roomsaa 
!=aa 
nullaa 
)aa 
{bb 
varcc 
resultcc 
=cc  
_repositorycc! ,
.cc, -%
SearchAvailableRoomsAsynccc- F
(ccF G
roomSearchDTOccG T
,ccT U
roomsccV [
)cc[ \
;cc\ ]
ifdd 
(dd 
resultdd 
==dd !
nulldd" &
)dd& '
{ee 
returnff 
NotFoundff '
(ff' (
newff( +
Errorff, 1
(ff1 2
$strff2 F
)ffF G
)ffG H
;ffH I
}gg 
returnhh 
Okhh 
(hh 
JsonConverthh )
.hh) *
SerializeObjecthh* 9
(hh9 :
newhh: =
{ii 
roomsjj 
=jj 
resultjj  &
.jj& '
Resultjj' -
}kk 
)kk 
)kk 
;kk 
}ll 
}nn 
returnoo 
NotFoundoo 
(oo 
newoo 
Erroroo  %
(oo% &
$stroo& 7
)oo7 8
)oo8 9
;oo9 :
}pp 	
[rr 	
HttpPostrr	 
]rr 
publicss 
asyncss 
Taskss 
<ss 
IActionResultss '
>ss' (
AddBookingAsyncss) 8
(ss8 9
[ss9 :
FromBodyss: B
]ssB C
PostBookingDtossD R
postBookingssS ^
,ss^ _
[ss` a

FromHeaderssa k
]ssk l
stringssm s
authorizationToken	sst Ü
)
ssÜ á
{tt 	
clientuu 
.uu !
DefaultRequestHeadersuu (
.uu( )
Adduu) ,
(uu, -
$struu- A
,uuA B
authorizationTokenuuC U
)uuU V
;uuV W
varvv !
responseAuthorizationvv %
=vv& '
awaitvv( -
clientvv. 4
.vv4 5
GetAsyncvv5 =
(vv= >*
usersManagementMicroserviceUrivv> \
+vv] ^
$strvv_ n
)vvn o
;vvo p
ifww 
(ww !
responseAuthorizationww %
.ww% &

StatusCodeww& 0
==ww1 3
Systemww4 :
.ww: ;
Netww; >
.ww> ?
HttpStatusCodeww? M
.wwM N
UnauthorizedwwN Z
)wwZ [
{xx 
returnyy 
Unauthorizedyy #
(yy# $!
responseAuthorizationyy$ 9
.yy9 :
Contentyy: A
.yyA B
ReadAsStringAsyncyyB S
(yyS T
)yyT U
.yyU V
ResultyyV \
)yy\ ]
;yy] ^
}zz 
var{{ 
userId{{ 
={{ 
	ExtractId{{ "
.{{" #
ExtractUserId{{# 0
({{0 1!
responseAuthorization{{1 F
.{{F G
Content{{G N
.{{N O
ReadAsStringAsync{{O `
({{` a
){{a b
.{{b c
Result{{c i
){{i j
;{{j k
var|| 
responseRoomNumber|| "
=||# $
await||% *
client||+ 1
.||1 2
GetAsync||2 :
(||: ;*
roomsManagementMicroserviceUri||; Y
+||Z [
$"||\ ^
/||^ _
{||_ `
postBooking||` k
.||k l

RoomNumber||l v
}||v w
"||w x
)||x y
;||y z
if}} 
(}} 
responseRoomNumber}} !
.}}! "

StatusCode}}" ,
==}}- /
System}}0 6
.}}6 7
Net}}7 :
.}}: ;
HttpStatusCode}}; I
.}}I J
NotFound}}J R
)}}R S
{~~ 
return 

BadRequest !
(! "
new" %
Error& +
(+ ,
$", ."
Room with room number . D
{D E
postBookingE P
.P Q

RoomNumberQ [
}[ \
 does not exist.\ l
"l m
)m n
)n o
;o p
}
ÄÄ 
if
ÅÅ 
(
ÅÅ 
!
ÅÅ 

Validation
ÅÅ 
.
ÅÅ 
CheckValidDates
ÅÅ +
(
ÅÅ+ ,
postBooking
ÅÅ, 7
.
ÅÅ7 8
CheckIn
ÅÅ8 ?
,
ÅÅ? @
postBooking
ÅÅA L
.
ÅÅL M
CheckOut
ÅÅM U
)
ÅÅU V
)
ÅÅV W
{
ÇÇ 
return
ÉÉ 

BadRequest
ÉÉ !
(
ÉÉ! "
new
ÉÉ" %
Error
ÉÉ& +
(
ÉÉ+ ,
$str
ÉÉ, O
)
ÉÉO P
)
ÉÉP Q
;
ÉÉQ R
}
ÑÑ 
var
ÖÖ 
result
ÖÖ 
=
ÖÖ 
await
ÖÖ 
_repository
ÖÖ *
.
ÖÖ* +
AddBookingAsync
ÖÖ+ :
(
ÖÖ: ;
postBooking
ÖÖ; F
,
ÖÖF G
userId
ÖÖH N
)
ÖÖN O
;
ÖÖO P
if
ÜÜ 
(
ÜÜ 
result
ÜÜ 
==
ÜÜ 
-
ÜÜ 
$num
ÜÜ 
)
ÜÜ 
{
áá 
return
àà 

BadRequest
àà !
(
àà! "
new
àà" %
Error
àà& +
(
àà+ ,
$str
àà, E
)
ààE F
)
ààF G
;
ààG H
}
ââ 
if
ää 
(
ää 
result
ää 
==
ää 
-
ää 
$num
ää 
)
ää 
{
ãã 
return
åå 

BadRequest
åå !
(
åå! "
new
åå" %
Error
åå& +
(
åå+ ,
$str
åå, i
)
ååi j
)
ååj k
;
ååk l
}
çç 
return
èè 
CreatedAtAction
èè "
(
èè" #
$str
èè# /
,
èè/ 0
postBooking
èè1 <
)
èè< =
;
èè= >
}
êê 	
[
íí 	
	HttpPatch
íí	 
]
íí 
public
ìì 
async
ìì 
Task
ìì 
<
ìì 
IActionResult
ìì '
>
ìì' ( 
UpdateBookingAsync
ìì) ;
(
ìì; <
[
ìì< =
FromBody
ìì= E
]
ììE F
PatchBookingDto
ììG V
patchBooking
ììW c
,
ììc d
[
ììe f

FromHeader
ììf p
]
ììp q
string
ììr x!
authorizationTokenììy ã
)ììã å
{
îî 	
client
ïï 
.
ïï #
DefaultRequestHeaders
ïï (
.
ïï( )
Add
ïï) ,
(
ïï, -
$str
ïï- A
,
ïïA B 
authorizationToken
ïïC U
)
ïïU V
;
ïïV W
var
ññ #
responseAuthorization
ññ %
=
ññ& '
await
ññ( -
client
ññ. 4
.
ññ4 5
GetAsync
ññ5 =
(
ññ= >,
usersManagementMicroserviceUri
ññ> \
+
ññ] ^
$str
ññ_ n
)
ññn o
;
ñño p
if
óó 
(
óó #
responseAuthorization
óó %
.
óó% &

StatusCode
óó& 0
==
óó1 3
System
óó4 :
.
óó: ;
Net
óó; >
.
óó> ?
HttpStatusCode
óó? M
.
óóM N
Unauthorized
óóN Z
)
óóZ [
{
òò 
return
ôô 
Unauthorized
ôô #
(
ôô# $#
responseAuthorization
ôô$ 9
.
ôô9 :
Content
ôô: A
.
ôôA B
ReadAsStringAsync
ôôB S
(
ôôS T
)
ôôT U
.
ôôU V
Result
ôôV \
)
ôô\ ]
;
ôô] ^
}
öö 
var
õõ 
userId
õõ 
=
õõ 
	ExtractId
õõ "
.
õõ" #
ExtractUserId
õõ# 0
(
õõ0 1#
responseAuthorization
õõ1 F
.
õõF G
Content
õõG N
.
õõN O
ReadAsStringAsync
õõO `
(
õõ` a
)
õõa b
.
õõb c
Result
õõc i
)
õõi j
;
õõj k
var
úú 
result
úú 
=
úú 
await
úú 
_repository
úú *
.
úú* + 
UpdateBookingAsync
úú+ =
(
úú= >
patchBooking
úú> J
,
úúJ K
userId
úúL R
)
úúR S
;
úúS T
if
ùù 
(
ùù 
!
ùù 

Validation
ùù 
.
ùù 
CheckValidDates
ùù +
(
ùù+ ,
patchBooking
ùù, 8
.
ùù8 9
CheckIn
ùù9 @
,
ùù@ A
patchBooking
ùùB N
.
ùùN O
CheckOut
ùùO W
)
ùùW X
)
ùùX Y
{
ûû 
return
üü 

BadRequest
üü !
(
üü! "
new
üü" %
Error
üü& +
(
üü+ ,
$str
üü, O
)
üüO P
)
üüP Q
;
üüQ R
}
†† 
if
°° 
(
°° 
result
°° 
==
°° 
-
°° 
$num
°° 
)
°° 
{
¢¢ 
return
££ 
NotFound
££ 
(
££  
new
££  #
Error
££$ )
(
££) *
$"
££* ,
Booking with id 
££, <
{
££< =
patchBooking
££= I
.
££I J
Id
££J L
}
££L M
 does not exist.
££M ]
"
££] ^
)
££^ _
)
££_ `
;
££` a
}
§§ 
if
•• 
(
•• 
result
•• 
==
•• 
-
•• 
$num
•• 
)
•• 
{
¶¶ 
return
ßß 

BadRequest
ßß !
(
ßß! "
new
ßß" %
Error
ßß& +
(
ßß+ ,
$str
ßß, i
)
ßßi j
)
ßßj k
;
ßßk l
}
®® 
return
©© 
	NoContent
©© 
(
©© 
)
©© 
;
©© 
}
™™ 	
[
¨¨ 	
Route
¨¨	 
(
¨¨ 
$str
¨¨ 
)
¨¨ 
]
¨¨ 
[
≠≠ 	
HttpGet
≠≠	 
]
≠≠ 
public
ÆÆ 
async
ÆÆ 
Task
ÆÆ 
<
ÆÆ 
IActionResult
ÆÆ '
>
ÆÆ' (#
CheckRoomAvailability
ÆÆ) >
(
ÆÆ> ?
int
ÆÆ? B

roomNumber
ÆÆC M
,
ÆÆM N
DateTime
ÆÆO W
checkIn
ÆÆX _
,
ÆÆ_ `
DateTime
ÆÆa i
checkOut
ÆÆj r
)
ÆÆr s
{
ØØ 	
var
∞∞  
responseRoomNumber
∞∞ "
=
∞∞# $
await
∞∞% *
client
∞∞+ 1
.
∞∞1 2
GetAsync
∞∞2 :
(
∞∞: ;,
roomsManagementMicroserviceUri
∞∞; Y
+
∞∞Z [
$"
∞∞\ ^
/
∞∞^ _
{
∞∞_ `

roomNumber
∞∞` j
}
∞∞j k
"
∞∞k l
)
∞∞l m
;
∞∞m n
if
±± 
(
±±  
responseRoomNumber
±± "
.
±±" #

StatusCode
±±# -
==
±±. 0
System
±±1 7
.
±±7 8
Net
±±8 ;
.
±±; <
HttpStatusCode
±±< J
.
±±J K
NotFound
±±K S
)
±±S T
{
≤≤ 
return
≥≥ 

BadRequest
≥≥ !
(
≥≥! "
new
≥≥" %
Error
≥≥& +
(
≥≥+ ,
$"
≥≥, .$
Room with room number 
≥≥. D
{
≥≥D E

roomNumber
≥≥E O
}
≥≥O P
 does not exist.
≥≥P `
"
≥≥` a
)
≥≥a b
)
≥≥b c
;
≥≥c d
}
¥¥ 
if
µµ 
(
µµ 
!
µµ 

Validation
µµ 
.
µµ 
CheckValidDates
µµ +
(
µµ+ ,
checkIn
µµ, 3
,
µµ3 4
checkOut
µµ5 =
)
µµ= >
)
µµ> ?
{
∂∂ 
return
∑∑ 

BadRequest
∑∑ !
(
∑∑! "
new
∑∑" %
Error
∑∑& +
(
∑∑+ ,
$str
∑∑, O
)
∑∑O P
)
∑∑P Q
;
∑∑Q R
}
∏∏ 
var
ππ 
isAvailable
ππ 
=
ππ 
await
ππ #
_repository
ππ$ /
.
ππ/ 0(
CheckRoomAvailabilityAsync
ππ0 J
(
ππJ K

roomNumber
ππK U
,
ππU V
checkIn
ππW ^
,
ππ^ _
checkOut
ππ` h
)
ππh i
;
ππi j
return
∫∫ 
Ok
∫∫ 
(
∫∫ 
JsonConvert
∫∫ !
.
∫∫! "
SerializeObject
∫∫" 1
(
∫∫1 2
new
∫∫2 5
{
ªª 
	available
ºº 
=
ºº 
isAvailable
ºº '
}
ΩΩ 
)
ΩΩ 
)
ΩΩ 
;
ΩΩ 
}
ææ 	
}
¡¡ 
}¬¬ ∆q
sC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Data\BookingsRepository.cs
	namespace		 	
BookingMicroservice		
 
.		 
Data		 "
{

 
public 

class 
BookingsRepository #
:$ %
IBookingsRepository& 9
{ 
private 
readonly 
DataContext $
_context% -
;- .
public 
BookingsRepository !
(! "
DataContext" -
context. 5
)5 6
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
<% &
Booking& -
>- .
>. /
GetBookingsAsync0 @
(@ A
)A B
{ 	
return 
await 
_context !
.! "
Bookings" *
.* +
ToListAsync+ 6
(6 7
)7 8
;8 9
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Booking& -
>- .
>. /$
GetBookingsByUserIdAsync0 H
(H I
intI L
userIdM S
)S T
{ 	
return 
await 
_context !
.! "
Bookings" *
.* +
Where+ 0
(0 1
booking1 8
=>9 ;
booking< C
.C D
UserIdD J
==J L
userIdL R
)R S
.S T
ToListAsyncT _
(_ `
)` a
;a b
} 	
public 
async 
Task 
< 
GetBookingDto '
?' (
>( )
GetBookingByIdAsync* =
(= >
int> A
idB D
)D E
{ 	
var 
result 
= 
await 
_context '
.' (
Bookings( 0
.0 1
Where1 6
(6 7
booking7 >
=>? A
bookingB I
.I J
IdJ L
==M O
idP R
)R S
.S T
FirstOrDefaultAsyncT g
(g h
)h i
;i j
if 
( 
result 
== 
null 
) 
{   
return!! 
null!! 
;!! 
}"" 
return## 
new## 
GetBookingDto## $
(##$ %
)##% &
{$$ 
Id%% 
=%% 
result%% 
.%% 
Id%% 
,%% 

RoomNumber&& 
=&& 
result&& #
.&&# $

RoomNumber&&$ .
,&&. /
CheckIn'' 
='' 
result''  
.''  !
CheckIn''! (
,''( )
CheckOut(( 
=(( 
result(( !
.((! "
CheckOut((" *
,((* +
TotalPay)) 
=)) 
result)) !
.))! "
TotalPay))" *
,))* +
Status** 
=** 
result** 
.**  
Status**  &
}++ 
;++ 
},, 	
public.. 
async.. 
Task.. 
<.. 
int.. 
>.. 
AddBookingAsync.. .
(... /
PostBookingDto../ =
postBooking..> I
,..I J
int..K N
userId..O U
)..U V
{// 	
var11 
result11 
=11 
await11 
_context11 '
.11' (
Bookings11( 0
.110 1
AnyAsync111 9
(119 :
booking11: A
=>11B D
booking11E L
.11L M

RoomNumber11M W
==11X Z
postBooking11[ f
.11f g

RoomNumber11g q
&&11r t
booking11u |
.11| }
CheckIn	11} Ñ
==
11Ö á
postBooking
11à ì
.
11ì î
CheckIn
11î õ
&&22: <
booking22= D
.22D E
CheckOut22E M
==22N P
postBooking22Q \
.22\ ]
CheckOut22] e
&&22f h
booking22i p
.22p q
UserId22q w
==22x z
userId	22{ Å
)
22Å Ç
;
22Ç É
if33 
(33 
result33 
)33 
{44 
return55 
-55 
$num55 
;55 
}66 
var77 
isAddingPossible77  
=77! "
await77# (&
CheckRoomAvailabilityAsync77) C
(77C D
postBooking77D O
.77O P

RoomNumber77P Z
,77Z [
postBooking77\ g
.77g h
CheckIn77h o
,77o p
postBooking77q |
.77| }
CheckOut	77} Ö
)
77Ö Ü
;
77Ü á
if88 
(88 
isAddingPossible88  
)88  !
{99 
_context:: 
.:: 
Add:: 
(:: 
new::  
Booking::! (
(::( )
)::) *
{;; 
Id<< 
=<< 
$num<< 
,<< 

RoomNumber== 
===  
postBooking==! ,
.==, -

RoomNumber==- 7
,==7 8
CheckIn>> 
=>> 
postBooking>> )
.>>) *
CheckIn>>* 1
,>>1 2
CheckOut?? 
=?? 
postBooking?? *
.??* +
CheckOut??+ 3
,??3 4
UserId@@ 
=@@ 
userId@@ #
,@@# $
TotalPayAA 
=AA 
$numAA "
,AA" #
StatusBB 
=BB 
$strBB )
}DD 
)DD 
;DD 
awaitEE 
_contextEE 
.EE 
SaveChangesAsyncEE /
(EE/ 0
)EE0 1
;EE1 2
returnFF 
$numFF 
;FF 
}GG 
returnHH 
-HH 
$numHH 
;HH 
}II 	
publicKK 
asyncKK 
TaskKK 
<KK 
intKK 
>KK 
UpdateBookingAsyncKK 1
(KK1 2
PatchBookingDtoKK2 A
patchBookingKKB N
,KKN O
intKKP S
userIdKKT Z
)KKZ [
{LL 	
varMM 
resultMM 
=MM 
awaitMM 
_contextMM '
.MM' (
BookingsMM( 0
.MM0 1
WhereMM1 6
(MM6 7
bookingMM7 >
=>MM? A
bookingMMB I
.MMI J
IdMMJ L
==MMM O
patchBookingMMP \
.MM\ ]
IdMM] _
&&MM` b
bookingMMc j
.MMj k
UserIdMMk q
==MMr t
userIdMMu {
)MM{ |
.MM| } 
FirstOrDefaultAsync	MM} ê
(
MMê ë
)
MMë í
;
MMí ì
ifNN 
(NN 
resultNN 
==NN 
nullNN 
)NN 
{OO 
returnPP 
-PP 
$numPP 
;PP 
}QQ 
intRR 

roomNumberRR 
=RR 
resultRR #
.RR# $

RoomNumberRR$ .
;RR. /
varSS 
isUpdateNotPossibleSS #
=SS$ %
awaitSS& +
_contextSS, 4
.SS4 5
BookingsSS5 =
.SS= >
AnyAsyncSS> F
(SSF G
bookingSSG N
=>SSO Q
bookingSSR Y
.SSY Z
IdSSZ \
!=SS] _
patchBookingSS` l
.SSl m
IdSSm o
&&SSp r
bookingSSs z
.SSz {

RoomNumber	SS{ Ö
==
SSÜ à

roomNumber
SSâ ì
&&
SSî ñ
(TT5 6
(TT6 7
bookingTT7 >
.TT> ?
CheckInTT? F
>TTG H
patchBookingTTI U
.TTU V
CheckInTTV ]
&&TT^ `
bookingTTa h
.TTh i
CheckOutTTi q
<TTr s
patchBooking	TTt Ä
.
TTÄ Å
CheckOut
TTÅ â
)
TTâ ä
||
TTã ç
(UU6 7
bookingUU7 >
.UU> ?
CheckInUU? F
<UUG H
patchBookingUUI U
.UUU V
CheckInUUV ]
&&UU^ `
patchBookingUUa m
.UUm n
CheckInUUn u
<UUv w
bookingUUx 
.	UU Ä
CheckOut
UUÄ à
&&
UUâ ã
patchBooking
UUå ò
.
UUò ô
CheckOut
UUô °
>
UU¢ £
booking
UU§ ´
.
UU´ ¨
CheckOut
UU¨ ¥
)
UU¥ µ
||
UU∂ ∏
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
.VVh i
CheckInVVi p
<VVq r
patchBookingVVs 
.	VV Ä
CheckOut
VVÄ à
&&
VVâ ã
patchBooking
VVå ò
.
VVò ô
CheckOut
VVô °
<
VV¢ £
booking
VV§ ´
.
VV´ ¨
CheckOut
VV¨ ¥
)
VV¥ µ
||
VV∂ ∏
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
>WWr s
patchBooking	WWt Ä
.
WWÄ Å
CheckOut
WWÅ â
)
WWâ ä
)
WWä ã
)
WWã å
;
WWå ç
ifXX 
(XX 
isUpdateNotPossibleXX #
)XX# $
{YY 
returnZZ 
-ZZ 
$numZZ 
;ZZ 
}[[ 
result\\ 
.\\ 
CheckIn\\ 
=\\ 
patchBooking\\ )
.\\) *
CheckIn\\* 1
;\\1 2
result]] 
.]] 
CheckOut]] 
=]] 
patchBooking]] *
.]]* +
CheckOut]]+ 3
;]]3 4
result^^ 
.^^ 
Status^^ 
=^^ 
$str^^ %
;^^% &
await__ 
_context__ 
.__ 
SaveChangesAsync__ +
(__+ ,
)__, -
;__- .
return`` 
$num`` 
;`` 
}cc 	
publicee 
asyncee 
Taskee 
<ee 
IEnumerableee %
<ee% &
RoomDescriptionDtoee& 8
>ee8 9
>ee9 :%
SearchAvailableRoomsAsyncee; T
(eeT U
RoomSearchDtoeeU b
roomSearchDTOeec p
,eep q
Listeer v
<eev w
RoomDescriptionDto	eew â
>
eeâ ä
rooms
eeã ê
)
eeê ë
{ff 	
Listgg 
<gg 
RoomDescriptionDtogg #
>gg# $
returnValuegg% 0
=gg1 2
newgg3 6
Listgg7 ;
<gg; <
RoomDescriptionDtogg< N
>ggN O
(ggO P
)ggP Q
;ggQ R
foreachhh 
(hh 
varhh 
roomhh 
inhh 
roomshh  %
)hh% &
{ii 
ifjj 
(jj 
roomjj 
.jj 
PersonsNumberjj %
!=jj& (
roomSearchDTOjj) 6
.jj6 7
PersonsNumberjj7 D
||jjE G
roomjjH L
.jjL M
RoomCategoryjjM Y
!=jjZ \
roomSearchDTOjj] j
.jjj k
RoomCategoryjjk w
)jjw x
{kk 
continuell 
;ll 
}mm 
varnn 
isAvailablenn 
=nn  !
awaitnn" '&
CheckRoomAvailabilityAsyncnn( B
(nnB C
roomnnC G
.nnG H

RoomNumbernnH R
,nnR S
roomSearchDTOnnT a
.nna b
CheckInnnb i
,nni j
roomSearchDTOnnk x
.nnx y
CheckOut	nny Å
)
nnÅ Ç
;
nnÇ É
ifoo 
(oo 
!oo 
isAvailableoo  
)oo  !
{pp 
continueqq 
;qq 
}rr 
returnValuess 
.ss 
Addss 
(ss  
roomss  $
)ss$ %
;ss% &
}tt 
returnuu 
returnValueuu 
;uu 
}vv 	
publicxx 
asyncxx 
Taskxx 
<xx 
boolxx 
>xx &
CheckRoomAvailabilityAsyncxx  :
(xx: ;
intxx; >

roomNumberxx? I
,xxI J
DateTimexxK S
?xxS T
checkInxxU \
,xx\ ]
DateTimexx^ f
?xxf g
checkOutxxh p
)xxp q
{yy 	
varzz 

isReservedzz 
=zz 
awaitzz "
_contextzz# +
.zz+ ,
Bookingszz, 4
.zz4 5
AnyAsynczz5 =
(zz= >
bookingzz> E
=>zzF H
bookingzzI P
.zzP Q

RoomNumberzzQ [
==zz\ ^

roomNumberzz_ i
&&zzj l
({{5 6
({{6 7
booking{{7 >
.{{> ?
CheckIn{{? F
>{{G H
checkIn{{I P
&&{{Q S
booking{{T [
.{{[ \
CheckOut{{\ d
<{{e f
checkOut{{g o
){{o p
||{{q s
(||6 7
booking||7 >
.||> ?
CheckIn||? F
<||G H
checkIn||I P
&&||Q S
checkIn||T [
<||\ ]
booking||^ e
.||e f
CheckOut||f n
&&||o q
checkOut||r z
>||{ |
booking	||} Ñ
.
||Ñ Ö
CheckOut
||Ö ç
)
||ç é
||
||è ë
(}}6 7
booking}}7 >
.}}> ?
CheckIn}}? F
>}}G H
checkIn}}I P
&&}}Q S
booking}}T [
.}}[ \
CheckIn}}\ c
<}}d e
checkOut}}f n
&&}}o q
checkOut}}r z
<}}{ |
booking	}}} Ñ
.
}}Ñ Ö
CheckOut
}}Ö ç
)
}}ç é
||
}}è ë
(~~6 7
booking~~7 >
.~~> ?
CheckIn~~? F
<~~G H
checkIn~~I P
&&~~Q S
booking~~T [
.~~[ \
CheckOut~~\ d
>~~e f
checkOut~~g o
)~~o p
)~~p q
)~~q r
;~~r s
return 
! 

isReserved 
; 
}
ÄÄ 	
}
ÅÅ 
}ÇÇ ≠

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
} ù
tC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Data\IBookingsRepository.cs
	namespace 	
BookingMicroservice
 
. 
Data "
{		 
public

 

	interface

 
IBookingsRepository

 (
{ 
Task 
< 
IEnumerable 
< 
Booking  
>  !
>! "
GetBookingsAsync# 3
(3 4
)4 5
;5 6
Task 
< 
IEnumerable 
< 
Booking  
>  !
>! "$
GetBookingsByUserIdAsync# ;
(; <
int< ?
userId@ F
)F G
;G H
Task 
< 
GetBookingDto 
? 
> 
GetBookingByIdAsync 0
(0 1
int1 4
id5 7
)7 8
;8 9
Task 
< 
int 
> 
AddBookingAsync !
(! "
PostBookingDto" 0
postBooking1 <
,< =
int> A
userIdB H
)H I
;I J
Task 
< 
int 
> 
UpdateBookingAsync $
($ %
PatchBookingDto% 4
patchBooking5 A
,A B
intC F
userIdG M
)M N
;N O
Task 
< 
IEnumerable 
< 
RoomDescriptionDto +
>+ ,
>, -%
SearchAvailableRoomsAsync. G
(G H
RoomSearchDtoH U
roomSearchDTOV c
,c d
Liste i
<i j
RoomDescriptionDtoj |
>| }
rooms	~ É
)
É Ñ
;
Ñ Ö
Task 
< 
bool 
> &
CheckRoomAvailabilityAsync -
(- .
int. 1

roomNumber2 <
,< =
DateTime> F
?F G
checkInH O
,O P
DateTimeQ Y
?Y Z
checkOut[ c
)c d
;d e
} 
} ≠
àC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Data\Migrations\20210512081254_InitialCreate.cs
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
}## ´
nC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\DTOs\GetBookingDto.cs
	namespace 	
BookingMicroservice
 
. 
DTOs "
{ 
public 

class 
GetBookingDto 
{		 
public

 
GetBookingDto
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
GetBookingDto 
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
string 
? 
Status 
{ 
get  #
;# $
set% (
;( )
}* +
} 
}   ì
pC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\DTOs\PatchBookingDto.cs
	namespace 	
BookingMicroservice
 
. 
DTOs "
{ 
public 

class 
PatchBookingDto  
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
} ô
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
PostBookingDto 
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
}		- .
}

 
} §

sC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\DTOs\RoomDescriptionDto.cs
	namespace 	
BookingMicroservice
 
. 
DTOs "
{ 
public 

class 
RoomDescriptionDto #
{ 
public 
string 
? 
RoomCategory #
{$ %
get& )
;) *
set+ .
;. /
}0 1
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
string		 
?		 
Description		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
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
string 
? 

Facilities !
{" #
get$ '
;' (
set) ,
;, -
}. /
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
} …
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
RoomSearchDto 
{ 
public 
string 
? 
RoomCategory #
{$ %
get& )
;) *
set+ .
;. /
}0 1
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
} ˇ

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
public 
string 
? 
Status 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} ÿ

cC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Program.cs
	namespace 	
BookingMicroservice
 
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
}II ç-
rC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Utils\DataForUnitTests.cs
	namespace 	
BookingMicroservice
 
. 
Utils #
{ 
public 

class 
DataForUnitTests !
{ 
public		 
List		 
<		 
Booking		 
>		 
?		 
Bookings		 &
{		' (
get		) ,
;		, -
set		. 1
;		1 2
}		3 4
=		5 6
new		7 :
List		; ?
<		? @
Booking		@ G
>		G H
(		H I
)		I J
;		J K
public

 
string

 
JwtValid
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
+ ,
=

- .
$str	

/ ™
;


™ ´
public 
string 

JwtInvalid  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
$str	1 ¨
;
¨ ≠
public 
List 
< 
Booking 
> 

ReturnList '
(' (
)( )
{ 	
Bookings 
. 
AddRange 
( 
new !
Booking" )
[) *
]* +
{+ ,
new, /
Booking0 7
(7 8
)8 9
{ 
Id 
= 
$num 
, 

RoomNumber "
=# $
$num% (
,( )
CheckIn* 1
=2 3
new4 7
DateTime8 @
(@ A
$numA E
,E F
$numG I
,I J
$numK M
)M N
,N O
CheckOutP X
=Y Z
new[ ^
DateTime_ g
(g h
$numh l
,l m
$numn p
,p q
$numr t
)t u
,u v
UserId 
= 
$num 
, 
TotalPay %
=& '
$num( +
,+ ,
Status- 3
=4 5
$str6 B
} 
, 
new 
Booking 
( 
) 
{ 
Id 
= 
$num 
, 

RoomNumber "
=# $
$num% (
,( )
CheckIn* 1
=2 3
new4 7
DateTime8 @
(@ A
$numA E
,E F
$numG I
,I J
$numK M
)M N
,N O
CheckOutP X
=Y Z
new[ ^
DateTime_ g
(g h
$numh l
,l m
$numn p
,p q
$numr t
)t u
,u v
UserId 
= 
$num 
, 
TotalPay %
=& '
$num( +
,+ ,
Status- 3
=4 5
$str6 B
} 
, 
new 
Booking 
( 
) 
{ 
Id 
= 
$num 
, 

RoomNumber "
=# $
$num% (
,( )
CheckIn* 1
=2 3
new4 7
DateTime8 @
(@ A
$numA E
,E F
$numG I
,I J
$numK M
)M N
,N O
CheckOutP X
=Y Z
new[ ^
DateTime_ g
(g h
$numh l
,l m
$numn p
,p q
$numr t
)t u
,u v
UserId 
= 
$num 
, 
TotalPay %
=& '
$num( +
,+ ,
Status- 3
=4 5
$str6 B
} 
, 
new 
Booking 
( 
) 
{ 
Id   
=   
$num   
,   

RoomNumber   "
=  # $
$num  % (
,  ( )
CheckIn  * 1
=  2 3
new  4 7
DateTime  8 @
(  @ A
$num  A E
,  E F
$num  G I
,  I J
$num  K M
)  M N
,  N O
CheckOut  P X
=  Y Z
new  [ ^
DateTime  _ g
(  g h
$num  h l
,  l m
$num  n p
,  p q
$num  r t
)  t u
,  u v
UserId!! 
=!! 
$num!! 
,!! 
TotalPay!! %
=!!& '
$num!!( +
,!!+ ,
Status!!- 3
=!!4 5
$str!!6 B
}"" 
,"" 
new## 
Booking## 
(## 
)## 
{$$ 
Id%% 
=%% 
$num%% 
,%% 

RoomNumber%% "
=%%# $
$num%%% (
,%%( )
CheckIn%%* 1
=%%2 3
new%%4 7
DateTime%%8 @
(%%@ A
$num%%A E
,%%E F
$num%%G I
,%%I J
$num%%K M
)%%M N
,%%N O
CheckOut%%P X
=%%Y Z
new%%[ ^
DateTime%%_ g
(%%g h
$num%%h l
,%%l m
$num%%n p
,%%p q
$num%%r t
)%%t u
,%%u v
UserId&& 
=&& 
$num&& 
,&& 
TotalPay&& %
=&&& '
$num&&( +
,&&+ ,
Status&&- 3
=&&4 5
$str&&6 B
}'' 
}'' 
)'' 
;'' 
return(( 
Bookings(( 
;(( 
})) 	
}** 
}++ ◊
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
} ÿ

kC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Utils\ExtractId.cs
	namespace 	
BookingMicroservice
 
. 
Utils #
{ 
public 

static 
class 
	ExtractId !
{ 
public 
static 
int 
ExtractUserId '
(' (
string( .
jwt/ 2
)2 3
{		 	
string

 
claims

 
=

 
jwt

 
.

  
Split

  %
(

% &
$char

& )
)

) *
.

* +
ToList

+ 1
(

1 2
)

2 3
[

3 4
$num

4 5
]

5 6
.

6 7
Split

7 <
(

< =
$char

= @
)

@ A
.

A B
ToList

B H
(

H I
)

I J
[

J K
$num

K L
]

L M
;

M N
string 
id 
= 
claims 
. 
Remove %
(% &
claims& ,
., -
Length- 3
-4 5
$num6 7
)7 8
;8 9
return 
Int32 
. 
Parse 
( 
id !
)! "
;" #
} 	
} 
} ¢
nC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Utils\GenerateData.cs
	namespace 	
BookingMicroservice
 
. 
Utils #
{ 
public 

class 
GenerateData 
{		 
private

 
readonly

 
DataContext

 $
context

% ,
;

, -
public 
GenerateData 
( 
DataContext '
_context( 0
)0 1
{ 	
context 
= 
_context 
; 
} 	
public 
string 
SeedDataAndGetToken )
() *
string* 0
valid1 6
)6 7
{ 	
DataForUnitTests 
dataList %
=& '
new( +
DataForUnitTests, <
(< =
)= >
;> ?
List 
< 
Booking 
> 
FakeBookings &
=' (
dataList) 1
.1 2

ReturnList2 <
(< =
)= >
;> ?
for 
( 
int 
i 
= 
$num 
; 
i 
< 
FakeBookings  ,
., -
Count- 2
;2 3
i4 5
++5 7
)7 8
{ 
context 
. 
Add 
( 
FakeBookings (
[( )
i) *
]* +
)+ ,
;, -
context 
. 
SaveChanges #
(# $
)$ %
;% &
context 
. 
Entry 
< 
Booking %
>% &
(& '
FakeBookings' 3
[3 4
i4 5
]5 6
)6 7
.7 8
State8 =
=> ?
EntityState@ K
.K L
DetachedL T
;T U
} 
if 
( 
valid 
== 
$str  
)  !
{ 
return 
dataList 
.  
JwtValid  (
;( )
} 
else 
{   
return!! 
dataList!! 
.!!  

JwtInvalid!!  *
;!!* +
}"" 
}## 	
}$$ 
}%% ¯
lC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Utils\Validation.cs
	namespace 	
BookingMicroservice
 
. 
Utils #
{ 
public 

static 
class 

Validation "
{		 
public

 
static

 
bool

 
CheckValidDates

 *
(

* +
DateTime

+ 3
checkIn

4 ;
,

; <
DateTime

= E
checkOut

F N
)

N O
{ 	
if 
( 
( 
checkOut 
- 
checkIn #
)# $
.$ %
Days% )
<* +
$num, -
)- .
{ 
return 
false 
; 
} 
if 
( 
checkOut 
< 
DateTime #
.# $
Now$ '
)' (
{ 
return 
false 
; 
} 
return 
true 
; 
} 	
} 
} 