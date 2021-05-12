‘r
^C:\Users\alexg\Documents\GitHub\Room-with-a-View\BookingMicroservice\BookingTests\UnitTests.cs
	namespace

 	
BookingTests


 
{ 
public 

class 
	UnitTests 
{ 
[ 	
Fact	 
] 
public 
async 
void G
;GetAllBookings_ValidAuthorization_ReturnOkObjectResultAsync U
(U V
)V W
{ 	
var 
options 
= 
new #
DbContextOptionsBuilder 5
<5 6
DataContext6 A
>A B
(B C
)C D
. 
UseInMemoryDatabase 2
(2 3
databaseName3 ?
:? @
$strA c
)c d
. 
Options &
;& '
var 
context 
= 
new 
DataContext )
() *
options* 1
)1 2
;2 3
await 
context 
. 
Database "
." #
EnsureCreatedAsync# 5
(5 6
)6 7
;7 8
GenerateData 
generateData %
=& '
new( +
(+ ,
context, 3
)3 4
;4 5
string 
authorizationToken %
=% &
generateData& 2
.2 3
SeedDataAndGetToken3 F
(F G
$strG N
)N O
;O P
BookingsController 
bookingsController 1
=2 3
new4 7
BookingsController8 J
(J K
newK N
BookingsRepositoryO a
(a b
contextb i
)i j
)j k
;k l
var 
result 
= 
await 
bookingsController 1
.1 2
GetBookings2 =
(= >
authorizationToken> P
)P Q
;Q R
Assert!! 
.!! 
IsType!! 
<!! 
OkObjectResult!! (
>!!( )
(!!) *
result!!* 0
)!!0 1
;!!1 2
}"" 	
[$$ 	
Fact$$	 
]$$ 
public%% 
async%% 
void%% L
@GetBookingsByUserId_ValidAuthorization_ReturnOkObjectResultAsync%% Z
(%%Z [
)%%[ \
{&& 	
var(( 
options(( 
=(( 
new(( #
DbContextOptionsBuilder(( 5
<((5 6
DataContext((6 A
>((A B
(((B C
)((C D
.)) 
UseInMemoryDatabase)) 2
())2 3
databaseName))3 ?
:))? @
$str))A ^
)))^ _
.** 
Options** &
;**& '
var++ 
context++ 
=++ 
new++ 
DataContext++ )
(++) *
options++* 1
)++1 2
;++2 3
await,, 
context,, 
.,, 
Database,, "
.,," #
EnsureCreatedAsync,,# 5
(,,5 6
),,6 7
;,,7 8
GenerateData-- 
generateData-- %
=--& '
new--( +
(--+ ,
context--, 3
)--3 4
;--4 5
string.. 
authorizationToken.. %
=..& '
generateData..( 4
...4 5
SeedDataAndGetToken..5 H
(..H I
$str..I P
)..P Q
;..Q R
BookingsController11 
bookingsController11 1
=112 3
new114 7
BookingsController118 J
(11J K
new11K N
BookingsRepository11O a
(11a b
context11b i
)11i j
)11j k
;11k l
var22 
result22 
=22 
await22 
bookingsController22 1
.221 2$
GetBookingsByUserIdAsync222 J
(22J K
authorizationToken22K ]
)22] ^
;22^ _
Assert55 
.55 
IsType55 
<55 
OkObjectResult55 (
>55( )
(55) *
result55* 0
)550 1
;551 2
}66 	
[88 	
Fact88	 
]88 
public99 
async99 
void99 O
CGetBookingsByBookingId_ValidAuthorization_ReturnOkObjectResultAsync99 ]
(99] ^
)99^ _
{:: 	
var<< 
options<< 
=<< 
new<< #
DbContextOptionsBuilder<< 5
<<<5 6
DataContext<<6 A
><<A B
(<<B C
)<<C D
.== 
UseInMemoryDatabase== 2
(==2 3
databaseName==3 ?
:==? @
$str==A _
)==_ `
.>> 
Options>> &
;>>& '
var?? 
context?? 
=?? 
new?? 
DataContext?? )
(??) *
options??* 1
)??1 2
;??2 3
await@@ 
context@@ 
.@@ 
Database@@ "
.@@" #
EnsureCreatedAsync@@# 5
(@@5 6
)@@6 7
;@@7 8
GenerateDataAA 
generateDataAA %
=AA& '
newAA( +
(AA+ ,
contextAA, 3
)AA3 4
;AA4 5
stringBB 
authorizationTokenBB %
=BB& '
generateDataBB( 4
.BB4 5
SeedDataAndGetTokenBB5 H
(BBH I
$strBBI P
)BBP Q
;BBQ R
BookingsControllerEE 
bookingsControllerEE 1
=EE2 3
newEE4 7
BookingsControllerEE8 J
(EEJ K
newEEK N
BookingsRepositoryEEO a
(EEa b
contextEEb i
)EEi j
)EEj k
;EEk l
varFF 
resultFF 
=FF 
awaitFF 
bookingsControllerFF 1
.FF1 2
GetBookingByIdAsyncFF2 E
(FFE F
$numFFF G
,FFG H
authorizationTokenFFI [
)FF[ \
;FF\ ]
AssertII 
.II 
IsTypeII 
<II 
OkObjectResultII (
>II( )
(II) *
resultII* 0
)II0 1
;II1 2
}JJ 	
[LL 	
FactLL	 
]LL 
publicMM 
asyncMM 
voidMM L
@SearchAvailableRoom_ValidAuthorization_ReturnOkObjectResultAsyncMM Z
(MMZ [
)MM[ \
{NN 	
varPP 
optionsPP 
=PP 
newPP #
DbContextOptionsBuilderPP 5
<PP5 6
DataContextPP6 A
>PPA B
(PPB C
)PPC D
.QQ 
UseInMemoryDatabaseQQ 2
(QQ2 3
databaseNameQQ3 ?
:QQ? @
$strQQA ^
)QQ^ _
.RR 
OptionsRR &
;RR& '
varSS 
contextSS 
=SS 
newSS 
DataContextSS )
(SS) *
optionsSS* 1
)SS1 2
;SS2 3
awaitTT 
contextTT 
.TT 
DatabaseTT "
.TT" #
EnsureCreatedAsyncTT# 5
(TT5 6
)TT6 7
;TT7 8
GenerateDataUU 
generateDataUU %
=UU& '
newUU( +
(UU+ ,
contextUU, 3
)UU3 4
;UU4 5
stringVV 
authorizationTokenVV %
=VV& '
generateDataVV( 4
.VV4 5
SeedDataAndGetTokenVV5 H
(VVH I
$strVVI P
)VVP Q
;VVQ R
RoomSearchDtoYY 
roomSearchDtoYY '
=YY( )
newYY* -
RoomSearchDtoYY. ;
(YY; <
)YY< =
{ZZ 
RoomCategory[[ 
=[[ 
$str[[ )
,[[) *
CheckIn\\ 
=\\ 
new\\ 
DateTime\\ &
(\\& '
$num\\' +
,\\+ ,
$num\\- /
,\\/ 0
$num\\1 3
)\\3 4
,\\4 5
CheckOut]] 
=]] 
new]] 
DateTime]] '
(]]' (
$num]]( ,
,]], -
$num]]. 0
,]]0 1
$num]]2 4
)]]4 5
,]]5 6
PersonsNumber^^ 
=^^ 
$num^^  !
}__ 
;__ 
BookingsController`` 
bookingsController`` 1
=``2 3
new``4 7
BookingsController``8 J
(``J K
new``K N
BookingsRepository``O a
(``a b
context``b i
)``i j
)``j k
;``k l
varaa 
resultaa 
=aa 
awaitaa 
bookingsControlleraa 1
.aa1 2%
SearchAvailableRoomsAsyncaa2 K
(aaK L
roomSearchDtoaaL Y
)aaY Z
;aaZ [
Assertdd 
.dd 
IsTypedd 
<dd 
OkObjectResultdd (
>dd( )
(dd) *
resultdd* 0
)dd0 1
;dd1 2
}ee 	
[gg 	
Factgg	 
]gg 
publichh 
asynchh 
voidhh C
7AddBooking_ValidAuthorization_ReturnOkObjectResultAsynchh Q
(hhQ R
)hhR S
{ii 	
varkk 
optionskk 
=kk 
newkk #
DbContextOptionsBuilderkk 5
<kk5 6
DataContextkk6 A
>kkA B
(kkB C
)kkC D
.ll 
UseInMemoryDatabasell 2
(ll2 3
databaseNamell3 ?
:ll? @
$strllA U
)llU V
.mm 
Optionsmm &
;mm& '
varnn 
contextnn 
=nn 
newnn 
DataContextnn )
(nn) *
optionsnn* 1
)nn1 2
;nn2 3
awaitoo 
contextoo 
.oo 
Databaseoo "
.oo" #
EnsureCreatedAsyncoo# 5
(oo5 6
)oo6 7
;oo7 8
GenerateDatapp 
generateDatapp %
=pp& '
newpp( +
(pp+ ,
contextpp, 3
)pp3 4
;pp4 5
stringqq 
authorizationTokenqq %
=qq& '
generateDataqq( 4
.qq4 5
SeedDataAndGetTokenqq5 H
(qqH I
$strqqI P
)qqP Q
;qqQ R
PostBookingDtott 
postBookingDtott )
=tt* +
newtt, /
PostBookingDtott0 >
(tt> ?
)tt? @
{uu 

RoomNumbervv 
=vv 
$numvv  
,vv  !
CheckInww 
=ww 
newww 
DateTimeww &
(ww& '
$numww' +
,ww+ ,
$numww- /
,ww/ 0
$numww1 3
)ww3 4
,ww4 5
CheckOutxx 
=xx 
newxx 
DateTimexx '
(xx' (
$numxx( ,
,xx, -
$numxx. 0
,xx0 1
$numxx2 4
)xx4 5
,xx5 6
UserIdyy 
=yy 
$numyy 
}zz 
;zz 
BookingsController{{ 
bookingsController{{ 1
={{2 3
new{{4 7
BookingsController{{8 J
({{J K
new{{K N
BookingsRepository{{O a
({{a b
context{{b i
){{i j
){{j k
;{{k l
var|| 
result|| 
=|| 
await|| 
bookingsController|| 1
.||1 2
AddBookingAsync||2 A
(||A B
postBookingDto||B P
,||P Q
authorizationToken||R d
)||d e
;||e f
Assert 
. 
IsType 
< !
CreatedAtActionResult /
>/ 0
(0 1
result1 7
)7 8
;8 9
}
ÄÄ 	
[
ÇÇ 	
Fact
ÇÇ	 
]
ÇÇ 
public
ÉÉ 
async
ÉÉ 
void
ÉÉ I
;UpdateBooking_ValidAuthorization_ReturnNoContentResultAsync
ÉÉ U
(
ÉÉU V
)
ÉÉV W
{
ÑÑ 	
var
ÜÜ 
options
ÜÜ 
=
ÜÜ 
new
ÜÜ %
DbContextOptionsBuilder
ÜÜ 5
<
ÜÜ5 6
DataContext
ÜÜ6 A
>
ÜÜA B
(
ÜÜB C
)
ÜÜC D
.
áá !
UseInMemoryDatabase
áá 2
(
áá2 3
databaseName
áá3 ?
:
áá? @
$str
ááA X
)
ááX Y
.
àà 
Options
àà &
;
àà& '
var
ââ 
context
ââ 
=
ââ 
new
ââ 
DataContext
ââ )
(
ââ) *
options
ââ* 1
)
ââ1 2
;
ââ2 3
await
ää 
context
ää 
.
ää 
Database
ää "
.
ää" # 
EnsureCreatedAsync
ää# 5
(
ää5 6
)
ää6 7
;
ää7 8
GenerateData
ãã 
generateData
ãã %
=
ãã& '
new
ãã( +
(
ãã+ ,
context
ãã, 3
)
ãã3 4
;
ãã4 5
string
åå  
authorizationToken
åå %
=
åå& '
generateData
åå( 4
.
åå4 5!
SeedDataAndGetToken
åå5 H
(
ååH I
$str
ååI P
)
ååP Q
;
ååQ R
PatchBookingDto
èè 
patchBookingDto
èè +
=
èè, -
new
èè. 1
PatchBookingDto
èè2 A
(
èèA B
)
èèB C
{
êê 
Id
ëë 
=
ëë 
$num
ëë 
,
ëë 
CheckIn
íí 
=
íí 
new
íí 
DateTime
íí &
(
íí& '
$num
íí' +
,
íí+ ,
$num
íí- /
,
íí/ 0
$num
íí1 3
)
íí3 4
,
íí4 5
CheckOut
ìì 
=
ìì 
new
ìì 
DateTime
ìì '
(
ìì' (
$num
ìì( ,
,
ìì, -
$num
ìì. 0
,
ìì0 1
$num
ìì2 4
)
ìì4 5
}
îî 
;
îî  
BookingsController
ïï  
bookingsController
ïï 1
=
ïï2 3
new
ïï4 7 
BookingsController
ïï8 J
(
ïïJ K
new
ïïK N 
BookingsRepository
ïïO a
(
ïïa b
context
ïïb i
)
ïïi j
)
ïïj k
;
ïïk l
var
ññ 
result
ññ 
=
ññ 
await
ññ  
bookingsController
ññ 1
.
ññ1 2 
UpdateBookingAsync
ññ2 D
(
ññD E
patchBookingDto
ññE T
,
ññT U 
authorizationToken
ññV h
)
ññh i
;
ññi j
Assert
ôô 
.
ôô 
IsType
ôô 
<
ôô 
NoContentResult
ôô )
>
ôô) *
(
ôô* +
result
ôô+ 1
)
ôô1 2
;
ôô2 3
}
öö 	
}
õõ 
}úú 