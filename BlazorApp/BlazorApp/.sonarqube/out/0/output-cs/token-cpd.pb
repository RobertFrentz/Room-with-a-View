�
OC:\Users\alexg\Documents\GitHub\Room-with-a-View\BlazorApp\BlazorApp\Program.cs
	namespace 	
	BlazorApp
 
{
public 

class 
Program 
{ 
public 
static 
async 
Task  
Main! %
(% &
string& ,
[, -
]- .
args/ 3
)3 4
{ 	
var 
builder 
= "
WebAssemblyHostBuilder 0
.0 1

(> ?
args? C
)C D
;D E
builder 
. 
RootComponents "
." #
Add# &
<& '
App' *
>* +
(+ ,
$str, 2
)2 3
;3 4
builder 
. 
Services 
. 
	AddScoped &
(& '
sp' )
=>* ,
new- 0

HttpClient1 ;
{< =
BaseAddress> I
=J K
newL O
UriP S
(S T
builderT [
.[ \
HostEnvironment\ k
.k l
BaseAddressl w
)w x
}y z
)z {
;{ |
builder 
. 
Services 
. %
AddBlazoredSessionStorage 6
(6 7
)7 8
;8 9
await 
builder 
. 
Build 
(  
)  !
.! "
RunAsync" *
(* +
)+ ,
;, -
} 	
} 
} 