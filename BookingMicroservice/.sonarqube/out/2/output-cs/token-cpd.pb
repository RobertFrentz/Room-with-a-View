˘∫
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
var&& #
responseAdminPrivileges&& '
=&&( )
await&&* /
client&&0 6
.&&6 7
GetAsync&&7 ?
(&&? @*
usersManagementMicroserviceUri&&@ ^
+&&_ `
$str&&a r
+&&s t
$str&&u }
+&&} ~"
responseAuthorization	&& î
.
&&î ï
Content
&&ï ú
.
&&ú ù
ReadAsStringAsync
&&ù Æ
(
&&Æ Ø
)
&&Ø ∞
.
&&∞ ±
Result
&&± ∑
)
&&∑ ∏
;
&&∏ π
if'' 
('' #
responseAdminPrivileges'' '
.''' (

StatusCode''( 2
==''3 5
System''6 <
.''< =
Net''= @
.''@ A
HttpStatusCode''A O
.''O P
Unauthorized''P \
)''\ ]
{(( 
return)) 
Unauthorized)) #
())# $#
responseAdminPrivileges))$ ;
.)); <
Content))< C
.))C D
ReadAsStringAsync))D U
())U V
)))V W
.))W X
Result))X ^
)))^ _
;))_ `
}** 
var++ 
bookings++ 
=++ 
await++  
_repository++! ,
.++, -
GetBookingsAsync++- =
(++= >
)++> ?
;++? @
return,, 
Ok,, 
(,, 
bookings,, 
),, 
;,,  
}-- 	
[00 	
HttpGet00	 
]00 
public11 
async11 
Task11 
<11 
IActionResult11 '
>11' ($
GetBookingsByUserIdAsync11) A
(11A B
[11B C

FromHeader11C M
]11M N
string11O U
authorizationToken11V h
)11h i
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
}88 
var99 
userId99 
=99 
	ExtractId99 "
.99" #
ExtractUserId99# 0
(990 1!
responseAuthorization991 F
.99F G
Content99G N
.99N O
ReadAsStringAsync99O `
(99` a
)99a b
.99b c
Result99c i
)99i j
;99j k
var:: 
bookings:: 
=:: 
await::  
_repository::! ,
.::, -$
GetBookingsByUserIdAsync::- E
(::E F
userId::F L
)::L M
;::M N
if;; 
(;; 
!;; 
bookings;; 
.;; 
Any;; 
(;; 
);; 
);;  
{<< 
return== 
NotFound== 
(==  
new==  #
Error==$ )
(==) *
$str==* A
)==A B
)==B C
;==C D
}>> 
return?? 
Ok?? 
(?? 
bookings?? 
)?? 
;??  
}@@ 	
[BB 	
HttpGetBB	 
(BB 
$strBB 
)BB 
]BB 
publicCC 
asyncCC 
TaskCC 
<CC 
IActionResultCC '
>CC' (
GetBookingByIdAsyncCC) <
(CC< =
intCC= @
idCCA C
,CCC D
[CCE F

FromHeaderCCF P
]CCP Q
stringCCR X
authorizationTokenCCY k
)CCk l
{DD 	
clientEE 
.EE !
DefaultRequestHeadersEE (
.EE( )
AddEE) ,
(EE, -
$strEE- A
,EEA B
authorizationTokenEEC U
)EEU V
;EEV W
varFF !
responseAuthorizationFF %
=FF& '
awaitFF( -
clientFF. 4
.FF4 5
GetAsyncFF5 =
(FF= >*
usersManagementMicroserviceUriFF> \
+FF] ^
$strFF_ n
)FFn o
;FFo p
ifGG 
(GG !
responseAuthorizationGG %
.GG% &

StatusCodeGG& 0
==GG1 3
SystemGG4 :
.GG: ;
NetGG; >
.GG> ?
HttpStatusCodeGG? M
.GGM N
UnauthorizedGGN Z
)GGZ [
{HH 
returnII 
UnauthorizedII #
(II# $!
responseAuthorizationII$ 9
.II9 :
ContentII: A
.IIA B
ReadAsStringAsyncIIB S
(IIS T
)IIT U
.IIU V
ResultIIV \
)II\ ]
;II] ^
}JJ 
varKK 
resultKK 
=KK 
awaitKK 
_repositoryKK *
.KK* +
GetBookingByIdAsyncKK+ >
(KK> ?
idKK? A
)KKA B
;KKB C
ifLL 
(LL 
resultLL 
==LL 
nullLL 
)LL 
{MM 
returnNN 
NotFoundNN 
(NN  
newNN  #
ErrorNN$ )
(NN) *
$"NN* ,
$strNN, <
{NN< =
idNN= ?
}NN? @
$strNN@ P
"NNP Q
)NNQ R
)NNR S
;NNS T
}OO 
returnPP 
OkPP 
(PP 
JsonConvertPP !
.PP! "
SerializeObjectPP" 1
(PP1 2
newPP2 5
{QQ 
IdRR 
=RR 
resultRR 
.RR 
IdRR 
,RR 

RoomNumberSS 
=SS 
resultSS #
.SS# $

RoomNumberSS$ .
,SS. /
CheckInTT 
=TT 
resultTT  
.TT  !
CheckInTT! (
,TT( )
CheckOutUU 
=UU 
resultUU !
.UU! "
CheckOutUU" *
,UU* +
TotalPayVV 
=VV 
resultVV !
.VV! "
TotalPayVV" *
,VV* +
StatusWW 
=WW 
resultWW 
.WW  
StatusWW  &
}XX 
)XX 
)XX 
;XX 
}YY 	
[ZZ 	
RouteZZ	 
(ZZ 
$strZZ 
)ZZ 
]ZZ 
[[[ 	
HttpGet[[	 
][[ 
public\\ 
async\\ 
Task\\ 
<\\ 
IActionResult\\ '
>\\' (%
SearchAvailableRoomsAsync\\) B
(\\B C
[\\C D
	FromQuery\\D M
]\\M N
RoomSearchDto\\O \
roomSearchDTO\\] j
)\\j k
{]] 	
if^^ 
(^^ 
!^^ 

Validation^^ 
.^^ 
CheckValidDates^^ +
(^^+ ,
roomSearchDTO^^, 9
.^^9 :
CheckIn^^: A
,^^A B
roomSearchDTO^^C P
.^^P Q
CheckOut^^Q Y
)^^Y Z
)^^Z [
{__ 
return`` 

BadRequest`` !
(``! "
new``" %
Error``& +
(``+ ,
$str``, O
)``O P
)``P Q
;``Q R
}aa 
varbb 
httpResultContentbb !
=bb" #
awaitbb$ )
clientbb* 0
.bb0 1
GetStringAsyncbb1 ?
(bb? @*
roomsManagementMicroserviceUribb@ ^
)bb^ _
;bb_ `
ifcc 
(cc 
httpResultContentcc  
!=cc  "
nullcc" &
)cc& '
{dd 
Listee 
<ee 
RoomDescriptionDtoee '
>ee' (
?ee( )
roomsee* /
=ee0 1
JsonConvertee2 =
.ee= >
DeserializeObjectee> O
<eeO P
ListeeP T
<eeT U
RoomDescriptionDtoeeU g
>eeg h
>eeh i
(eei j
httpResultContenteej {
)ee{ |
;ee| }
ifff 
(ff 
roomsff 
!=ff 
nullff 
)ff 
{gg 
varhh 
resulthh 
=hh  
_repositoryhh! ,
.hh, -%
SearchAvailableRoomsAsynchh- F
(hhF G
roomSearchDTOhhG T
,hhT U
roomshhV [
)hh[ \
;hh\ ]
ifii 
(ii 
resultii 
==ii !
nullii" &
)ii& '
{jj 
returnkk 
NotFoundkk '
(kk' (
newkk( +
Errorkk, 1
(kk1 2
$strkk2 F
)kkF G
)kkG H
;kkH I
}ll 
returnmm 
Okmm 
(mm 
JsonConvertmm )
.mm) *
SerializeObjectmm* 9
(mm9 :
newmm: =
{nn 
roomsoo 
=oo 
resultoo  &
.oo& '
Resultoo' -
}pp 
)pp 
)pp 
;pp 
}qq 
}ss 
returntt 
NotFoundtt 
(tt 
newtt 
Errortt  %
(tt% &
$strtt& 7
)tt7 8
)tt8 9
;tt9 :
}uu 	
[ww 	
HttpPostww	 
]ww 
publicxx 
asyncxx 
Taskxx 
<xx 
IActionResultxx '
>xx' (
AddBookingAsyncxx) 8
(xx8 9
[xx9 :
FromBodyxx: B
]xxB C
PostBookingDtoxxD R
postBookingxxS ^
,xx^ _
[xx` a

FromHeaderxxa k
]xxk l
stringxxm s
authorizationToken	xxt Ü
)
xxÜ á
{yy 	
clientzz 
.zz !
DefaultRequestHeaderszz (
.zz( )
Addzz) ,
(zz, -
$strzz- A
,zzA B
authorizationTokenzzC U
)zzU V
;zzV W
var{{ !
responseAuthorization{{ %
={{& '
await{{( -
client{{. 4
.{{4 5
GetAsync{{5 =
({{= >*
usersManagementMicroserviceUri{{> \
+{{] ^
$str{{_ n
){{n o
;{{o p
if|| 
(|| !
responseAuthorization|| %
.||% &

StatusCode||& 0
==||1 3
System||4 :
.||: ;
Net||; >
.||> ?
HttpStatusCode||? M
.||M N
Unauthorized||N Z
)||Z [
{}} 
return~~ 
Unauthorized~~ #
(~~# $!
responseAuthorization~~$ 9
.~~9 :
Content~~: A
.~~A B
ReadAsStringAsync~~B S
(~~S T
)~~T U
.~~U V
Result~~V \
)~~\ ]
;~~] ^
} 
var
ÄÄ 
userId
ÄÄ 
=
ÄÄ 
	ExtractId
ÄÄ "
.
ÄÄ" #
ExtractUserId
ÄÄ# 0
(
ÄÄ0 1#
responseAuthorization
ÄÄ1 F
.
ÄÄF G
Content
ÄÄG N
.
ÄÄN O
ReadAsStringAsync
ÄÄO `
(
ÄÄ` a
)
ÄÄa b
.
ÄÄb c
Result
ÄÄc i
)
ÄÄi j
;
ÄÄj k
var
ÅÅ  
responseRoomNumber
ÅÅ "
=
ÅÅ# $
await
ÅÅ% *
client
ÅÅ+ 1
.
ÅÅ1 2
GetAsync
ÅÅ2 :
(
ÅÅ: ;,
roomsManagementMicroserviceUri
ÅÅ; Y
+
ÅÅZ [
$"
ÅÅ\ ^
$str
ÅÅ^ _
{
ÅÅ_ `
postBooking
ÅÅ` k
.
ÅÅk l

RoomNumber
ÅÅl v
}
ÅÅv w
"
ÅÅw x
)
ÅÅx y
;
ÅÅy z
if
ÇÇ 
(
ÇÇ  
responseRoomNumber
ÇÇ !
.
ÇÇ! "

StatusCode
ÇÇ" ,
==
ÇÇ- /
System
ÇÇ0 6
.
ÇÇ6 7
Net
ÇÇ7 :
.
ÇÇ: ;
HttpStatusCode
ÇÇ; I
.
ÇÇI J
NotFound
ÇÇJ R
)
ÇÇR S
{
ÉÉ 
return
ÑÑ 

BadRequest
ÑÑ !
(
ÑÑ! "
new
ÑÑ" %
Error
ÑÑ& +
(
ÑÑ+ ,
$"
ÑÑ, .
$str
ÑÑ. D
{
ÑÑD E
postBooking
ÑÑE P
.
ÑÑP Q

RoomNumber
ÑÑQ [
}
ÑÑ[ \
$str
ÑÑ\ l
"
ÑÑl m
)
ÑÑm n
)
ÑÑn o
;
ÑÑo p
}
ÖÖ 
if
ÜÜ 
(
ÜÜ 
!
ÜÜ 

Validation
ÜÜ 
.
ÜÜ 
CheckValidDates
ÜÜ +
(
ÜÜ+ ,
postBooking
ÜÜ, 7
.
ÜÜ7 8
CheckIn
ÜÜ8 ?
,
ÜÜ? @
postBooking
ÜÜA L
.
ÜÜL M
CheckOut
ÜÜM U
)
ÜÜU V
)
ÜÜV W
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
àà, O
)
ààO P
)
ààP Q
;
ààQ R
}
ââ 
var
ää 
result
ää 
=
ää 
await
ää 
_repository
ää *
.
ää* +
AddBookingAsync
ää+ :
(
ää: ;
postBooking
ää; F
,
ääF G
userId
ääH N
)
ääN O
;
ääO P
if
ãã 
(
ãã 
result
ãã 
==
ãã 
-
ãã 
$num
ãã 
)
ãã 
{
åå 
return
çç 

BadRequest
çç !
(
çç! "
new
çç" %
Error
çç& +
(
çç+ ,
$str
çç, E
)
ççE F
)
ççF G
;
ççG H
}
éé 
if
èè 
(
èè 
result
èè 
==
èè 
-
èè 
$num
èè 
)
èè 
{
êê 
return
ëë 

BadRequest
ëë !
(
ëë! "
new
ëë" %
Error
ëë& +
(
ëë+ ,
$str
ëë, i
)
ëëi j
)
ëëj k
;
ëëk l
}
íí 
return
îî 
CreatedAtAction
îî "
(
îî" #
$str
îî# /
,
îî/ 0
postBooking
îî1 <
)
îî< =
;
îî= >
}
ïï 	
[
óó 	
	HttpPatch
óó	 
]
óó 
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
òò' ( 
UpdateBookingAsync
òò) ;
(
òò; <
[
òò< =
FromBody
òò= E
]
òòE F
PatchBookingDto
òòG V
patchBooking
òòW c
,
òòc d
[
òòe f

FromHeader
òòf p
]
òòp q
string
òòr x!
authorizationTokenòòy ã
)òòã å
{
ôô 	
client
öö 
.
öö #
DefaultRequestHeaders
öö (
.
öö( )
Add
öö) ,
(
öö, -
$str
öö- A
,
ööA B 
authorizationToken
ööC U
)
ööU V
;
ööV W
var
õõ #
responseAuthorization
õõ %
=
õõ& '
await
õõ( -
client
õõ. 4
.
õõ4 5
GetAsync
õõ5 =
(
õõ= >,
usersManagementMicroserviceUri
õõ> \
+
õõ] ^
$str
õõ_ n
)
õõn o
;
õõo p
if
úú 
(
úú #
responseAuthorization
úú %
.
úú% &

StatusCode
úú& 0
==
úú1 3
System
úú4 :
.
úú: ;
Net
úú; >
.
úú> ?
HttpStatusCode
úú? M
.
úúM N
Unauthorized
úúN Z
)
úúZ [
{
ùù 
return
ûû 
Unauthorized
ûû #
(
ûû# $#
responseAuthorization
ûû$ 9
.
ûû9 :
Content
ûû: A
.
ûûA B
ReadAsStringAsync
ûûB S
(
ûûS T
)
ûûT U
.
ûûU V
Result
ûûV \
)
ûû\ ]
;
ûû] ^
}
üü 
var
†† 
userId
†† 
=
†† 
	ExtractId
†† "
.
††" #
ExtractUserId
††# 0
(
††0 1#
responseAuthorization
††1 F
.
††F G
Content
††G N
.
††N O
ReadAsStringAsync
††O `
(
††` a
)
††a b
.
††b c
Result
††c i
)
††i j
;
††j k
var
°° 
result
°° 
=
°° 
await
°° 
_repository
°° *
.
°°* + 
UpdateBookingAsync
°°+ =
(
°°= >
patchBooking
°°> J
,
°°J K
userId
°°L R
)
°°R S
;
°°S T
if
¢¢ 
(
¢¢ 
!
¢¢ 

Validation
¢¢ 
.
¢¢ 
CheckValidDates
¢¢ +
(
¢¢+ ,
patchBooking
¢¢, 8
.
¢¢8 9
CheckIn
¢¢9 @
,
¢¢@ A
patchBooking
¢¢B N
.
¢¢N O
CheckOut
¢¢O W
)
¢¢W X
)
¢¢X Y
{
££ 
return
§§ 

BadRequest
§§ !
(
§§! "
new
§§" %
Error
§§& +
(
§§+ ,
$str
§§, O
)
§§O P
)
§§P Q
;
§§Q R
}
•• 
if
¶¶ 
(
¶¶ 
result
¶¶ 
==
¶¶ 
-
¶¶ 
$num
¶¶ 
)
¶¶ 
{
ßß 
return
®® 
NotFound
®® 
(
®®  
new
®®  #
Error
®®$ )
(
®®) *
$"
®®* ,
$str
®®, <
{
®®< =
patchBooking
®®= I
.
®®I J
Id
®®J L
}
®®L M
$str
®®M ]
"
®®] ^
)
®®^ _
)
®®_ `
;
®®` a
}
©© 
if
™™ 
(
™™ 
result
™™ 
==
™™ 
-
™™ 
$num
™™ 
)
™™ 
{
´´ 
return
¨¨ 

BadRequest
¨¨ !
(
¨¨! "
new
¨¨" %
Error
¨¨& +
(
¨¨+ ,
$str
¨¨, i
)
¨¨i j
)
¨¨j k
;
¨¨k l
}
≠≠ 
return
ÆÆ 
	NoContent
ÆÆ 
(
ÆÆ 
)
ÆÆ 
;
ÆÆ 
}
ØØ 	
[
±± 	
Route
±±	 
(
±± 
$str
±± 
)
±± 
]
±± 
[
≤≤ 	
HttpGet
≤≤	 
]
≤≤ 
public
≥≥ 
async
≥≥ 
Task
≥≥ 
<
≥≥ 
IActionResult
≥≥ '
>
≥≥' (#
CheckRoomAvailability
≥≥) >
(
≥≥> ?
int
≥≥? B

roomNumber
≥≥C M
,
≥≥M N
DateTime
≥≥O W
checkIn
≥≥X _
,
≥≥_ `
DateTime
≥≥a i
checkOut
≥≥j r
)
≥≥r s
{
¥¥ 	
var
µµ  
responseRoomNumber
µµ "
=
µµ# $
await
µµ% *
client
µµ+ 1
.
µµ1 2
GetAsync
µµ2 :
(
µµ: ;,
roomsManagementMicroserviceUri
µµ; Y
+
µµZ [
$"
µµ\ ^
$str
µµ^ _
{
µµ_ `

roomNumber
µµ` j
}
µµj k
"
µµk l
)
µµl m
;
µµm n
if
∂∂ 
(
∂∂  
responseRoomNumber
∂∂ "
.
∂∂" #

StatusCode
∂∂# -
==
∂∂. 0
System
∂∂1 7
.
∂∂7 8
Net
∂∂8 ;
.
∂∂; <
HttpStatusCode
∂∂< J
.
∂∂J K
NotFound
∂∂K S
)
∂∂S T
{
∑∑ 
return
∏∏ 

BadRequest
∏∏ !
(
∏∏! "
new
∏∏" %
Error
∏∏& +
(
∏∏+ ,
$"
∏∏, .
$str
∏∏. D
{
∏∏D E

roomNumber
∏∏E O
}
∏∏O P
$str
∏∏P `
"
∏∏` a
)
∏∏a b
)
∏∏b c
;
∏∏c d
}
ππ 
if
∫∫ 
(
∫∫ 
!
∫∫ 

Validation
∫∫ 
.
∫∫ 
CheckValidDates
∫∫ +
(
∫∫+ ,
checkIn
∫∫, 3
,
∫∫3 4
checkOut
∫∫5 =
)
∫∫= >
)
∫∫> ?
{
ªª 
return
ºº 

BadRequest
ºº !
(
ºº! "
new
ºº" %
Error
ºº& +
(
ºº+ ,
$str
ºº, O
)
ººO P
)
ººP Q
;
ººQ R
}
ΩΩ 
var
ææ 
isAvailable
ææ 
=
ææ 
await
ææ #
_repository
ææ$ /
.
ææ/ 0(
CheckRoomAvailabilityAsync
ææ0 J
(
ææJ K

roomNumber
ææK U
,
ææU V
checkIn
ææW ^
,
ææ^ _
checkOut
ææ` h
)
ææh i
;
ææi j
return
øø 
Ok
øø 
(
øø 
JsonConvert
øø !
.
øø! "
SerializeObject
øø" 1
(
øø1 2
new
øø2 5
{
¿¿ 
	available
¡¡ 
=
¡¡ 
isAvailable
¡¡ '
}
¬¬ 
)
¬¬ 
)
¬¬ 
;
¬¬ 
}
√√ 	
}
∆∆ 
}«« ¡v
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
CheckInWW? F
==WWG I
patchBookingWWJ V
.WWV W
CheckInWWW ^
||WW_ a
bookingWWb i
.WWi j
CheckOutWWj r
==WWs u
patchBooking	WWv Ç
.
WWÇ É
CheckOut
WWÉ ã
)
WWã å
||
WWç è
(XX6 7
bookingXX7 >
.XX> ?
CheckInXX? F
<XXG H
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
XXâ ä
)
XXä ã
)
XXã å
;
XXå ç
ifYY 
(YY 
isUpdateNotPossibleYY #
)YY# $
{ZZ 
return[[ 
-[[ 
$num[[ 
;[[ 
}\\ 
result]] 
.]] 
CheckIn]] 
=]] 
patchBooking]] )
.]]) *
CheckIn]]* 1
;]]1 2
result^^ 
.^^ 
CheckOut^^ 
=^^ 
patchBooking^^ *
.^^* +
CheckOut^^+ 3
;^^3 4
result__ 
.__ 
Status__ 
=__ 
$str__ %
;__% &
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
RoomDescriptionDtoff& 8
>ff8 9
>ff9 :%
SearchAvailableRoomsAsyncff; T
(ffT U
RoomSearchDtoffU b
roomSearchDTOffc p
,ffp q
Listffr v
<ffv w
RoomDescriptionDto	ffw â
>
ffâ ä
rooms
ffã ê
)
ffê ë
{gg 	
Listhh 
<hh 
RoomDescriptionDtohh #
>hh# $
returnValuehh% 0
=hh1 2
newhh3 6
Listhh7 ;
<hh; <
RoomDescriptionDtohh< N
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
PersonsNumberkk7 D
||kkE G
roomkkH L
.kkL M
RoomCategorykkM Y
!=kkZ \
roomSearchDTOkk] j
.kkj k
RoomCategorykkk w
)kkw x
{ll 
continuemm 
;mm 
}nn 
varoo 
isAvailableoo 
=oo  !
awaitoo" '&
CheckRoomAvailabilityAsyncoo( B
(ooB C
roomooC G
.ooG H

RoomNumberooH R
,ooR S
roomSearchDTOooT a
.ooa b
CheckInoob i
,ooi j
roomSearchDTOook x
.oox y
CheckOut	ooy Å
)
ooÅ Ç
;
ooÇ É
ifpp 
(pp 
!pp 
isAvailablepp  
)pp  !
{qq 
continuerr 
;rr 
}ss 
returnValuett 
.tt 
Addtt 
(tt  
roomtt  $
)tt$ %
;tt% &
}uu 
returnvv 
returnValuevv 
;vv 
}ww 	
publicyy 
asyncyy 
Taskyy 
<yy 
boolyy 
>yy &
CheckRoomAvailabilityAsyncyy  :
(yy: ;
intyy; >

roomNumberyy? I
,yyI J
DateTimeyyK S
?yyS T
checkInyyU \
,yy\ ]
DateTimeyy^ f
?yyf g
checkOutyyh p
)yyp q
{zz 	
var{{ 

isReserved{{ 
={{ 
await{{ "
_context{{# +
.{{+ ,
Bookings{{, 4
.{{4 5
AnyAsync{{5 =
({{= >
booking{{> E
=>{{F H
booking{{I P
.{{P Q

RoomNumber{{Q [
=={{\ ^

roomNumber{{_ i
&&{{j l
(||5 6
(||6 7
booking||7 >
.||> ?
CheckIn||? F
>||G H
checkIn||I P
&&||Q S
booking||T [
.||[ \
CheckOut||\ d
<||e f
checkOut||g o
)||o p
||||q s
(}}6 7
booking}}7 >
.}}> ?
CheckIn}}? F
<}}G H
checkIn}}I P
&&}}Q S
checkIn}}T [
<}}\ ]
booking}}^ e
.}}e f
CheckOut}}f n
&&}}o q
checkOut}}r z
>}}{ |
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
>~~G H
checkIn~~I P
&&~~Q S
booking~~T [
.~~[ \
CheckIn~~\ c
<~~d e
checkOut~~f n
&&~~o q
checkOut~~r z
<~~{ |
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
CheckIn? F
==G I
checkInJ Q
||R T
bookingU \
.\ ]
CheckOut] e
==f h
checkOuti q
)q r
||s u
(
ÄÄ6 7
booking
ÄÄ7 >
.
ÄÄ> ?
CheckIn
ÄÄ? F
<
ÄÄG H
checkIn
ÄÄI P
&&
ÄÄQ S
booking
ÄÄT [
.
ÄÄ[ \
CheckOut
ÄÄ\ d
>
ÄÄe f
checkOut
ÄÄg o
)
ÄÄo p
)
ÄÄp q
)
ÄÄq r
;
ÄÄr s
return
ÅÅ 
!
ÅÅ 

isReserved
ÅÅ 
;
ÅÅ 
}
ÇÇ 	
}
ÉÉ 
}ÑÑ ≠

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
} ¯
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