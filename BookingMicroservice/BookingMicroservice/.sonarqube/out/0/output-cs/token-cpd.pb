»ä
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
+""\ ]
$str""] l
)""l m
;""m n
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
var'' 
bookings'' 
='' 
await''  
_repository''! ,
.'', -
GetBookings''- 8
(''8 9
)''9 :
;'': ;
return(( 
Ok(( 
((( 
bookings(( 
)(( 
;((  
})) 	
[,, 	
HttpGet,,	 
],, 
public-- 
async-- 
Task-- 
<-- 
IActionResult-- '
>--' (
GetBookingsByUserId--) <
(--< =
[--= >

FromHeader--> H
]--H I
string--J P
authorizationToken--Q c
)--c d
{.. 	
client// 
.// !
DefaultRequestHeaders// (
.//( )
Add//) ,
(//, -
$str//- A
,//A B
authorizationToken//C U
)//U V
;//V W
var00 !
responseAuthorization00 %
=00& '
await00( -
client00. 4
.004 5
GetAsync005 =
(00= >*
usersManagementMicroserviceUri00> \
+00] ^
$str00_ n
)00n o
;00o p
if11 
(11 !
responseAuthorization11 %
.11% &

StatusCode11& 0
==111 3
System114 :
.11: ;
Net11; >
.11> ?
HttpStatusCode11? M
.11M N
Unauthorized11N Z
)11Z [
{22 
return33 
Unauthorized33 #
(33# $!
responseAuthorization33$ 9
.339 :
Content33: A
.33A B
ReadAsStringAsync33B S
(33S T
)33T U
.33U V
Result33V \
)33\ ]
;33] ^
}44 
var55 
userId55 
=55 
	ExtractId55 "
.55" #
ExtractUserId55# 0
(550 1!
responseAuthorization551 F
.55F G
Content55G N
.55N O
ReadAsStringAsync55O `
(55` a
)55a b
.55b c
Result55c i
)55i j
;55j k
var66 
bookings66 
=66 
await66  
_repository66! ,
.66, -
GetBookingsByUserId66- @
(66@ A
userId66A G
)66G H
;66H I
if77 
(77 
!77 
bookings77 
.77 
Any77 
(77 
)77 
)77  
{88 
return99 
NotFound99 
(99  
new99  #
Error99$ )
(99) *
$str99* A
)99A B
)99B C
;99C D
}:: 
return;; 
Ok;; 
(;; 
bookings;; 
);; 
;;;  
}<< 	
[>> 	
HttpGet>>	 
(>> 
$str>> 
)>> 
]>> 
public?? 
async?? 
Task?? 
<?? 
IActionResult?? '
>??' (
GetBookingByIdAsync??) <
(??< =
int??= @
id??A C
,??C D
[??E F

FromHeader??F P
]??P Q
string??R X
authorizationToken??Y k
)??k l
{@@ 	
clientAA 
.AA !
DefaultRequestHeadersAA (
.AA( )
AddAA) ,
(AA, -
$strAA- A
,AAA B
authorizationTokenAAC U
)AAU V
;AAV W
varBB !
responseAuthorizationBB %
=BB& '
awaitBB( -
clientBB. 4
.BB4 5
GetAsyncBB5 =
(BB= >*
usersManagementMicroserviceUriBB> \
+BB] ^
$strBB_ n
)BBn o
;BBo p
ifCC 
(CC !
responseAuthorizationCC %
.CC% &

StatusCodeCC& 0
==CC1 3
SystemCC4 :
.CC: ;
NetCC; >
.CC> ?
HttpStatusCodeCC? M
.CCM N
UnauthorizedCCN Z
)CCZ [
{DD 
returnEE 
UnauthorizedEE #
(EE# $!
responseAuthorizationEE$ 9
.EE9 :
ContentEE: A
.EEA B
ReadAsStringAsyncEEB S
(EES T
)EET U
.EEU V
ResultEEV \
)EE\ ]
;EE] ^
}FF 
varGG 
resultGG 
=GG 
awaitGG 
_repositoryGG *
.GG* +
GetBookingByIdAsyncGG+ >
(GG> ?
idGG? A
)GGA B
;GGB C
ifHH 
(HH 
resultHH 
==HH 
nullHH 
)HH 
{II 
returnJJ 
NotFoundJJ 
(JJ  
newJJ  #
ErrorJJ$ )
(JJ) *
$"JJ* ,
Booking with id JJ, <
{JJ< =
idJJ= ?
}JJ? @
 does not exist.JJ@ P
"JJP Q
)JJQ R
)JJR S
;JJS T
}KK 
returnLL 
OkLL 
(LL 
JsonConvertLL !
.LL! "
SerializeObjectLL" 1
(LL1 2
newLL2 5
{MM 
IdNN 
=NN 
resultNN 
.NN 
IdNN 
,NN 

RoomNumberOO 
=OO 
resultOO #
.OO# $

RoomNumberOO$ .
,OO. /
CheckInPP 
=PP 
resultPP  
.PP  !
CheckInPP! (
,PP( )
CheckOutQQ 
=QQ 
resultQQ !
.QQ! "
CheckOutQQ" *
,QQ* +
TotalPayRR 
=RR 
resultRR !
.RR! "
TotalPayRR" *
,RR* +
StatusSS 
=SS 
resultSS 
.SS  
StatusSS  &
}TT 
)TT 
)TT 
;TT 
}UU 	
[VV 	
RouteVV	 
(VV 
$strVV 
)VV 
]VV 
[WW 	
HttpGetWW	 
]WW 
publicXX 
asyncXX 
TaskXX 
<XX 
IActionResultXX '
>XX' (%
SearchAvailableRoomsAsyncXX) B
(XXB C
[XXC D
	FromQueryXXD M
]XXM N
RoomSearchDtoXXO \
roomSearchDTOXX] j
,XXj k
[XXk l

FromHeaderXXl v
]XXv w
stringXXx ~
authorizationToken	XX ë
)
XXë í
{YY 	
clientZZ 
.ZZ !
DefaultRequestHeadersZZ (
.ZZ( )
AddZZ) ,
(ZZ, -
$strZZ- A
,ZZA B
authorizationTokenZZC U
)ZZU V
;ZZV W
var[[ !
responseAuthorization[[ %
=[[& '
await[[( -
client[[. 4
.[[4 5
GetAsync[[5 =
([[= >*
usersManagementMicroserviceUri[[> \
+[[] ^
$str[[_ n
)[[n o
;[[o p
if\\ 
(\\ !
responseAuthorization\\ $
.\\$ %

StatusCode\\% /
==\\/ 1
System\\1 7
.\\7 8
Net\\8 ;
.\\; <
HttpStatusCode\\< J
.\\J K
Unauthorized\\K W
)\\W X
{]] 
return^^ 
Unauthorized^^ #
(^^# $!
responseAuthorization^^$ 9
.^^9 :
Content^^: A
.^^A B
ReadAsStringAsync^^B S
(^^S T
)^^T U
.^^U V
Result^^V \
)^^\ ]
;^^] ^
}__ 
var`` 
httpResultContent`` !
=``" #
await``$ )
client``* 0
.``0 1
GetStringAsync``1 ?
(``? @*
roomsManagementMicroserviceUri``@ ^
)``^ _
;``_ `
ifaa 
(aa 
httpResultContentaa  
!=aa  "
nullaa" &
)aa& '
{bb 
Listcc 
<cc 
RoomDescriptionDtocc '
>cc' (
?cc( )
roomscc* /
=cc0 1
JsonConvertcc2 =
.cc= >
DeserializeObjectcc> O
<ccO P
ListccP T
<ccT U
RoomDescriptionDtoccU g
>ccg h
>cch i
(cci j
httpResultContentccj {
)cc{ |
;cc| }
ifdd 
(dd 
roomsdd 
!=dd 
nulldd 
)dd 
{ee 
varff 
resultff 
=ff  
_repositoryff! ,
.ff, -%
SearchAvailableRoomsAsyncff- F
(ffF G
roomSearchDTOffG T
,ffT U
roomsffV [
)ff[ \
;ff\ ]
ifgg 
(gg 
resultgg 
==gg !
nullgg" &
)gg& '
{hh 
returnii 
NotFoundii '
(ii' (
newii( +
Errorii, 1
(ii1 2
$strii2 F
)iiF G
)iiG H
;iiH I
}jj 
returnkk 
Okkk 
(kk 
JsonConvertkk )
.kk) *
SerializeObjectkk* 9
(kk9 :
newkk: =
{ll 
roomsmm 
=mm 
resultmm  &
.mm& '
Resultmm' -
}nn 
)nn 
)nn 
;nn 
}oo 
}qq 
returnrr 
NotFoundrr 
(rr 
newrr 
Errorrr  %
(rr% &
$strrr& 7
)rr7 8
)rr8 9
;rr9 :
}ss 	
[uu 	
HttpPostuu	 
]uu 
publicvv 
asyncvv 
Taskvv 
<vv 
IActionResultvv '
>vv' (
AddBookingAsyncvv) 8
(vv8 9
[vv9 :
FromBodyvv: B
]vvB C
PostBookingDtovvD R
postBookingvvS ^
,vv^ _
[vv` a

FromHeadervva k
]vvk l
stringvvm s
authorizationToken	vvt Ü
)
vvÜ á
{ww 	
clientxx 
.xx !
DefaultRequestHeadersxx (
.xx( )
Addxx) ,
(xx, -
$strxx- A
,xxA B
authorizationTokenxxC U
)xxU V
;xxV W
varyy !
responseAuthorizationyy %
=yy& '
awaityy( -
clientyy. 4
.yy4 5
GetAsyncyy5 =
(yy= >*
usersManagementMicroserviceUriyy> \
+yy] ^
$stryy_ n
)yyn o
;yyo p
ifzz 
(zz !
responseAuthorizationzz %
.zz% &

StatusCodezz& 0
==zz1 3
Systemzz4 :
.zz: ;
Netzz; >
.zz> ?
HttpStatusCodezz? M
.zzM N
UnauthorizedzzN Z
)zzZ [
{{{ 
return|| 
Unauthorized|| #
(||# $!
responseAuthorization||$ 9
.||9 :
Content||: A
.||A B
ReadAsStringAsync||B S
(||S T
)||T U
.||U V
Result||V \
)||\ ]
;||] ^
}}} 
var~~ 
result~~ 
=~~ 
await~~ 
_repository~~ *
.~~* +
AddBookingAsync~~+ :
(~~: ;
postBooking~~; F
)~~F G
;~~G H
if 
( 
result 
== 
- 
$num 
) 
{
ÄÄ 
return
ÅÅ 

BadRequest
ÅÅ !
(
ÅÅ! "
new
ÅÅ" %
Error
ÅÅ& +
(
ÅÅ+ ,
$str
ÅÅ, E
)
ÅÅE F
)
ÅÅF G
;
ÅÅG H
}
ÇÇ 
if
ÉÉ 
(
ÉÉ 
result
ÉÉ 
==
ÉÉ 
-
ÉÉ 
$num
ÉÉ 
)
ÉÉ 
{
ÑÑ 
return
ÖÖ 

BadRequest
ÖÖ !
(
ÖÖ! "
new
ÖÖ" %
Error
ÖÖ& +
(
ÖÖ+ ,
$str
ÖÖ, i
)
ÖÖi j
)
ÖÖj k
;
ÖÖk l
}
ÜÜ 
return
áá 
CreatedAtAction
áá "
(
áá" #
$str
áá# /
,
áá/ 0
postBooking
áá1 <
)
áá< =
;
áá= >
}
àà 	
[
ää 	
	HttpPatch
ää	 
]
ää 
public
ãã 
async
ãã 
Task
ãã 
<
ãã 
IActionResult
ãã '
>
ãã' ( 
UpdateBookingAsync
ãã) ;
(
ãã; <
[
ãã< =
FromBody
ãã= E
]
ããE F
PatchBookingDto
ããG V
patchBooking
ããW c
,
ããc d
[
ããe f

FromHeader
ããf p
]
ããp q
string
ããr x!
authorizationTokenããy ã
)ããã å
{
åå 	
client
çç 
.
çç #
DefaultRequestHeaders
çç (
.
çç( )
Add
çç) ,
(
çç, -
$str
çç- A
,
ççA B 
authorizationToken
ççC U
)
ççU V
;
ççV W
var
éé #
responseAuthorization
éé %
=
éé& '
await
éé( -
client
éé. 4
.
éé4 5
GetAsync
éé5 =
(
éé= >,
usersManagementMicroserviceUri
éé> \
+
éé] ^
$str
éé_ n
)
één o
;
ééo p
if
èè 
(
èè #
responseAuthorization
èè %
.
èè% &

StatusCode
èè& 0
==
èè1 3
System
èè4 :
.
èè: ;
Net
èè; >
.
èè> ?
HttpStatusCode
èè? M
.
èèM N
Unauthorized
èèN Z
)
èèZ [
{
êê 
return
ëë 
Unauthorized
ëë #
(
ëë# $#
responseAuthorization
ëë$ 9
.
ëë9 :
Content
ëë: A
.
ëëA B
ReadAsStringAsync
ëëB S
(
ëëS T
)
ëëT U
.
ëëU V
Result
ëëV \
)
ëë\ ]
;
ëë] ^
}
íí 
var
ìì 
result
ìì 
=
ìì 
await
ìì 
_repository
ìì *
.
ìì* + 
UpdateBookingAsync
ìì+ =
(
ìì= >
patchBooking
ìì> J
)
ììJ K
;
ììK L
if
îî 
(
îî 
result
îî 
==
îî 
-
îî 
$num
îî 
)
îî 
{
ïï 
return
ññ 
NotFound
ññ 
(
ññ  
new
ññ  #
Error
ññ$ )
(
ññ) *
$"
ññ* ,
Booking with id 
ññ, <
{
ññ< =
patchBooking
ññ= I
.
ññI J
Id
ññJ L
}
ññL M
 does not exist.
ññM ]
"
ññ] ^
)
ññ^ _
)
ññ_ `
;
ññ` a
}
óó 
if
òò 
(
òò 
result
òò 
==
òò 
-
òò 
$num
òò 
)
òò 
{
ôô 
return
öö 

BadRequest
öö !
(
öö! "
new
öö" %
Error
öö& +
(
öö+ ,
$str
öö, i
)
ööi j
)
ööj k
;
öök l
}
õõ 
return
úú 
	NoContent
úú 
(
úú 
)
úú 
;
úú 
}
ùù 	
}
ûû 
}üü ør
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
isAddingPossible::  
)::  !
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
} ÿ
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
} ∞
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
} §

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
} Á
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
public 
string 
? 
Status 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} ÿ

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
	namespace 	
BookingMicroservice
 
. 
Utils #
{ 
public 

static 
class 
	ExtractId !
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