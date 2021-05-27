��
zC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Controllers\BookingsController.cs
	namespace 	
BookingMicroservice
 
. 
Controllers )
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
BookingsController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
IBookingsRepository ,
_repository- 8
;8 9
private 
readonly 

HttpClient #
client$ *
;* +
private 
readonly 
string *
usersManagementMicroserviceUri  >
=? @
$strA g
;g h
private 
readonly 
string *
roomsManagementMicroserviceUri  >
=? @
$strA f
;f g
public 
BookingsController !
(! "
IBookingsRepository" 5

repository6 @
)@ A
{ 	
_repository 
= 

repository $
;$ %
client 
= 
new 

HttpClient #
(# $
)$ %
;% &
} 	
[ 	
Route	 
( 
$str 
) 
] 
[   	
HttpGet  	 
]   
public!! 
async!! 
Task!! 
<!! 
IActionResult!! '
>!!' (
GetBookings!!) 4
(!!4 5
[!!5 6

FromHeader!!6 @
]!!@ A
string!!B H
authorizationToken!!I [
)!![ \
{"" 	
client## 
.## !
DefaultRequestHeaders## (
.##( )
Add##) ,
(##, -
$str##- A
,##A B
authorizationToken##C U
)##U V
;##V W
var$$ !
responseAuthorization$$ %
=$$& '
await$$( -
client$$. 4
.$$4 5
GetAsync$$5 =
($$= >*
usersManagementMicroserviceUri$$> \
+$$] ^
$str$$_ n
)$$n o
;$$o p
if%% 
(%% !
responseAuthorization%% %
.%%% &

StatusCode%%& 0
==%%1 3
System%%4 :
.%%: ;
Net%%; >
.%%> ?
HttpStatusCode%%? M
.%%M N
Unauthorized%%N Z
)%%Z [
{&& 
return'' 
Unauthorized'' #
(''# $!
responseAuthorization''$ 9
.''9 :
Content'': A
.''A B
ReadAsStringAsync''B S
(''S T
)''T U
.''U V
Result''V \
)''\ ]
;''] ^
}(( 
var)) #
responseAdminPrivileges)) '
=))( )
await))* /
client))0 6
.))6 7
GetAsync))7 ?
())? @*
usersManagementMicroserviceUri))@ ^
+))_ `
$str))a r
+))s t
$str))u }
+))~ #
responseAuthorization
))� �
.
))� �
Content
))� �
.
))� �
ReadAsStringAsync
))� �
(
))� �
)
))� �
.
))� �
Result
))� �
)
))� �
;
))� �
if** 
(** #
responseAdminPrivileges** '
.**' (

StatusCode**( 2
==**3 5
System**6 <
.**< =
Net**= @
.**@ A
HttpStatusCode**A O
.**O P
Unauthorized**P \
)**\ ]
{++ 
return,, 
Unauthorized,, #
(,,# $#
responseAdminPrivileges,,$ ;
.,,; <
Content,,< C
.,,C D
ReadAsStringAsync,,D U
(,,U V
),,V W
.,,W X
Result,,X ^
),,^ _
;,,_ `
}-- 
var.. 
bookings.. 
=.. 
await..  
_repository..! ,
..., -
GetBookingsAsync..- =
(..= >
)..> ?
;..? @
return// 
Ok// 
(// 
bookings// 
)// 
;//  
}00 	
[33 	
HttpGet33	 
]33 
public44 
async44 
Task44 
<44 
IActionResult44 '
>44' ($
GetBookingsByUserIdAsync44) A
(44A B
[44B C

FromHeader44C M
]44M N
string44O U
authorizationToken44V h
)44h i
{55 	
client66 
.66 !
DefaultRequestHeaders66 (
.66( )
Add66) ,
(66, -
$str66- A
,66A B
authorizationToken66C U
)66U V
;66V W
var77 !
responseAuthorization77 %
=77& '
await77( -
client77. 4
.774 5
GetAsync775 =
(77= >*
usersManagementMicroserviceUri77> \
+77] ^
$str77_ n
)77n o
;77o p
if88 
(88 !
responseAuthorization88 %
.88% &

StatusCode88& 0
==881 3
System884 :
.88: ;
Net88; >
.88> ?
HttpStatusCode88? M
.88M N
Unauthorized88N Z
)88Z [
{99 
return:: 
Unauthorized:: #
(::# $!
responseAuthorization::$ 9
.::9 :
Content::: A
.::A B
ReadAsStringAsync::B S
(::S T
)::T U
.::U V
Result::V \
)::\ ]
;::] ^
};; 
var<< 
userId<< 
=<< 
Extract<<  
.<<  !
ExtractUserId<<! .
(<<. /!
responseAuthorization<</ D
.<<D E
Content<<E L
.<<L M
ReadAsStringAsync<<M ^
(<<^ _
)<<_ `
.<<` a
Result<<a g
)<<g h
;<<h i
var== 
bookings== 
=== 
await==  
_repository==! ,
.==, -$
GetBookingsByUserIdAsync==- E
(==E F
userId==F L
)==L M
;==M N
return>> 
Ok>> 
(>> 
bookings>> 
)>> 
;>>  
}?? 	
[AA 	
HttpGetAA	 
(AA 
$strAA 
)AA 
]AA 
publicBB 
asyncBB 
TaskBB 
<BB 
IActionResultBB '
>BB' (
GetBookingByIdAsyncBB) <
(BB< =
intBB= @
idBBA C
,BBC D
[BBE F

FromHeaderBBF P
]BBP Q
stringBBR X
authorizationTokenBBY k
)BBk l
{CC 	
clientDD 
.DD !
DefaultRequestHeadersDD (
.DD( )
AddDD) ,
(DD, -
$strDD- A
,DDA B
authorizationTokenDDC U
)DDU V
;DDV W
varEE !
responseAuthorizationEE %
=EE& '
awaitEE( -
clientEE. 4
.EE4 5
GetAsyncEE5 =
(EE= >*
usersManagementMicroserviceUriEE> \
+EE] ^
$strEE_ n
)EEn o
;EEo p
ifFF 
(FF !
responseAuthorizationFF %
.FF% &

StatusCodeFF& 0
==FF1 3
SystemFF4 :
.FF: ;
NetFF; >
.FF> ?
HttpStatusCodeFF? M
.FFM N
UnauthorizedFFN Z
)FFZ [
{GG 
returnHH 
UnauthorizedHH #
(HH# $!
responseAuthorizationHH$ 9
.HH9 :
ContentHH: A
.HHA B
ReadAsStringAsyncHHB S
(HHS T
)HHT U
.HHU V
ResultHHV \
)HH\ ]
;HH] ^
}II 
varJJ 
resultJJ 
=JJ 
awaitJJ 
_repositoryJJ *
.JJ* +
GetBookingByIdAsyncJJ+ >
(JJ> ?
idJJ? A
)JJA B
;JJB C
ifKK 
(KK 
resultKK 
==KK 
nullKK 
)KK 
{LL 
returnMM 
NotFoundMM 
(MM  
newMM  #
ErrorMM$ )
(MM) *
$"MM* ,
$strMM, <
{MM< =
idMM= ?
}MM? @
$strMM@ P
"MMP Q
)MMQ R
)MMR S
;MMS T
}NN 
returnOO 
OkOO 
(OO 
JsonConvertOO !
.OO! "
SerializeObjectOO" 1
(OO1 2
newOO2 5
{PP 
IdQQ 
=QQ 
resultQQ 
.QQ 
IdQQ 
,QQ 

RoomNumberRR 
=RR 
resultRR #
.RR# $

RoomNumberRR$ .
,RR. /
CheckInSS 
=SS 
resultSS  
.SS  !
CheckInSS! (
,SS( )
CheckOutTT 
=TT 
resultTT !
.TT! "
CheckOutTT" *
,TT* +
TotalPayUU 
=UU 
resultUU !
.UU! "
TotalPayUU" *
,UU* +
StatusVV 
=VV 
resultVV 
.VV  
StatusVV  &
}WW 
)WW 
)WW 
;WW 
}XX 	
[YY 	
RouteYY	 
(YY 
$strYY 
)YY 
]YY 
[ZZ 	
HttpGetZZ	 
]ZZ 
public[[ 
async[[ 
Task[[ 
<[[ 
IActionResult[[ '
>[[' (%
SearchAvailableRoomsAsync[[) B
([[B C
[[[C D
	FromQuery[[D M
][[M N
RoomSearchDto[[O \
roomSearchDTO[[] j
)[[j k
{\\ 	
if]] 
(]] 
!]] 

Validation]] 
.]] 
CheckValidDates]] +
(]]+ ,
roomSearchDTO]], 9
.]]9 :
CheckIn]]: A
,]]A B
roomSearchDTO]]C P
.]]P Q
CheckOut]]Q Y
)]]Y Z
)]]Z [
{^^ 
return__ 

BadRequest__ !
(__! "
new__" %
Error__& +
(__+ ,
$str__, O
)__O P
)__P Q
;__Q R
}`` 
varaa 
httpResultContentaa !
=aa" #
awaitaa$ )
clientaa* 0
.aa0 1
GetStringAsyncaa1 ?
(aa? @*
roomsManagementMicroserviceUriaa@ ^
)aa^ _
;aa_ `
ifbb 
(bb 
httpResultContentbb !
!=bb" $
nullbb% )
)bb) *
{cc 
Listdd 
<dd 
RoomDescriptionDtodd '
>dd' (
?dd( )
roomsdd* /
=dd0 1
JsonConvertdd2 =
.dd= >
DeserializeObjectdd> O
<ddO P
ListddP T
<ddT U
RoomDescriptionDtoddU g
>ddg h
>ddh i
(ddi j
httpResultContentddj {
)dd{ |
;dd| }
ifee 
(ee 
roomsee 
!=ee 
nullee !
)ee! "
{ff 
vargg 
resultgg 
=gg  
_repositorygg! ,
.gg, -%
SearchAvailableRoomsAsyncgg- F
(ggF G
roomSearchDTOggG T
,ggT U
roomsggV [
)gg[ \
;gg\ ]
ifhh 
(hh 
resulthh 
==hh !
nullhh" &
)hh& '
{ii 
returnjj 
NotFoundjj '
(jj' (
newjj( +
Errorjj, 1
(jj1 2
$strjj2 F
)jjF G
)jjG H
;jjH I
}kk 
returnll 
Okll 
(ll 
JsonConvertll )
.ll) *
SerializeObjectll* 9
(ll9 :
newll: =
{mm 
roomsnn 
=nn 
resultnn  &
.nn& '
Resultnn' -
}oo 
)oo 
)oo 
;oo 
}pp 
}rr 
returnss 
NotFoundss 
(ss 
newss 
Errorss  %
(ss% &
$strss& 7
)ss7 8
)ss8 9
;ss9 :
}tt 	
[vv 	
HttpPostvv	 
]vv 
publicww 
asyncww 
Taskww 
<ww 
IActionResultww '
>ww' (
AddBookingAsyncww) 8
(ww8 9
[ww9 :
FromBodyww: B
]wwB C
PostBookingDtowwD R
postBookingwwS ^
,ww^ _
[ww` a

FromHeaderwwa k
]wwk l
stringwwm s
authorizationToken	wwt �
)
ww� �
{xx 	
clientyy 
.yy !
DefaultRequestHeadersyy (
.yy( )
Addyy) ,
(yy, -
$stryy- A
,yyA B
authorizationTokenyyC U
)yyU V
;yyV W
varzz !
responseAuthorizationzz %
=zz& '
awaitzz( -
clientzz. 4
.zz4 5
GetAsynczz5 =
(zz= >*
usersManagementMicroserviceUrizz> \
+zz] ^
$strzz_ n
)zzn o
;zzo p
if{{ 
({{ !
responseAuthorization{{ %
.{{% &

StatusCode{{& 0
=={{1 3
System{{4 :
.{{: ;
Net{{; >
.{{> ?
HttpStatusCode{{? M
.{{M N
Unauthorized{{N Z
){{Z [
{|| 
return}} 
Unauthorized}} #
(}}# $!
responseAuthorization}}$ 9
.}}9 :
Content}}: A
.}}A B
ReadAsStringAsync}}B S
(}}S T
)}}T U
.}}U V
Result}}V \
)}}\ ]
;}}] ^
}~~ 
var 
userId 
= 
Extract  
.  !
ExtractUserId! .
(. /!
responseAuthorization/ D
.D E
ContentE L
.L M
ReadAsStringAsyncM ^
(^ _
)_ `
.` a
Resulta g
)g h
;h i
var
��  
responseRoomNumber
�� "
=
��# $
await
��% *
client
��+ 1
.
��1 2
GetAsync
��2 :
(
��: ;,
roomsManagementMicroserviceUri
��; Y
+
��Z [
$"
��\ ^
$str
��^ _
{
��_ `
postBooking
��` k
.
��k l

RoomNumber
��l v
}
��v w
"
��w x
)
��x y
;
��y z
int
�� 
price
�� 
;
�� 
if
�� 
(
��  
responseRoomNumber
�� "
.
��" #

StatusCode
��# -
==
��. 0
System
��1 7
.
��7 8
Net
��8 ;
.
��; <
HttpStatusCode
��< J
.
��J K
NotFound
��K S
)
��S T
{
�� 
return
�� 

BadRequest
�� !
(
��! "
new
��" %
Error
��& +
(
��+ ,
$"
��, .
$str
��. D
{
��D E
postBooking
��E P
.
��P Q

RoomNumber
��Q [
}
��[ \
$str
��\ l
"
��l m
)
��m n
)
��n o
;
��o p
}
�� 
Console
�� 
.
�� 
	WriteLine
�� 
(
��  
responseRoomNumber
�� 0
.
��0 1
Content
��1 8
.
��8 9
ReadAsStringAsync
��9 J
(
��J K
)
��K L
.
��L M
Result
��M S
)
��S T
;
��T U
price
�� 
=
�� 
Extract
�� 
.
�� 
ExtractPrice
�� (
(
��( ) 
responseRoomNumber
��) ;
.
��; <
Content
��< C
.
��C D
ReadAsStringAsync
��D U
(
��U V
)
��V W
.
��W X
Result
��X ^
)
��^ _
;
��_ `
if
�� 
(
�� 
!
�� 

Validation
�� 
.
�� 
CheckValidDates
�� +
(
��+ ,
postBooking
��, 7
.
��7 8
CheckIn
��8 ?
,
��? @
postBooking
��A L
.
��L M
CheckOut
��M U
)
��U V
)
��V W
{
�� 
return
�� 

BadRequest
�� !
(
��! "
new
��" %
Error
��& +
(
��+ ,
$str
��, O
)
��O P
)
��P Q
;
��Q R
}
�� !
StripeConfiguration
�� 
.
��  
ApiKey
��  &
=
��' (
$str��) �
;��� �
var
�� 
service
�� 
=
�� 
new
�� 
SessionService
�� ,
(
��, -
)
��- .
;
��. /
service
�� 
.
�� 
Get
�� 
(
�� 
postBooking
�� 
.
�� 
	SessionId
�� #
)
�� 
;
�� 
var
�� 
payment
�� 
=
�� 
service
�� !
.
��! "
Get
��" %
(
��% &
postBooking
�� 
.
�� 
	SessionId
�� #
)
�� 
;
�� 
Console
�� 
.
�� 
	WriteLine
�� 
(
�� 
payment
�� %
)
��% &
;
��& '
if
�� 
(
�� 
payment
�� 
.
�� 
PaymentStatus
�� $
==
��$ &
$str
��& .
)
��. /
{
�� 
return
�� 

BadRequest
�� !
(
��! "
new
��" %
Error
��& +
(
��+ ,
$str
��, H
)
��H I
)
��I J
;
��J K
}
�� 
var
�� 
result
�� 
=
�� 
await
�� 
_repository
�� *
.
��* +
AddBookingAsync
��+ :
(
��: ;
postBooking
��; F
,
��F G
userId
��H N
,
��N O
price
��P U
)
��U V
;
��V W
if
�� 
(
�� 
result
�� 
==
�� 
-
�� 
$num
�� 
)
�� 
{
�� 
return
�� 

BadRequest
�� !
(
��! "
new
��" %
Error
��& +
(
��+ ,
$str
��, E
)
��E F
)
��F G
;
��G H
}
�� 
if
�� 
(
�� 
result
�� 
==
�� 
-
�� 
$num
�� 
)
�� 
{
�� 
return
�� 

BadRequest
�� !
(
��! "
new
��" %
Error
��& +
(
��+ ,
$str
��, i
)
��i j
)
��j k
;
��k l
}
�� 
return
�� 
CreatedAtAction
�� "
(
��" #
$str
��# /
,
��/ 0
postBooking
��1 <
)
��< =
;
��= >
}
�� 	
[
�� 	
	HttpPatch
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' ( 
UpdateBookingAsync
��) ;
(
��; <
[
��< =
FromBody
��= E
]
��E F
PatchBookingDto
��G V
patchBooking
��W c
,
��c d
[
��e f

FromHeader
��f p
]
��p q
string
��r x!
authorizationToken��y �
)��� �
{
�� 	
client
�� 
.
�� #
DefaultRequestHeaders
�� (
.
��( )
Add
��) ,
(
��, -
$str
��- A
,
��A B 
authorizationToken
��C U
)
��U V
;
��V W
var
�� #
responseAuthorization
�� %
=
��& '
await
��( -
client
��. 4
.
��4 5
GetAsync
��5 =
(
��= >,
usersManagementMicroserviceUri
��> \
+
��] ^
$str
��_ n
)
��n o
;
��o p
if
�� 
(
�� #
responseAuthorization
�� %
.
��% &

StatusCode
��& 0
==
��1 3
System
��4 :
.
��: ;
Net
��; >
.
��> ?
HttpStatusCode
��? M
.
��M N
Unauthorized
��N Z
)
��Z [
{
�� 
return
�� 
Unauthorized
�� #
(
��# $#
responseAuthorization
��$ 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
)
��\ ]
;
��] ^
}
�� 
var
�� 
userId
�� 
=
�� 
Extract
��  
.
��  !
ExtractUserId
��! .
(
��. /#
responseAuthorization
��/ D
.
��D E
Content
��E L
.
��L M
ReadAsStringAsync
��M ^
(
��^ _
)
��_ `
.
��` a
Result
��a g
)
��g h
;
��h i
var
�� 
result
�� 
=
�� 
await
�� 
_repository
�� *
.
��* + 
UpdateBookingAsync
��+ =
(
��= >
patchBooking
��> J
,
��J K
userId
��L R
)
��R S
;
��S T
if
�� 
(
�� 
!
�� 

Validation
�� 
.
�� 
CheckValidDates
�� +
(
��+ ,
patchBooking
��, 8
.
��8 9
CheckIn
��9 @
,
��@ A
patchBooking
��B N
.
��N O
CheckOut
��O W
)
��W X
)
��X Y
{
�� 
return
�� 

BadRequest
�� !
(
��! "
new
��" %
Error
��& +
(
��+ ,
$str
��, O
)
��O P
)
��P Q
;
��Q R
}
�� 
if
�� 
(
�� 
result
�� 
==
�� 
-
�� 
$num
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
new
��  #
Error
��$ )
(
��) *
$"
��* ,
$str
��, <
{
��< =
patchBooking
��= I
.
��I J
Id
��J L
}
��L M
$str
��M ]
"
��] ^
)
��^ _
)
��_ `
;
��` a
}
�� 
if
�� 
(
�� 
result
�� 
==
�� 
-
�� 
$num
�� 
)
�� 
{
�� 
return
�� 

BadRequest
�� !
(
��! "
new
��" %
Error
��& +
(
��+ ,
$str
��, i
)
��i j
)
��j k
;
��k l
}
�� 
return
�� 
	NoContent
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
Route
��	 
(
�� 
$str
�� 
)
�� 
]
�� 
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (#
CheckRoomAvailability
��) >
(
��> ?
int
��? B

roomNumber
��C M
,
��M N
DateTime
��O W
checkIn
��X _
,
��_ `
DateTime
��a i
checkOut
��j r
)
��r s
{
�� 	
var
��  
responseRoomNumber
�� "
=
��# $
await
��% *
client
��+ 1
.
��1 2
GetAsync
��2 :
(
��: ;,
roomsManagementMicroserviceUri
��; Y
+
��Z [
$"
��\ ^
$str
��^ _
{
��_ `

roomNumber
��` j
}
��j k
"
��k l
)
��l m
;
��m n
if
�� 
(
��  
responseRoomNumber
�� "
.
��" #

StatusCode
��# -
==
��. 0
System
��1 7
.
��7 8
Net
��8 ;
.
��; <
HttpStatusCode
��< J
.
��J K
NotFound
��K S
)
��S T
{
�� 
return
�� 

BadRequest
�� !
(
��! "
new
��" %
Error
��& +
(
��+ ,
$"
��, .
$str
��. D
{
��D E

roomNumber
��E O
}
��O P
$str
��P `
"
��` a
)
��a b
)
��b c
;
��c d
}
�� 
if
�� 
(
�� 
!
�� 

Validation
�� 
.
�� 
CheckValidDates
�� +
(
��+ ,
checkIn
��, 3
,
��3 4
checkOut
��5 =
)
��= >
)
��> ?
{
�� 
return
�� 

BadRequest
�� !
(
��! "
new
��" %
Error
��& +
(
��+ ,
$str
��, O
)
��O P
)
��P Q
;
��Q R
}
�� 
var
�� 
isAvailable
�� 
=
�� 
await
�� #
_repository
��$ /
.
��/ 0(
CheckRoomAvailabilityAsync
��0 J
(
��J K

roomNumber
��K U
,
��U V
checkIn
��W ^
,
��^ _
checkOut
��` h
)
��h i
;
��i j
return
�� 
Ok
�� 
(
�� 
JsonConvert
�� !
.
��! "
SerializeObject
��" 1
(
��1 2
new
��2 5
{
�� 
	available
�� 
=
�� 
isAvailable
�� '
}
�� 
)
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpGet
��	 
(
�� 
$str
�� 
)
�� 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (*
GetBookingDatesRoomSpecified
��) E
(
��E F
int
��F I

roomNumber
��J T
)
��T U
{
�� 	
var
�� 
dates
�� 
=
�� 
await
�� 
_repository
�� )
.
��) */
!GetCheckInCheckOutForSpecificRoom
��* K
(
��K L

roomNumber
��L V
)
��V W
;
��W X
if
�� 
(
�� 
dates
�� 
.
�� 
Count
�� 
==
�� 
$num
�� 
)
�� 
{
�� 
return
�� 
Ok
�� 
(
�� 
dates
�� 
)
��  
;
��  !
}
�� 
return
�� 
Ok
�� 
(
�� 
JsonConvert
�� !
.
��! "
SerializeObject
��" 1
(
��1 2
new
��2 5
{
�� 
dates
�� 
=
�� 
dates
�� 
[
��  
$num
��  !
]
��! "
,
��" #
Status
�� 
=
�� 
dates
��  
[
��  !
$num
��! "
]
��" #
}
�� 
)
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
}�� ��
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
CheckIn	11} �
==
11� �
postBooking
11� �
.
11� �
CheckIn
11� �
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
userId	22{ �
)
22� �
;
22� �
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
CheckOut	88} �
)
88� �
;
88� �
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
FirstOrDefaultAsync	NN} �
(
NN� �
)
NN� �
;
NN� �
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

RoomNumber	TT{ �
==
TT� �

roomNumber
TT� �
&&
TT� �
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
patchBooking	UUt �
.
UU� �
CheckOut
UU� �
)
UU� �
||
UU� �
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
.	VV �
CheckOut
VV� �
&&
VV� �
patchBooking
VV� �
.
VV� �
CheckOut
VV� �
>
VV� �
booking
VV� �
.
VV� �
CheckOut
VV� �
)
VV� �
||
VV� �
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
.	WW �
CheckOut
WW� �
&&
WW� �
patchBooking
WW� �
.
WW� �
CheckOut
WW� �
<
WW� �
booking
WW� �
.
WW� �
CheckOut
WW� �
)
WW� �
||
WW� �
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
patchBooking	XXv �
.
XX� �
CheckOut
XX� �
)
XX� �
||
XX� �
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
patchBooking	YYt �
.
YY� �
CheckOut
YY� �
)
YY� �
)
YY� �
)
YY� �
;
YY� �
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
RoomDescriptionDto	ggw �
>
gg� �
rooms
gg� �
)
gg� �
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
CheckOut	ppy �
)
pp� �
;
pp� �
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
booking	~~} �
.
~~� �
CheckOut
~~� �
)
~~� �
||
~~� �
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
booking	} �
.
� �
CheckOut
� �
)
� �
||
� �
(
��6 7
booking
��7 >
.
��> ?
CheckIn
��? F
==
��G I
checkIn
��J Q
||
��R T
booking
��U \
.
��\ ]
CheckOut
��] e
==
��f h
checkOut
��i q
)
��q r
||
��s u
(
��6 7
booking
��7 >
.
��> ?
CheckIn
��? F
<
��G H
checkIn
��I P
&&
��Q S
booking
��T [
.
��[ \
CheckOut
��\ d
>
��e f
checkOut
��g o
)
��o p
)
��p q
)
��q r
;
��r s
return
�� 
!
�� 

isReserved
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
object
�� %
>
��% &
>
��& '/
!GetCheckInCheckOutForSpecificRoom
��( I
(
��I J
int
��J M

roomNumber
��N X
)
��X Y
{
�� 	
var
�� 
dates
�� 
=
�� 
await
�� 
_context
�� &
.
��& '
Bookings
��' /
.
��/ 0
Where
��0 5
(
��5 6
booking
��6 =
=>
��> @
booking
��A H
.
��H I

RoomNumber
��I S
==
��T V

roomNumber
��W a
&&
��b d
booking
��e l
.
��l m
CheckOut
��m u
>=
��u w
DateTime
��w 
.�� �
Now��� �
)��� �
.��� �
Select��� �
(��� �
booking��� �
=>��� �
new
�� 
DateInterval
�� 
(
��  
)
��  !
{
�� 
CheckIn
�� 
=
�� 
booking
�� $
.
��$ %
CheckIn
��% ,
,
��, -
CheckOut
�� 
=
�� 
booking
�� %
.
��% &
CheckOut
��& .
}
�� 
)
�� 
.
�� 
OrderBy
�� 
(
�� 
date
�� 
=>
�� !
date
��" &
.
��& '
CheckIn
��' .
)
��. /
.
��/ 0
ToListAsync
��0 ;
(
��; <
)
��< =
;
��= >
if
�� 
(
�� 
dates
�� 
.
�� 
Count
�� 
==
�� 
$num
�� 
)
��  
{
�� 
return
�� 
dates
�� 
.
�� 
Cast
�� !
<
��! "
object
��" (
>
��( )
(
��) *
)
��* +
.
��+ ,
ToList
��, 2
(
��2 3
)
��3 4
;
��4 5
}
�� 
var
�� 
items
�� 
=
�� 
new
�� 
List
��  
<
��  !
object
��! '
>
��' (
(
��( )
)
��) *
;
��* +
items
�� 
.
�� 
Add
�� 
(
�� 
dates
�� 
)
�� 
;
�� 
if
�� 
(
�� 
DateTime
�� 
.
�� 
Now
�� 
>=
�� 
dates
�� "
[
��" #
$num
��# $
]
��$ %
.
��% &
CheckIn
��& -
)
��- .
{
�� 
items
�� 
.
�� 
Add
�� 
(
�� 
$str
�� "
)
��" #
;
��# $
}
�� 
else
�� 
{
�� 
items
�� 
.
�� 
Add
�� 
(
�� 
$str
�� %
)
��% &
;
��& '
}
�� 
return
�� 
items
�� 
;
�� 
}
�� 	
}
�� 
}�� �

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
} �
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
rooms	~ �
)
� �
;
� �
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
;d e
Task 
< 
List 
< 
object 
> 
> -
!GetCheckInCheckOutForSpecificRoom <
(< =
int= @

roomNumberA K
)K L
;L M
} 
} �
�C:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Data\Migrations\20210512081254_InitialCreate.cs
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
}## �
mC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\DTOs\DateInterval.cs
	namespace 	
BookingMicroservice
 
. 
DTOs "
{ 
public 

class 
DateInterval 
{		 
public

 
DateTime

 
CheckIn

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
public 
DateTime 
CheckOut  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} �
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
}   �
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
} �
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
:  !
DateInterval" .
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
public		 
string		 
	SessionId		 
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
}

 
} �
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
} �
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
} �

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
} �

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
} �$
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
app99 
.99 %
UseDeveloperExceptionPage99 -
(99- .
)99. /
;99/ 0
app:: 
.:: 

UseSwagger:: 
(:: 
)::  
;::  !
app;; 
.;; 
UseSwaggerUI;;  
(;;  !
c;;! "
=>;;# %
c;;& '
.;;' (
SwaggerEndpoint;;( 7
(;;7 8
$str;;8 R
,;;R S
$str;;T l
);;l m
);;m n
;;;n o
}<< 
app>> 
.>> 
UseCors>> 
(>> $
MyAllowedSpecificOrigins>> 0
)>>0 1
;>>1 2
app@@ 
.@@ 

UseRouting@@ 
(@@ 
)@@ 
;@@ 
appBB 
.BB 
UseAuthorizationBB  
(BB  !
)BB! "
;BB" #
appDD 
.DD 
UseEndpointsDD 
(DD 
	endpointsDD &
=>DD' )
{EE 
	endpointsFF 
.FF 
MapControllersFF (
(FF( )
)FF) *
;FF* +
}GG 
)GG 
;GG 
}HH 	
}II 
}JJ �
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
} �
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
} �
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