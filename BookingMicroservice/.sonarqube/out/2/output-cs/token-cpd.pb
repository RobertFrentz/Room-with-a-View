¬Ω
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
;* +
private 
readonly 
string *
usersManagementMicroserviceUri  >
=? @
$strA g
;g h
private 
readonly 
string *
roomsManagementMicroserviceUri  >
=? @
$strA f
;f g
public 
BookingsController !
(! "
IBookingsRepository" 5

repository6 @
)@ A
{ 	
_repository 
= 

repository $
;$ %
client 
= 
new 

HttpClient #
(# $
)$ %
;% &
} 	
[ 	
Route	 
( 
$str 
) 
] 
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetBookings) 4
(4 5
[5 6

FromHeader6 @
]@ A
stringB H
authorizationTokenI [
)[ \
{   	
client!! 
.!! !
DefaultRequestHeaders!! (
.!!( )
Add!!) ,
(!!, -
$str!!- A
,!!A B
authorizationToken!!C U
)!!U V
;!!V W
var"" !
responseAuthorization"" %
=""& '
await""( -
client"". 4
.""4 5
GetAsync""5 =
(""= >*
usersManagementMicroserviceUri""> \
+""] ^
$str""_ n
)""n o
;""o p
if## 
(## !
responseAuthorization## %
.##% &

StatusCode##& 0
==##1 3
System##4 :
.##: ;
Net##; >
.##> ?
HttpStatusCode##? M
.##M N
Unauthorized##N Z
)##Z [
{$$ 
return%% 
Unauthorized%% #
(%%# $!
responseAuthorization%%$ 9
.%%9 :
Content%%: A
.%%A B
ReadAsStringAsync%%B S
(%%S T
)%%T U
.%%U V
Result%%V \
)%%\ ]
;%%] ^
}&& 
var'' #
responseAdminPrivileges'' '
=''( )
await''* /
client''0 6
.''6 7
GetAsync''7 ?
(''? @*
usersManagementMicroserviceUri''@ ^
+''_ `
$str''a r
+''s t
$str''u }
+''~ #
responseAuthorization
''Ä ï
.
''ï ñ
Content
''ñ ù
.
''ù û
ReadAsStringAsync
''û Ø
(
''Ø ∞
)
''∞ ±
.
''± ≤
Result
''≤ ∏
)
''∏ π
;
''π ∫
if(( 
((( #
responseAdminPrivileges(( '
.((' (

StatusCode((( 2
==((3 5
System((6 <
.((< =
Net((= @
.((@ A
HttpStatusCode((A O
.((O P
Unauthorized((P \
)((\ ]
{)) 
return** 
Unauthorized** #
(**# $#
responseAdminPrivileges**$ ;
.**; <
Content**< C
.**C D
ReadAsStringAsync**D U
(**U V
)**V W
.**W X
Result**X ^
)**^ _
;**_ `
}++ 
var,, 
bookings,, 
=,, 
await,,  
_repository,,! ,
.,,, -
GetBookingsAsync,,- =
(,,= >
),,> ?
;,,? @
return-- 
Ok-- 
(-- 
bookings-- 
)-- 
;--  
}.. 	
[11 	
HttpGet11	 
]11 
public22 
async22 
Task22 
<22 
IActionResult22 '
>22' ($
GetBookingsByUserIdAsync22) A
(22A B
[22B C

FromHeader22C M
]22M N
string22O U
authorizationToken22V h
)22h i
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
}99 
var:: 
userId:: 
=:: 
Extract::  
.::  !
ExtractUserId::! .
(::. /!
responseAuthorization::/ D
.::D E
Content::E L
.::L M
ReadAsStringAsync::M ^
(::^ _
)::_ `
.::` a
Result::a g
)::g h
;::h i
var;; 
bookings;; 
=;; 
await;;  
_repository;;! ,
.;;, -$
GetBookingsByUserIdAsync;;- E
(;;E F
userId;;F L
);;L M
;;;M N
return<< 
Ok<< 
(<< 
bookings<< 
)<< 
;<<  
}== 	
[?? 	
HttpGet??	 
(?? 
$str?? 
)?? 
]?? 
public@@ 
async@@ 
Task@@ 
<@@ 
IActionResult@@ '
>@@' (
GetBookingByIdAsync@@) <
(@@< =
int@@= @
id@@A C
,@@C D
[@@E F

FromHeader@@F P
]@@P Q
string@@R X
authorizationToken@@Y k
)@@k l
{AA 	
clientBB 
.BB !
DefaultRequestHeadersBB (
.BB( )
AddBB) ,
(BB, -
$strBB- A
,BBA B
authorizationTokenBBC U
)BBU V
;BBV W
varCC !
responseAuthorizationCC %
=CC& '
awaitCC( -
clientCC. 4
.CC4 5
GetAsyncCC5 =
(CC= >*
usersManagementMicroserviceUriCC> \
+CC] ^
$strCC_ n
)CCn o
;CCo p
ifDD 
(DD !
responseAuthorizationDD %
.DD% &

StatusCodeDD& 0
==DD1 3
SystemDD4 :
.DD: ;
NetDD; >
.DD> ?
HttpStatusCodeDD? M
.DDM N
UnauthorizedDDN Z
)DDZ [
{EE 
returnFF 
UnauthorizedFF #
(FF# $!
responseAuthorizationFF$ 9
.FF9 :
ContentFF: A
.FFA B
ReadAsStringAsyncFFB S
(FFS T
)FFT U
.FFU V
ResultFFV \
)FF\ ]
;FF] ^
}GG 
varHH 
resultHH 
=HH 
awaitHH 
_repositoryHH *
.HH* +
GetBookingByIdAsyncHH+ >
(HH> ?
idHH? A
)HHA B
;HHB C
ifII 
(II 
resultII 
==II 
nullII 
)II 
{JJ 
returnKK 
NotFoundKK 
(KK  
newKK  #
ErrorKK$ )
(KK) *
$"KK* ,
$strKK, <
{KK< =
idKK= ?
}KK? @
$strKK@ P
"KKP Q
)KKQ R
)KKR S
;KKS T
}LL 
returnMM 
OkMM 
(MM 
JsonConvertMM !
.MM! "
SerializeObjectMM" 1
(MM1 2
newMM2 5
{NN 
IdOO 
=OO 
resultOO 
.OO 
IdOO 
,OO 

RoomNumberPP 
=PP 
resultPP #
.PP# $

RoomNumberPP$ .
,PP. /
CheckInQQ 
=QQ 
resultQQ  
.QQ  !
CheckInQQ! (
,QQ( )
CheckOutRR 
=RR 
resultRR !
.RR! "
CheckOutRR" *
,RR* +
TotalPaySS 
=SS 
resultSS !
.SS! "
TotalPaySS" *
,SS* +
StatusTT 
=TT 
resultTT 
.TT  
StatusTT  &
}UU 
)UU 
)UU 
;UU 
}VV 	
[WW 	
RouteWW	 
(WW 
$strWW 
)WW 
]WW 
[XX 	
HttpGetXX	 
]XX 
publicYY 
asyncYY 
TaskYY 
<YY 
IActionResultYY '
>YY' (%
SearchAvailableRoomsAsyncYY) B
(YYB C
[YYC D
	FromQueryYYD M
]YYM N
RoomSearchDtoYYO \
roomSearchDTOYY] j
)YYj k
{ZZ 	
if[[ 
([[ 
![[ 

Validation[[ 
.[[ 
CheckValidDates[[ +
([[+ ,
roomSearchDTO[[, 9
.[[9 :
CheckIn[[: A
,[[A B
roomSearchDTO[[C P
.[[P Q
CheckOut[[Q Y
)[[Y Z
)[[Z [
{\\ 
return]] 

BadRequest]] !
(]]! "
new]]" %
Error]]& +
(]]+ ,
$str]], O
)]]O P
)]]P Q
;]]Q R
}^^ 
var__ 
httpResultContent__ !
=__" #
await__$ )
client__* 0
.__0 1
GetStringAsync__1 ?
(__? @*
roomsManagementMicroserviceUri__@ ^
)__^ _
;___ `
if`` 
(`` 
httpResultContent`` !
!=``" $
null``% )
)``) *
{aa 
Listbb 
<bb 
RoomDescriptionDtobb '
>bb' (
?bb( )
roomsbb* /
=bb0 1
JsonConvertbb2 =
.bb= >
DeserializeObjectbb> O
<bbO P
ListbbP T
<bbT U
RoomDescriptionDtobbU g
>bbg h
>bbh i
(bbi j
httpResultContentbbj {
)bb{ |
;bb| }
ifcc 
(cc 
roomscc 
!=cc 
nullcc !
)cc! "
{dd 
varee 
resultee 
=ee  
_repositoryee! ,
.ee, -%
SearchAvailableRoomsAsyncee- F
(eeF G
roomSearchDTOeeG T
,eeT U
roomseeV [
)ee[ \
;ee\ ]
ifff 
(ff 
resultff 
==ff !
nullff" &
)ff& '
{gg 
returnhh 
NotFoundhh '
(hh' (
newhh( +
Errorhh, 1
(hh1 2
$strhh2 F
)hhF G
)hhG H
;hhH I
}ii 
returnjj 
Okjj 
(jj 
JsonConvertjj )
.jj) *
SerializeObjectjj* 9
(jj9 :
newjj: =
{kk 
roomsll 
=ll 
resultll  &
.ll& '
Resultll' -
}mm 
)mm 
)mm 
;mm 
}nn 
}pp 
returnqq 
NotFoundqq 
(qq 
newqq 
Errorqq  %
(qq% &
$strqq& 7
)qq7 8
)qq8 9
;qq9 :
}rr 	
[tt 	
HttpPosttt	 
]tt 
publicuu 
asyncuu 
Taskuu 
<uu 
IActionResultuu '
>uu' (
AddBookingAsyncuu) 8
(uu8 9
[uu9 :
FromBodyuu: B
]uuB C
PostBookingDtouuD R
postBookinguuS ^
,uu^ _
[uu` a

FromHeaderuua k
]uuk l
stringuum s
authorizationToken	uut Ü
)
uuÜ á
{vv 	
clientww 
.ww !
DefaultRequestHeadersww (
.ww( )
Addww) ,
(ww, -
$strww- A
,wwA B
authorizationTokenwwC U
)wwU V
;wwV W
varxx !
responseAuthorizationxx %
=xx& '
awaitxx( -
clientxx. 4
.xx4 5
GetAsyncxx5 =
(xx= >*
usersManagementMicroserviceUrixx> \
+xx] ^
$strxx_ n
)xxn o
;xxo p
ifyy 
(yy !
responseAuthorizationyy %
.yy% &

StatusCodeyy& 0
==yy1 3
Systemyy4 :
.yy: ;
Netyy; >
.yy> ?
HttpStatusCodeyy? M
.yyM N
UnauthorizedyyN Z
)yyZ [
{zz 
return{{ 
Unauthorized{{ #
({{# $!
responseAuthorization{{$ 9
.{{9 :
Content{{: A
.{{A B
ReadAsStringAsync{{B S
({{S T
){{T U
.{{U V
Result{{V \
){{\ ]
;{{] ^
}|| 
var}} 
userId}} 
=}} 
Extract}}  
.}}  !
ExtractUserId}}! .
(}}. /!
responseAuthorization}}/ D
.}}D E
Content}}E L
.}}L M
ReadAsStringAsync}}M ^
(}}^ _
)}}_ `
.}}` a
Result}}a g
)}}g h
;}}h i
var~~ 
responseRoomNumber~~ "
=~~# $
await~~% *
client~~+ 1
.~~1 2
GetAsync~~2 :
(~~: ;*
roomsManagementMicroserviceUri~~; Y
+~~Z [
$"~~\ ^
$str~~^ _
{~~_ `
postBooking~~` k
.~~k l

RoomNumber~~l v
}~~v w
"~~w x
)~~x y
;~~y z
int 
price 
; 
if
ÄÄ 
(
ÄÄ  
responseRoomNumber
ÄÄ "
.
ÄÄ" #

StatusCode
ÄÄ# -
==
ÄÄ. 0
System
ÄÄ1 7
.
ÄÄ7 8
Net
ÄÄ8 ;
.
ÄÄ; <
HttpStatusCode
ÄÄ< J
.
ÄÄJ K
NotFound
ÄÄK S
)
ÄÄS T
{
ÅÅ 
return
ÇÇ 

BadRequest
ÇÇ !
(
ÇÇ! "
new
ÇÇ" %
Error
ÇÇ& +
(
ÇÇ+ ,
$"
ÇÇ, .
$str
ÇÇ. D
{
ÇÇD E
postBooking
ÇÇE P
.
ÇÇP Q

RoomNumber
ÇÇQ [
}
ÇÇ[ \
$str
ÇÇ\ l
"
ÇÇl m
)
ÇÇm n
)
ÇÇn o
;
ÇÇo p
}
ÉÉ 
Console
ÑÑ 
.
ÑÑ 
	WriteLine
ÑÑ 
(
ÑÑ  
responseRoomNumber
ÑÑ 0
.
ÑÑ0 1
Content
ÑÑ1 8
.
ÑÑ8 9
ReadAsStringAsync
ÑÑ9 J
(
ÑÑJ K
)
ÑÑK L
.
ÑÑL M
Result
ÑÑM S
)
ÑÑS T
;
ÑÑT U
price
ÖÖ 
=
ÖÖ 
Extract
ÖÖ 
.
ÖÖ 
ExtractPrice
ÖÖ (
(
ÖÖ( ) 
responseRoomNumber
ÖÖ) ;
.
ÖÖ; <
Content
ÖÖ< C
.
ÖÖC D
ReadAsStringAsync
ÖÖD U
(
ÖÖU V
)
ÖÖV W
.
ÖÖW X
Result
ÖÖX ^
)
ÖÖ^ _
;
ÖÖ_ `
if
áá 
(
áá 
!
áá 

Validation
áá 
.
áá 
CheckValidDates
áá +
(
áá+ ,
postBooking
áá, 7
.
áá7 8
CheckIn
áá8 ?
,
áá? @
postBooking
ááA L
.
ááL M
CheckOut
ááM U
)
ááU V
)
ááV W
{
àà 
return
ââ 

BadRequest
ââ !
(
ââ! "
new
ââ" %
Error
ââ& +
(
ââ+ ,
$str
ââ, O
)
ââO P
)
ââP Q
;
ââQ R
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
AddBookingAsync
ãã+ :
(
ãã: ;
postBooking
ãã; F
,
ããF G
userId
ããH N
,
ããN O
price
ããP U
)
ããU V
;
ããV W
if
åå 
(
åå 
result
åå 
==
åå 
-
åå 
$num
åå 
)
åå 
{
çç 
return
éé 

BadRequest
éé !
(
éé! "
new
éé" %
Error
éé& +
(
éé+ ,
$str
éé, E
)
ééE F
)
ééF G
;
ééG H
}
èè 
if
êê 
(
êê 
result
êê 
==
êê 
-
êê 
$num
êê 
)
êê 
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
ïï 
CreatedAtAction
ïï "
(
ïï" #
$str
ïï# /
,
ïï/ 0
postBooking
ïï1 <
)
ïï< =
;
ïï= >
}
ññ 	
[
òò 	
	HttpPatch
òò	 
]
òò 
public
ôô 
async
ôô 
Task
ôô 
<
ôô 
IActionResult
ôô '
>
ôô' ( 
UpdateBookingAsync
ôô) ;
(
ôô; <
[
ôô< =
FromBody
ôô= E
]
ôôE F
PatchBookingDto
ôôG V
patchBooking
ôôW c
,
ôôc d
[
ôôe f

FromHeader
ôôf p
]
ôôp q
string
ôôr x!
authorizationTokenôôy ã
)ôôã å
{
öö 	
client
õõ 
.
õõ #
DefaultRequestHeaders
õõ (
.
õõ( )
Add
õõ) ,
(
õõ, -
$str
õõ- A
,
õõA B 
authorizationToken
õõC U
)
õõU V
;
õõV W
var
úú #
responseAuthorization
úú %
=
úú& '
await
úú( -
client
úú. 4
.
úú4 5
GetAsync
úú5 =
(
úú= >,
usersManagementMicroserviceUri
úú> \
+
úú] ^
$str
úú_ n
)
úún o
;
úúo p
if
ùù 
(
ùù #
responseAuthorization
ùù %
.
ùù% &

StatusCode
ùù& 0
==
ùù1 3
System
ùù4 :
.
ùù: ;
Net
ùù; >
.
ùù> ?
HttpStatusCode
ùù? M
.
ùùM N
Unauthorized
ùùN Z
)
ùùZ [
{
ûû 
return
üü 
Unauthorized
üü #
(
üü# $#
responseAuthorization
üü$ 9
.
üü9 :
Content
üü: A
.
üüA B
ReadAsStringAsync
üüB S
(
üüS T
)
üüT U
.
üüU V
Result
üüV \
)
üü\ ]
;
üü] ^
}
†† 
var
°° 
userId
°° 
=
°° 
Extract
°°  
.
°°  !
ExtractUserId
°°! .
(
°°. /#
responseAuthorization
°°/ D
.
°°D E
Content
°°E L
.
°°L M
ReadAsStringAsync
°°M ^
(
°°^ _
)
°°_ `
.
°°` a
Result
°°a g
)
°°g h
;
°°h i
var
¢¢ 
result
¢¢ 
=
¢¢ 
await
¢¢ 
_repository
¢¢ *
.
¢¢* + 
UpdateBookingAsync
¢¢+ =
(
¢¢= >
patchBooking
¢¢> J
,
¢¢J K
userId
¢¢L R
)
¢¢R S
;
¢¢S T
if
££ 
(
££ 
!
££ 

Validation
££ 
.
££ 
CheckValidDates
££ +
(
££+ ,
patchBooking
££, 8
.
££8 9
CheckIn
££9 @
,
££@ A
patchBooking
££B N
.
££N O
CheckOut
££O W
)
££W X
)
££X Y
{
§§ 
return
•• 

BadRequest
•• !
(
••! "
new
••" %
Error
••& +
(
••+ ,
$str
••, O
)
••O P
)
••P Q
;
••Q R
}
¶¶ 
if
ßß 
(
ßß 
result
ßß 
==
ßß 
-
ßß 
$num
ßß 
)
ßß 
{
®® 
return
©© 
NotFound
©© 
(
©©  
new
©©  #
Error
©©$ )
(
©©) *
$"
©©* ,
$str
©©, <
{
©©< =
patchBooking
©©= I
.
©©I J
Id
©©J L
}
©©L M
$str
©©M ]
"
©©] ^
)
©©^ _
)
©©_ `
;
©©` a
}
™™ 
if
´´ 
(
´´ 
result
´´ 
==
´´ 
-
´´ 
$num
´´ 
)
´´ 
{
¨¨ 
return
≠≠ 

BadRequest
≠≠ !
(
≠≠! "
new
≠≠" %
Error
≠≠& +
(
≠≠+ ,
$str
≠≠, i
)
≠≠i j
)
≠≠j k
;
≠≠k l
}
ÆÆ 
return
ØØ 
	NoContent
ØØ 
(
ØØ 
)
ØØ 
;
ØØ 
}
∞∞ 	
[
≤≤ 	
Route
≤≤	 
(
≤≤ 
$str
≤≤ 
)
≤≤ 
]
≤≤ 
[
≥≥ 	
HttpGet
≥≥	 
]
≥≥ 
public
¥¥ 
async
¥¥ 
Task
¥¥ 
<
¥¥ 
IActionResult
¥¥ '
>
¥¥' (#
CheckRoomAvailability
¥¥) >
(
¥¥> ?
int
¥¥? B

roomNumber
¥¥C M
,
¥¥M N
DateTime
¥¥O W
checkIn
¥¥X _
,
¥¥_ `
DateTime
¥¥a i
checkOut
¥¥j r
)
¥¥r s
{
µµ 	
var
∂∂  
responseRoomNumber
∂∂ "
=
∂∂# $
await
∂∂% *
client
∂∂+ 1
.
∂∂1 2
GetAsync
∂∂2 :
(
∂∂: ;,
roomsManagementMicroserviceUri
∂∂; Y
+
∂∂Z [
$"
∂∂\ ^
$str
∂∂^ _
{
∂∂_ `

roomNumber
∂∂` j
}
∂∂j k
"
∂∂k l
)
∂∂l m
;
∂∂m n
if
∑∑ 
(
∑∑  
responseRoomNumber
∑∑ "
.
∑∑" #

StatusCode
∑∑# -
==
∑∑. 0
System
∑∑1 7
.
∑∑7 8
Net
∑∑8 ;
.
∑∑; <
HttpStatusCode
∑∑< J
.
∑∑J K
NotFound
∑∑K S
)
∑∑S T
{
∏∏ 
return
ππ 

BadRequest
ππ !
(
ππ! "
new
ππ" %
Error
ππ& +
(
ππ+ ,
$"
ππ, .
$str
ππ. D
{
ππD E

roomNumber
ππE O
}
ππO P
$str
ππP `
"
ππ` a
)
ππa b
)
ππb c
;
ππc d
}
∫∫ 
if
ªª 
(
ªª 
!
ªª 

Validation
ªª 
.
ªª 
CheckValidDates
ªª +
(
ªª+ ,
checkIn
ªª, 3
,
ªª3 4
checkOut
ªª5 =
)
ªª= >
)
ªª> ?
{
ºº 
return
ΩΩ 

BadRequest
ΩΩ !
(
ΩΩ! "
new
ΩΩ" %
Error
ΩΩ& +
(
ΩΩ+ ,
$str
ΩΩ, O
)
ΩΩO P
)
ΩΩP Q
;
ΩΩQ R
}
ææ 
var
øø 
isAvailable
øø 
=
øø 
await
øø #
_repository
øø$ /
.
øø/ 0(
CheckRoomAvailabilityAsync
øø0 J
(
øøJ K

roomNumber
øøK U
,
øøU V
checkIn
øøW ^
,
øø^ _
checkOut
øø` h
)
øøh i
;
øøi j
return
¿¿ 
Ok
¿¿ 
(
¿¿ 
JsonConvert
¿¿ !
.
¿¿! "
SerializeObject
¿¿" 1
(
¿¿1 2
new
¿¿2 5
{
¡¡ 
	available
¬¬ 
=
¬¬ 
isAvailable
¬¬ '
}
√√ 
)
√√ 
)
√√ 
;
√√ 
}
ƒƒ 	
}
«« 
}»» ƒy
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
,..U V
int..W Z
price..[ `
)..` a
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
int77 
totalPay77 
=77 
price77  
*77! "
(77# $
postBooking77$ /
.77/ 0
CheckOut770 8
-779 :
postBooking77; F
.77F G
CheckIn77G N
)77N O
.77O P
Days77P T
;77T U
var88 
isAddingPossible88  
=88! "
await88# (&
CheckRoomAvailabilityAsync88) C
(88C D
postBooking88D O
.88O P

RoomNumber88P Z
,88Z [
postBooking88\ g
.88g h
CheckIn88h o
,88o p
postBooking88q |
.88| }
CheckOut	88} Ö
)
88Ö Ü
;
88Ü á
if99 
(99 
isAddingPossible99  
)99  !
{:: 
_context;; 
.;; 
Add;; 
(;; 
new;;  
Booking;;! (
(;;( )
);;) *
{<< 
Id== 
=== 
$num== 
,== 

RoomNumber>> 
=>>  
postBooking>>! ,
.>>, -

RoomNumber>>- 7
,>>7 8
CheckIn?? 
=?? 
postBooking?? )
.??) *
CheckIn??* 1
,??1 2
CheckOut@@ 
=@@ 
postBooking@@ *
.@@* +
CheckOut@@+ 3
,@@3 4
UserIdAA 
=AA 
userIdAA #
,AA# $
TotalPayBB 
=BB 
totalPayBB '
,BB' (
StatusCC 
=CC 
$strCC )
}EE 
)EE 
;EE 
awaitFF 
_contextFF 
.FF 
SaveChangesAsyncFF /
(FF/ 0
)FF0 1
;FF1 2
returnGG 
$numGG 
;GG 
}HH 
returnII 
-II 
$numII 
;II 
}JJ 	
publicLL 
asyncLL 
TaskLL 
<LL 
intLL 
>LL 
UpdateBookingAsyncLL 1
(LL1 2
PatchBookingDtoLL2 A
patchBookingLLB N
,LLN O
intLLP S
userIdLLT Z
)LLZ [
{MM 	
varNN 
resultNN 
=NN 
awaitNN 
_contextNN '
.NN' (
BookingsNN( 0
.NN0 1
WhereNN1 6
(NN6 7
bookingNN7 >
=>NN? A
bookingNNB I
.NNI J
IdNNJ L
==NNM O
patchBookingNNP \
.NN\ ]
IdNN] _
&&NN` b
bookingNNc j
.NNj k
UserIdNNk q
==NNr t
userIdNNu {
)NN{ |
.NN| } 
FirstOrDefaultAsync	NN} ê
(
NNê ë
)
NNë í
;
NNí ì
ifOO 
(OO 
resultOO 
==OO 
nullOO 
)OO 
{PP 
returnQQ 
-QQ 
$numQQ 
;QQ 
}RR 
intSS 

roomNumberSS 
=SS 
resultSS #
.SS# $

RoomNumberSS$ .
;SS. /
varTT 
isUpdateNotPossibleTT #
=TT$ %
awaitTT& +
_contextTT, 4
.TT4 5
BookingsTT5 =
.TT= >
AnyAsyncTT> F
(TTF G
bookingTTG N
=>TTO Q
bookingTTR Y
.TTY Z
IdTTZ \
!=TT] _
patchBookingTT` l
.TTl m
IdTTm o
&&TTp r
bookingTTs z
.TTz {

RoomNumber	TT{ Ö
==
TTÜ à

roomNumber
TTâ ì
&&
TTî ñ
(UU5 6
(UU6 7
bookingUU7 >
.UU> ?
CheckInUU? F
>UUG H
patchBookingUUI U
.UUU V
CheckInUUV ]
&&UU^ `
bookingUUa h
.UUh i
CheckOutUUi q
<UUr s
patchBooking	UUt Ä
.
UUÄ Å
CheckOut
UUÅ â
)
UUâ ä
||
UUã ç
(VV6 7
bookingVV7 >
.VV> ?
CheckInVV? F
<VVG H
patchBookingVVI U
.VVU V
CheckInVVV ]
&&VV^ `
patchBookingVVa m
.VVm n
CheckInVVn u
<VVv w
bookingVVx 
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
>
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
>WWG H
patchBookingWWI U
.WWU V
CheckInWWV ]
&&WW^ `
bookingWWa h
.WWh i
CheckInWWi p
<WWq r
patchBookingWWs 
.	WW Ä
CheckOut
WWÄ à
&&
WWâ ã
patchBooking
WWå ò
.
WWò ô
CheckOut
WWô °
<
WW¢ £
booking
WW§ ´
.
WW´ ¨
CheckOut
WW¨ ¥
)
WW¥ µ
||
WW∂ ∏
(XX6 7
bookingXX7 >
.XX> ?
CheckInXX? F
==XXG I
patchBookingXXJ V
.XXV W
CheckInXXW ^
||XX_ a
bookingXXb i
.XXi j
CheckOutXXj r
==XXs u
patchBooking	XXv Ç
.
XXÇ É
CheckOut
XXÉ ã
)
XXã å
||
XXç è
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
;
YYå ç
ifZZ 
(ZZ 
isUpdateNotPossibleZZ #
)ZZ# $
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
;__3 4
result`` 
.`` 
Status`` 
=`` 
$str`` %
;``% &
awaitaa 
_contextaa 
.aa 
SaveChangesAsyncaa +
(aa+ ,
)aa, -
;aa- .
returnbb 
$numbb 
;bb 
}ee 	
publicgg 
asyncgg 
Taskgg 
<gg 
IEnumerablegg %
<gg% &
RoomDescriptionDtogg& 8
>gg8 9
>gg9 :%
SearchAvailableRoomsAsyncgg; T
(ggT U
RoomSearchDtoggU b
roomSearchDTOggc p
,ggp q
Listggr v
<ggv w
RoomDescriptionDto	ggw â
>
ggâ ä
rooms
ggã ê
)
ggê ë
{hh 	
Listii 
<ii 
RoomDescriptionDtoii #
>ii# $
returnValueii% 0
=ii1 2
newii3 6
Listii7 ;
<ii; <
RoomDescriptionDtoii< N
>iiN O
(iiO P
)iiP Q
;iiQ R
foreachjj 
(jj 
varjj 
roomjj 
injj 
roomsjj  %
)jj% &
{kk 
ifll 
(ll 
roomll 
.ll 
PersonsNumberll %
!=ll& (
roomSearchDTOll) 6
.ll6 7
PersonsNumberll7 D
||llE G
roomllH L
.llL M
RoomCategoryllM Y
!=llZ \
roomSearchDTOll] j
.llj k
RoomCategoryllk w
)llw x
{mm 
continuenn 
;nn 
}oo 
varpp 
isAvailablepp 
=pp  !
awaitpp" '&
CheckRoomAvailabilityAsyncpp( B
(ppB C
roomppC G
.ppG H

RoomNumberppH R
,ppR S
roomSearchDTOppT a
.ppa b
CheckInppb i
,ppi j
roomSearchDTOppk x
.ppx y
CheckOut	ppy Å
)
ppÅ Ç
;
ppÇ É
ifqq 
(qq 
!qq 
isAvailableqq  
)qq  !
{rr 
continuess 
;ss 
}tt 
returnValueuu 
.uu 
Adduu 
(uu  
roomuu  $
)uu$ %
;uu% &
}vv 
returnww 
returnValueww 
;ww 
}xx 	
publiczz 
asynczz 
Taskzz 
<zz 
boolzz 
>zz &
CheckRoomAvailabilityAsynczz  :
(zz: ;
intzz; >

roomNumberzz? I
,zzI J
DateTimezzK S
?zzS T
checkInzzU \
,zz\ ]
DateTimezz^ f
?zzf g
checkOutzzh p
)zzp q
{{{ 	
var|| 

isReserved|| 
=|| 
await|| "
_context||# +
.||+ ,
Bookings||, 4
.||4 5
AnyAsync||5 =
(||= >
booking||> E
=>||F H
booking||I P
.||P Q

RoomNumber||Q [
==||\ ^

roomNumber||_ i
&&||j l
(}}5 6
(}}6 7
booking}}7 >
.}}> ?
CheckIn}}? F
>}}G H
checkIn}}I P
&&}}Q S
booking}}T [
.}}[ \
CheckOut}}\ d
<}}e f
checkOut}}g o
)}}o p
||}}q s
(~~6 7
booking~~7 >
.~~> ?
CheckIn~~? F
<~~G H
checkIn~~I P
&&~~Q S
checkIn~~T [
<~~\ ]
booking~~^ e
.~~e f
CheckOut~~f n
&&~~o q
checkOut~~r z
>~~{ |
booking	~~} Ñ
.
~~Ñ Ö
CheckOut
~~Ö ç
)
~~ç é
||
~~è ë
(6 7
booking7 >
.> ?
CheckIn? F
>G H
checkInI P
&&Q S
bookingT [
.[ \
CheckIn\ c
<d e
checkOutf n
&&o q
checkOutr z
<{ |
booking	} Ñ
.
Ñ Ö
CheckOut
Ö ç
)
ç é
||
è ë
(
ÄÄ6 7
booking
ÄÄ7 >
.
ÄÄ> ?
CheckIn
ÄÄ? F
==
ÄÄG I
checkIn
ÄÄJ Q
||
ÄÄR T
booking
ÄÄU \
.
ÄÄ\ ]
CheckOut
ÄÄ] e
==
ÄÄf h
checkOut
ÄÄi q
)
ÄÄq r
||
ÄÄs u
(
ÅÅ6 7
booking
ÅÅ7 >
.
ÅÅ> ?
CheckIn
ÅÅ? F
<
ÅÅG H
checkIn
ÅÅI P
&&
ÅÅQ S
booking
ÅÅT [
.
ÅÅ[ \
CheckOut
ÅÅ\ d
>
ÅÅe f
checkOut
ÅÅg o
)
ÅÅo p
)
ÅÅp q
)
ÅÅq r
;
ÅÅr s
return
ÇÇ 
!
ÇÇ 

isReserved
ÇÇ 
;
ÇÇ 
}
ÉÉ 	
}
ÑÑ 
}ÖÖ ≠

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
} –
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
,H I
intJ M
priceN S
)S T
;T U
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
} Ω
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
}- .
public 
string 
Image 
{ 
get !
;! "
set# &
;& '
}( )
} 
} …
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
} Ô
iC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Utils\Extract.cs
	namespace 	
BookingMicroservice
 
. 
Utils #
{ 
public 

static 
class 
Extract 
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
} 	
public 
static 
int 
ExtractPrice &
(& '
string' -
data. 2
)2 3
{ 	
int 
startPos 
= 
data 
.  
IndexOf  '
(' (
$str( 2
)2 3
;3 4
int 
i 
= 
startPos 
+ 
$num  
;  !
while 
( 
data 
[ 
i 
] 
!= 
$char  
)  !
{ 
i 
++ 
; 
} 
return 
Int32 
. 
Parse 
( 
data #
.# $
	Substring$ -
(- .
startPos. 6
+7 8
$num9 :
,: ;
i< =
-> ?
startPos@ H
-I J
$numK L
)L M
)M N
;N O
} 	
} 
} ¯
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