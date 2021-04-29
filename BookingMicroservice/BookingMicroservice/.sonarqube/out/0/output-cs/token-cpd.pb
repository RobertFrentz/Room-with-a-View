�
zC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Controllers\BookingsController.cs
	namespace 	
BookingMicroservice
 
. 
Controllers )
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
BookingsController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
IBookingsRepository ,
_repository- 8
;8 9
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
;g h
private 
readonly 
string *
roomsManagementMicroserviceUri  >
=? @
$strA f
;f g
public 
BookingsController !
(! "
IBookingsRepository" 5

repository6 @
)@ A
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
[ 	
Route	 
( 
$str 
) 
] 
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetBookings) 4
(4 5
[5 6

FromHeader6 @
]@ A
stringB H
authorizationTokenI [
)[ \
{ 	
client 
. !
DefaultRequestHeaders (
.( )
Add) ,
(, -
$str- A
,A B
authorizationTokenC U
)U V
;V W
var   !
responseAuthorization   %
=  & '
await  ( -
client  . 4
.  4 5
GetAsync  5 =
(  = >*
usersManagementMicroserviceUri  > \
+  \ ]
$str  ] l
)  l m
;  m n
if!! 
(!! !
responseAuthorization!! %
.!!% &

StatusCode!!& 0
==!!1 3
System!!4 :
.!!: ;
Net!!; >
.!!> ?
HttpStatusCode!!? M
.!!M N
Unauthorized!!N Z
)!!Z [
{"" 
return## 
Unauthorized## #
(### $!
responseAuthorization##$ 9
.##9 :
Content##: A
.##A B
ReadAsStringAsync##B S
(##S T
)##T U
.##U V
Result##V \
)##\ ]
;##] ^
}$$ 
var%% 
bookings%% 
=%% 
await%%  
_repository%%! ,
.%%, -
GetBookings%%- 8
(%%8 9
)%%9 :
;%%: ;
return&& 
Ok&& 
(&& 
bookings&& 
)&& 
;&&  
}'' 	
[** 	
HttpGet**	 
]** 
public++ 
async++ 
Task++ 
<++ 
IActionResult++ '
>++' ($
GetBookingsByUserIdAsync++) A
(++A B
[++B C

FromHeader++C M
]++M N
string++O U
authorizationToken++V h
)++h i
{,, 	
client-- 
.-- !
DefaultRequestHeaders-- (
.--( )
Add--) ,
(--, -
$str--- A
,--A B
authorizationToken--C U
)--U V
;--V W
var.. !
responseAuthorization.. %
=..& '
await..( -
client... 4
...4 5
GetAsync..5 =
(..= >*
usersManagementMicroserviceUri..> \
+..] ^
$str.._ n
)..n o
;..o p
if// 
(// !
responseAuthorization// %
.//% &

StatusCode//& 0
==//1 3
System//4 :
.//: ;
Net//; >
.//> ?
HttpStatusCode//? M
.//M N
Unauthorized//N Z
)//Z [
{00 
return11 
Unauthorized11 #
(11# $!
responseAuthorization11$ 9
.119 :
Content11: A
.11A B
ReadAsStringAsync11B S
(11S T
)11T U
.11U V
Result11V \
)11\ ]
;11] ^
}22 
var33 
userId33 
=33 
	ExtractId33 "
.33" #
ExtractUserId33# 0
(330 1!
responseAuthorization331 F
.33F G
Content33G N
.33N O
ReadAsStringAsync33O `
(33` a
)33a b
.33b c
Result33c i
)33i j
;33j k
var44 
bookings44 
=44 
await44  
_repository44! ,
.44, -
GetBookingsByUserId44- @
(44@ A
userId44A G
)44G H
;44H I
if55 
(55 
!55 
bookings55 
.55 
Any55 
(55 
)55 
)55  
{66 
return77 
NotFound77 
(77  
new77  #
Error77$ )
(77) *
$str77* A
)77A B
)77B C
;77C D
}88 
return99 
Ok99 
(99 
bookings99 
)99 
;99  
}:: 	
[<< 	
HttpGet<<	 
(<< 
$str<< 
)<< 
]<< 
public== 
async== 
Task== 
<== 
IActionResult== '
>==' (
GetBookingByIdAsync==) <
(==< =
int=== @
id==A C
,==C D
[==E F

FromHeader==F P
]==P Q
string==R X
authorizationToken==Y k
)==k l
{>> 	
client?? 
.?? !
DefaultRequestHeaders?? (
.??( )
Add??) ,
(??, -
$str??- A
,??A B
authorizationToken??C U
)??U V
;??V W
var@@ !
responseAuthorization@@ %
=@@& '
await@@( -
client@@. 4
.@@4 5
GetAsync@@5 =
(@@= >*
usersManagementMicroserviceUri@@> \
+@@] ^
$str@@_ n
)@@n o
;@@o p
ifAA 
(AA !
responseAuthorizationAA %
.AA% &

StatusCodeAA& 0
==AA1 3
SystemAA4 :
.AA: ;
NetAA; >
.AA> ?
HttpStatusCodeAA? M
.AAM N
UnauthorizedAAN Z
)AAZ [
{BB 
returnCC 
UnauthorizedCC #
(CC# $!
responseAuthorizationCC$ 9
.CC9 :
ContentCC: A
.CCA B
ReadAsStringAsyncCCB S
(CCS T
)CCT U
.CCU V
ResultCCV \
)CC\ ]
;CC] ^
}DD 
varEE 
resultEE 
=EE 
awaitEE 
_repositoryEE *
.EE* +
GetBookingByIdAsyncEE+ >
(EE> ?
idEE? A
)EEA B
;EEB C
ifFF 
(FF 
resultFF 
==FF 
nullFF 
)FF 
{GG 
returnHH 
NotFoundHH 
(HH  
newHH  #
ErrorHH$ )
(HH) *
$"HH* ,
Booking with id HH, <
{HH< =
idHH= ?
}HH? @
 does not exist.HH@ P
"HHP Q
)HHQ R
)HHR S
;HHS T
}II 
returnJJ 
OkJJ 
(JJ 
JsonConvertJJ !
.JJ! "
SerializeObjectJJ" 1
(JJ1 2
newJJ2 5
{KK 
IdLL 
=LL 
resultLL 
.LL 
IdLL 
,LL 

RoomNumberMM 
=MM 
resultMM #
.MM# $

RoomNumberMM$ .
,MM. /
CheckInNN 
=NN 
resultNN  
.NN  !
CheckInNN! (
,NN( )
CheckOutOO 
=OO 
resultOO !
.OO! "
CheckOutOO" *
,OO* +
TotalPayPP 
=PP 
resultPP !
.PP! "
TotalPayPP" *
,PP* +
StatusQQ 
=QQ 
resultQQ 
.QQ  
StatusQQ  &
}RR 
)RR 
)RR 
;RR 
}SS 	
[TT 	
RouteTT	 
(TT 
$strTT 
)TT 
]TT 
[UU 	
HttpGetUU	 
]UU 
publicVV 
asyncVV 
TaskVV 
<VV 
IActionResultVV '
>VV' (%
SearchAvailableRoomsAsyncVV) B
(VVB C
[VVC D
	FromQueryVVD M
]VVM N
RoomSearchDtoVVO \
roomSearchDTOVV] j
)VVj k
{WW 	
varXX 
httpResultContentXX !
=XX" #
awaitXX$ )
clientXX* 0
.XX0 1
GetStringAsyncXX1 ?
(XX? @*
roomsManagementMicroserviceUriXX@ ^
)XX^ _
;XX_ `
ifYY 
(YY 
httpResultContentYY  
!=YY  "
nullYY" &
)YY& '
{ZZ 
List[[ 
<[[ 
RoomDescriptionDto[[ '
>[[' (
?[[( )
rooms[[* /
=[[0 1
JsonConvert[[2 =
.[[= >
DeserializeObject[[> O
<[[O P
List[[P T
<[[T U
RoomDescriptionDto[[U g
>[[g h
>[[h i
([[i j
httpResultContent[[j {
)[[{ |
;[[| }
if\\ 
(\\ 
rooms\\ 
!=\\ 
null\\ 
)\\ 
{]] 
var^^ 
result^^ 
=^^  
_repository^^! ,
.^^, -%
SearchAvailableRoomsAsync^^- F
(^^F G
roomSearchDTO^^G T
,^^T U
rooms^^V [
)^^[ \
;^^\ ]
if__ 
(__ 
result__ 
==__ !
null__" &
)__& '
{`` 
returnaa 
NotFoundaa '
(aa' (
newaa( +
Erroraa, 1
(aa1 2
$straa2 F
)aaF G
)aaG H
;aaH I
}bb 
returncc 
Okcc 
(cc 
JsonConvertcc )
.cc) *
SerializeObjectcc* 9
(cc9 :
newcc: =
{dd 
roomsee 
=ee 
resultee  &
.ee& '
Resultee' -
}ff 
)ff 
)ff 
;ff 
}gg 
}ii 
returnjj 
NotFoundjj 
(jj 
newjj 
Errorjj  %
(jj% &
$strjj& 7
)jj7 8
)jj8 9
;jj9 :
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
PostBookingDtonnD R
postBookingnnS ^
,nn^ _
[nn` a

FromHeadernna k
]nnk l
stringnnm s
authorizationToken	nnt �
)
nn� �
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
(qq= >*
usersManagementMicroserviceUriqq> \
+qq] ^
$strqq_ n
)qqn o
;qqo p
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
)
��J K
;
��K L
if
�� 
(
�� 
result
�� 
==
�� 
-
�� 
$num
�� 
)
�� 
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
��* ,
Booking with id 
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
��L M
 does not exist.
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
�� 
result
�� 
==
�� 
-
�� 
$num
�� 
)
�� 
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
}
�� 
}�� �r
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
GetBookingDto '
?' (
>( )
GetBookingByIdAsync* =
(= >
int> A
idB D
)D E
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
GetBookingDto"" $
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
PostBookingDto--/ =
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
CheckIn	//} �
==
//� �
postBooking
//� �
.
//� �
CheckIn
//� �
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
postBooking	00{ �
.
00� �
UserId
00� �
)
00� �
;
00� �
if11 
(11 
result11 
)11 
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
(55O P
booking55P W
.55W X

RoomNumber55X b
==55c e
postBooking55f q
.55q r

RoomNumber55r |
&&55} 
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
CheckOut	66 �
)
66� �
||
66� �
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
CheckOut	77 �
)
77� �
||
77� �
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
CheckOut	88 �
)
88� �
||
88� �
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
CheckOut	99 �
)
99� �
)
99� �
)
99� �
)
99� �
;
99� �
if:: 
(:: 
!:: 
isAddingPossible:: !
)::! "
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
PatchBookingDtoMM2 A
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
UU� �
patchBooking
UU� �
.
UU� �
Id
UU� �
&&
UU� �
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
patchBooking	VVt �
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
<WWG H
patchBookingWWI U
.WWU V
CheckInWWV ]
&&WW^ `
bookingWWa h
.WWh i
CheckOutWWi q
<WWr s
patchBooking	WWt �
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
patchBooking	XXt �
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
)
YY� �
;
YY� �
ifZZ 
(ZZ 
!ZZ 
isUpdatePossibleZZ  
)ZZ  !
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
RoomDescriptionDto	ffw �
>
ff� �
rooms
ff� �
)
ff� �
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
roomSearchDTO	ppu �
.
pp� �
CheckOut
pp� �
)
pp� �
||
pp� �
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
roomSearchDTO	qqu �
.
qq� �
CheckOut
qq� �
)
qq� �
||
qq� �
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
roomSearchDTO	rru �
.
rr� �
CheckOut
rr� �
)
rr� �
||
rr� �
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
roomSearchDTO	ssu �
.
ss� �
CheckOut
ss� �
)
ss� �
)
ss� �
)
ss� �
)
ss� �
;
ss� �
iftt 
(tt 
!tt 
isAvailablett 
)tt  
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
} �

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
} �
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
GetBookingDto 
? 
> 
GetBookingByIdAsync 0
(0 1
int1 4
id5 7
)7 8
;8 9
Task 
< 
int 
> 
AddBookingAsync !
(! "
PostBookingDto" 0
postBooking1 <
)< =
;= >
Task 
< 
int 
> 
UpdateBookingAsync $
($ %
PatchBookingDto% 4
patchBooking5 A
)A B
;B C
Task 
< 
IEnumerable 
< 
RoomDescriptionDto +
>+ ,
>, -%
SearchAvailableRoomsAsync. G
(G H
RoomSearchDtoH U
roomSearchDTOV c
,c d
Liste i
<i j
RoomDescriptionDtoj |
>| }
rooms	~ �
)
� �
;
� �
} 
} �
�C:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\Data\Migrations\20210420162326_InitialCreate.cs
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
}## �
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
} �
oC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\DTOs\PostBookingDto.cs
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
} �

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
} �
nC:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingMicroservice\DTOs\RoomSearchDto.cs
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
}II �.
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
jwtValid
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
/ �
;


� �
public 
string 

jwtInvalid  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
$str	1 �
;
� �
public 
List 
< 
Booking 
> 

ReturnList '
(' (
)( )
{ 	
Bookings 
. 
Add 
( 
new 
Booking $
($ %
)% &
{ 
Id 
= 
$num 
, 

RoomNumber 
= 
$num 
, 
CheckIn 
= 
new 
DateTime %
(% &
$num& *
,* +
$num, .
,. /
$num0 2
)2 3
,3 4
CheckOut 
= 
new 
DateTime &
(& '
$num' +
,+ ,
$num- /
,/ 0
$num1 3
)3 4
,4 5
UserId 
= 
$num 
, 
TotalPay 
= 
$num 
, 
Status 
= 
$str #
} 
) 
; 
Bookings 
. 
Add 
( 
new 
Booking $
($ %
)% &
{ 
Id 
= 
$num 
, 

RoomNumber 
= 
$num  
,  !
CheckIn 
= 
new 
DateTime &
(& '
$num' +
,+ ,
$num- /
,/ 0
$num1 3
)3 4
,4 5
CheckOut 
= 
new 
DateTime '
(' (
$num( ,
,, -
$num. 0
,0 1
$num2 4
)4 5
,5 6
UserId 
= 
$num 
, 
TotalPay 
= 
$num 
, 
Status   
=   
$str   %
}!! 
)!! 
;!! 
Bookings"" 
."" 
Add"" 
("" 
new"" 
Booking"" $
(""$ %
)""% &
{## 
Id$$ 
=$$ 
$num$$ 
,$$ 

RoomNumber%% 
=%% 
$num%%  
,%%  !
CheckIn&& 
=&& 
new&& 
DateTime&& &
(&&& '
$num&&' +
,&&+ ,
$num&&- /
,&&/ 0
$num&&1 3
)&&3 4
,&&4 5
CheckOut'' 
='' 
new'' 
DateTime'' '
(''' (
$num''( ,
,'', -
$num''. 0
,''0 1
$num''2 4
)''4 5
,''5 6
UserId(( 
=(( 
$num(( 
,(( 
TotalPay)) 
=)) 
$num)) 
,)) 
Status** 
=** 
$str** %
}++ 
)++ 
;++ 
Bookings,, 
.,, 
Add,, 
(,, 
new,, 
Booking,, $
(,,$ %
),,% &
{-- 
Id.. 
=.. 
$num.. 
,.. 

RoomNumber// 
=// 
$num//  
,//  !
CheckIn00 
=00 
new00 
DateTime00 &
(00& '
$num00' +
,00+ ,
$num00- /
,00/ 0
$num001 3
)003 4
,004 5
CheckOut11 
=11 
new11 
DateTime11 '
(11' (
$num11( ,
,11, -
$num11. 0
,110 1
$num112 4
)114 5
,115 6
UserId22 
=22 
$num22 
,22 
TotalPay33 
=33 
$num33 
,33 
Status44 
=44 
$str44 %
}55 
)55 
;55 
Bookings66 
.66 
Add66 
(66 
new66 
Booking66 $
(66$ %
)66% &
{77 
Id88 
=88 
$num88 
,88 

RoomNumber99 
=99 
$num99  
,99  !
CheckIn:: 
=:: 
new:: 
DateTime:: &
(::& '
$num::' +
,::+ ,
$num::- /
,::/ 0
$num::1 3
)::3 4
,::4 5
CheckOut;; 
=;; 
new;; 
DateTime;; '
(;;' (
$num;;( ,
,;;, -
$num;;. 0
,;;0 1
$num;;2 4
);;4 5
,;;5 6
UserId<< 
=<< 
$num<< 
,<< 
TotalPay== 
=== 
$num== 
,== 
Status>> 
=>> 
$str>> %
}?? 
)?? 
;?? 
return@@ 
Bookings@@ 
;@@ 
}AA 	
}BB 
}CC �
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
} �

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
} �
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
jwtValid  (
;( )
} 
else 
{   
return!! 
dataList!! 
.!!  

jwtInvalid!!  *
;!!* +
}"" 
}## 	
}$$ 
}%% 