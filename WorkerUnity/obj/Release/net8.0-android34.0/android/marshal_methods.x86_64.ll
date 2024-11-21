; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [191 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [382 x i64] [
	i64 96808603140984794, ; 0: Google.Cloud.Location.dll => 0x157eee9616b8fda => 47
	i64 98382396393917666, ; 1: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 70
	i64 120698629574877762, ; 2: Mono.Android => 0x1accec39cafe242 => 190
	i64 131669012237370309, ; 3: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 74
	i64 196720943101637631, ; 4: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 134
	i64 210515253464952879, ; 5: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 88
	i64 232391251801502327, ; 6: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 105
	i64 502670939551102150, ; 7: System.Management.dll => 0x6f9d88e66daf4c6 => 83
	i64 545109961164950392, ; 8: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 7
	i64 560278790331054453, ; 9: System.Reflection.Primitives => 0x7c6829760de3975 => 158
	i64 718159679911342543, ; 10: FirebaseAdmin.dll => 0x9f76a6c851fb1cf => 37
	i64 750875890346172408, ; 11: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 180
	i64 799765834175365804, ; 12: System.ComponentModel.dll => 0xb1956c9f18442ac => 121
	i64 849051935479314978, ; 13: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 10
	i64 872800313462103108, ; 14: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 93
	i64 1010599046655515943, ; 15: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 158
	i64 1120440138749646132, ; 16: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 109
	i64 1121665720830085036, ; 17: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 18
	i64 1268860745194512059, ; 18: System.Drawing.dll => 0x119be62002c19ebb => 129
	i64 1369545283391376210, ; 19: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 101
	i64 1476839205573959279, ; 20: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 142
	i64 1486715745332614827, ; 21: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 71
	i64 1492954217099365037, ; 22: System.Net.HttpListener => 0x14b809f350210aad => 139
	i64 1513467482682125403, ; 23: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 189
	i64 1537168428375924959, ; 24: System.Threading.Thread.dll => 0x15551e8a954ae0df => 180
	i64 1556147632182429976, ; 25: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 16
	i64 1624659445732251991, ; 26: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 86
	i64 1628611045998245443, ; 27: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 98
	i64 1731380447121279447, ; 28: Newtonsoft.Json => 0x18071957e9b889d7 => 77
	i64 1743969030606105336, ; 29: System.Memory.dll => 0x1833d297e88f2af8 => 137
	i64 1767386781656293639, ; 30: System.Private.Uri.dll => 0x188704e9f5582107 => 152
	i64 1769105627832031750, ; 31: Google.Protobuf => 0x188d203205129a06 => 49
	i64 1795316252682057001, ; 32: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 85
	i64 1825687700144851180, ; 33: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 162
	i64 1835311033149317475, ; 34: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 35: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 105
	i64 1865037103900624886, ; 36: Microsoft.Bcl.AsyncInterfaces => 0x19e1f15d56eb87f6 => 61
	i64 1875417405349196092, ; 37: System.Drawing.Primitives => 0x1a06d2319b6c713c => 128
	i64 1881198190668717030, ; 38: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1920760634179481754, ; 39: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 72
	i64 1959996714666907089, ; 40: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 28
	i64 1972385128188460614, ; 41: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 170
	i64 1981742497975770890, ; 42: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 97
	i64 1983698669889758782, ; 43: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 2
	i64 2019660174692588140, ; 44: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 20
	i64 2040001226662520565, ; 45: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 179
	i64 2102659300918482391, ; 46: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 128
	i64 2133195048986300728, ; 47: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 77
	i64 2262844636196693701, ; 48: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 93
	i64 2287834202362508563, ; 49: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 114
	i64 2302323944321350744, ; 50: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 24
	i64 2329709569556905518, ; 51: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 96
	i64 2335503487726329082, ; 52: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 175
	i64 2337758774805907496, ; 53: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 160
	i64 2445261912722553526, ; 54: Google.Cloud.Firestore.dll => 0x21ef50c10a9ebab6 => 45
	i64 2470498323731680442, ; 55: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 89
	i64 2497223385847772520, ; 56: System.Runtime => 0x22a7eb7046413568 => 168
	i64 2547086958574651984, ; 57: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 84
	i64 2602673633151553063, ; 58: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2632269733008246987, ; 59: System.Net.NameResolution => 0x2487b36034f808cb => 140
	i64 2656907746661064104, ; 60: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 64
	i64 2662981627730767622, ; 61: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2706075432581334785, ; 62: System.Net.WebSockets => 0x258de944be6c0701 => 149
	i64 2783046991838674048, ; 63: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 160
	i64 2812926542227278819, ; 64: Google.Apis.Core.dll => 0x270985c960b98be3 => 44
	i64 2895129759130297543, ; 65: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 3017704767998173186, ; 66: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 109
	i64 3289520064315143713, ; 67: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 95
	i64 3311221304742556517, ; 68: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 150
	i64 3325875462027654285, ; 69: System.Runtime.Numerics => 0x2e27e21c8958b48d => 165
	i64 3328853167529574890, ; 70: System.Net.Sockets.dll => 0x2e327651a008c1ea => 146
	i64 3344514922410554693, ; 71: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 111
	i64 3429672777697402584, ; 72: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 74
	i64 3430216265859992823, ; 73: Grpc.Auth.dll => 0x2f9a93850d5a0cf7 => 50
	i64 3494946837667399002, ; 74: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 62
	i64 3522470458906976663, ; 75: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 106
	i64 3551103847008531295, ; 76: System.Private.CoreLib.dll => 0x31480e226177735f => 187
	i64 3567343442040498961, ; 77: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 78: System.Runtime.dll => 0x319037675df7e556 => 168
	i64 3638003163729360188, ; 79: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 63
	i64 3647754201059316852, ; 80: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 183
	i64 3655542548057982301, ; 81: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 62
	i64 3716579019761409177, ; 82: netstandard.dll => 0x3393f0ed5c8c5c99 => 186
	i64 3727469159507183293, ; 83: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 104
	i64 3783726507060260521, ; 84: Microsoft.AspNetCore.SignalR.Common.dll => 0x34827f360c8e6ea9 => 59
	i64 3869221888984012293, ; 85: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 67
	i64 3890352374528606784, ; 86: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 72
	i64 3893087497687830326, ; 87: Google.Cloud.Firestore.V1.dll => 0x36070673e3328f36 => 46
	i64 3933965368022646939, ; 88: System.Net.Requests => 0x369840a8bfadc09b => 143
	i64 3966267475168208030, ; 89: System.Memory => 0x370b03412596249e => 137
	i64 4009997192427317104, ; 90: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 167
	i64 4056584864658557221, ; 91: Google.Apis.Auth => 0x384be27113330925 => 43
	i64 4073500526318903918, ; 92: System.Private.Xml.dll => 0x3887fb25779ae26e => 154
	i64 4120493066591692148, ; 93: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4154383907710350974, ; 94: System.ComponentModel => 0x39a7562737acb67e => 121
	i64 4168469861834746866, ; 95: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 169
	i64 4187479170553454871, ; 96: System.Linq.Expressions => 0x3a1cea1e912fa117 => 134
	i64 4205801962323029395, ; 97: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 120
	i64 4356591372459378815, ; 98: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 30
	i64 4373617458794931033, ; 99: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 133
	i64 4679594760078841447, ; 100: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 0
	i64 4794310189461587505, ; 101: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 84
	i64 4795410492532947900, ; 102: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 106
	i64 4809057822547766521, ; 103: System.Drawing => 0x42bd349c3145ecf9 => 129
	i64 4814660307502931973, ; 104: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 140
	i64 4853321196694829351, ; 105: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 164
	i64 4944657942950711514, ; 106: WorkerUnity => 0x449ef433816410da => 112
	i64 5098983611934048327, ; 107: Google.Cloud.Location => 0x46c33a9458de0047 => 47
	i64 5103417709280584325, ; 108: System.Collections.Specialized => 0x46d2fb5e161b6285 => 117
	i64 5182934613077526976, ; 109: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 117
	i64 5290786973231294105, ; 110: System.Runtime.Loader => 0x496ca6b869b72699 => 164
	i64 5423376490970181369, ; 111: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 162
	i64 5446034149219586269, ; 112: System.Diagnostics.Debug => 0x4b94333452e150dd => 124
	i64 5471532531798518949, ; 113: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5522859530602327440, ; 114: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5570799893513421663, ; 115: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 131
	i64 5573260873512690141, ; 116: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 173
	i64 5650097808083101034, ; 117: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 170
	i64 5665389054145784248, ; 118: Google.Apis.Core => 0x4e9f815406bee9b8 => 44
	i64 5692067934154308417, ; 119: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 108
	i64 5979151488806146654, ; 120: System.Formats.Asn1 => 0x52fa3699a489d25e => 130
	i64 5984759512290286505, ; 121: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 171
	i64 6014447449592687183, ; 122: Microsoft.AspNetCore.Http.Connections.Common.dll => 0x53779c16e939ea4f => 56
	i64 6034224070161570862, ; 123: Microsoft.AspNetCore.SignalR.Client.dll => 0x53bdded235179c2e => 57
	i64 6068057819846744445, ; 124: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 23
	i64 6200764641006662125, ; 125: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6222399776351216807, ; 126: System.Text.Json.dll => 0x565a67a0ffe264a7 => 176
	i64 6284145129771520194, ; 127: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 155
	i64 6357457916754632952, ; 128: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 129: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 96
	i64 6478287442656530074, ; 130: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6548213210057960872, ; 131: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 92
	i64 6560151584539558821, ; 132: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 69
	i64 6743165466166707109, ; 133: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6777482997383978746, ; 134: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 22
	i64 6783125919820072783, ; 135: Microsoft.AspNetCore.Connections.Abstractions => 0x5e228115e59ec74f => 54
	i64 6786606130239981554, ; 136: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 127
	i64 6814185388980153342, ; 137: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 184
	i64 6876862101832370452, ; 138: System.Xml.Linq => 0x5f6f85a57d108914 => 182
	i64 6894844156784520562, ; 139: System.Numerics.Vectors => 0x5faf683aead1ad72 => 150
	i64 6934772601320367100, ; 140: Google.Api.Gax.Rest => 0x603d42f05bcfe3fc => 41
	i64 6987056692196838363, ; 141: System.Management => 0x60f7030ae3e88bdb => 83
	i64 7017588408768804231, ; 142: Microsoft.AspNetCore.SignalR.Protocols.Json => 0x61637b7a1c903587 => 60
	i64 7083547580668757502, ; 143: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 153
	i64 7220009545223068405, ; 144: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 26
	i64 7243049202045766964, ; 145: MongoDB.Bson.dll => 0x64847adfba9d4d34 => 76
	i64 7270811800166795866, ; 146: System.Linq => 0x64e71ccf51a90a5a => 136
	i64 7338192458477945005, ; 147: System.Reflection => 0x65d67f295d0740ad => 159
	i64 7377312882064240630, ; 148: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 120
	i64 7488575175965059935, ; 149: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 182
	i64 7489048572193775167, ; 150: System.ObjectModel => 0x67ee71ff6b419e3f => 151
	i64 7592577537120840276, ; 151: System.Diagnostics.Process => 0x695e410af5b2aa54 => 126
	i64 7621211152690795761, ; 152: Google.LongRunning.dll => 0x69c3fb2a1a6154f1 => 48
	i64 7654504624184590948, ; 153: System.Net.Http => 0x6a3a4366801b8264 => 138
	i64 7708790323521193081, ; 154: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 17
	i64 7714652370974252055, ; 155: System.Private.CoreLib => 0x6b0ff375198b9c17 => 187
	i64 7735176074855944702, ; 156: Microsoft.CSharp => 0x6b58dda848e391fe => 113
	i64 7735352534559001595, ; 157: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 110
	i64 7740912860115050295, ; 158: Google.Api.CommonProtos => 0x6b6d3f3bb0691f37 => 38
	i64 7836164640616011524, ; 159: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 86
	i64 7843473411302439824, ; 160: Google.LongRunning => 0x6cd99d82d5e73b90 => 48
	i64 8064050204834738623, ; 161: System.Collections.dll => 0x6fe942efa61731bf => 118
	i64 8083354569033831015, ; 162: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 95
	i64 8087206902342787202, ; 163: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 125
	i64 8113615946733131500, ; 164: System.Reflection.Extensions => 0x70995ab73cf916ec => 157
	i64 8167236081217502503, ; 165: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 188
	i64 8185542183669246576, ; 166: System.Collections => 0x7198e33f4794aa70 => 118
	i64 8243855692487634729, ; 167: Microsoft.AspNetCore.SignalR.Protocols.Json.dll => 0x72680f13124eaf29 => 60
	i64 8246048515196606205, ; 168: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 75
	i64 8264926008854159966, ; 169: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 126
	i64 8290740647658429042, ; 170: System.Runtime.Extensions => 0x730ea0b15c929a72 => 161
	i64 8293702073711834350, ; 171: System.Linq.Async => 0x731926181883b4ee => 82
	i64 8308610922448049511, ; 172: MongoDB.Bson => 0x734e1d9cf1725567 => 76
	i64 8368701292315763008, ; 173: System.Security.Cryptography => 0x7423997c6fd56140 => 173
	i64 8400357532724379117, ; 174: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 103
	i64 8410671156615598628, ; 175: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 156
	i64 8518412311883997971, ; 176: System.Collections.Immutable => 0x76377add7c28e313 => 115
	i64 8563666267364444763, ; 177: System.Private.Uri => 0x76d841191140ca5b => 152
	i64 8599632406834268464, ; 178: CommunityToolkit.Maui => 0x7758081c784b4930 => 35
	i64 8614108721271900878, ; 179: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 21
	i64 8626175481042262068, ; 180: Java.Interop => 0x77b654e585b55834 => 188
	i64 8638972117149407195, ; 181: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 113
	i64 8639588376636138208, ; 182: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 102
	i64 8677882282824630478, ; 183: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8685687024490312494, ; 184: Google.Api.Gax.Grpc => 0x7889c2547cf6f32e => 40
	i64 8725526185868997716, ; 185: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 125
	i64 8856627112618224845, ; 186: Remotion.Linq => 0x7ae90f6f3bb3eccd => 79
	i64 8941376889969657626, ; 187: System.Xml.XDocument => 0x7c1626e87187471a => 184
	i64 9045785047181495996, ; 188: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9312692141327339315, ; 189: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 108
	i64 9324707631942237306, ; 190: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 85
	i64 9404599086328396064, ; 191: Grpc.Net.Client.dll => 0x8283d90a93913920 => 52
	i64 9659729154652888475, ; 192: System.Text.RegularExpressions => 0x860e407c9991dd9b => 177
	i64 9678050649315576968, ; 193: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 89
	i64 9702891218465930390, ; 194: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 116
	i64 9808709177481450983, ; 195: Mono.Android.dll => 0x881f890734e555e7 => 190
	i64 9933555792566666578, ; 196: System.Linq.Queryable.dll => 0x89db145cf475c552 => 135
	i64 9956195530459977388, ; 197: Microsoft.Maui => 0x8a2b8315b36616ac => 73
	i64 9959489431142554298, ; 198: System.CodeDom => 0x8a3736deb7825aba => 80
	i64 9991543690424095600, ; 199: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 6
	i64 9999989524333793374, ; 200: Realm => 0x8ac7197d7b8b105e => 78
	i64 10038780035334861115, ; 201: System.Net.Http.dll => 0x8b50e941206af13b => 138
	i64 10051358222726253779, ; 202: System.Private.Xml => 0x8b7d990c97ccccd3 => 154
	i64 10051920404523413229, ; 203: Grpc.Net.Common => 0x8b7f9859be1e6eed => 53
	i64 10078727084704864206, ; 204: System.Net.WebSockets.Client => 0x8bded4e257f117ce => 148
	i64 10092835686693276772, ; 205: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 71
	i64 10143853363526200146, ; 206: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10220684565739810458, ; 207: FirebaseAdmin => 0x8dd72a76063d2e9a => 37
	i64 10226498071391929720, ; 208: Microsoft.Extensions.Features => 0x8debd1d049888578 => 66
	i64 10229024438826829339, ; 209: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 92
	i64 10236703004850800690, ; 210: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 145
	i64 10245369515835430794, ; 211: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 156
	i64 10282208442277544177, ; 212: Google.Cloud.Firestore.V1 => 0x8eb1be19cc79c0f1 => 46
	i64 10364469296367737616, ; 213: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 155
	i64 10406448008575299332, ; 214: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 111
	i64 10430153318873392755, ; 215: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 90
	i64 10447083246144586668, ; 216: Microsoft.Bcl.AsyncInterfaces.dll => 0x90fb7edc816203ac => 61
	i64 10506226065143327199, ; 217: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10714184849103829812, ; 218: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 161
	i64 10734501660890305105, ; 219: Realm.dll => 0x94f89c6302351251 => 78
	i64 10785150219063592792, ; 220: System.Net.Primitives => 0x95ac8cfb68830758 => 142
	i64 10822644899632537592, ; 221: System.Linq.Queryable => 0x9631c23204ca5ff8 => 135
	i64 10823124638835005028, ; 222: Google.Api.Gax.dll => 0x963376840189d664 => 39
	i64 10843244350976052224, ; 223: Remotion.Linq.dll => 0x967af14988b04c00 => 79
	i64 10854473764158213966, ; 224: Grpc.Core.Api.dll => 0x96a2d66108728f4e => 51
	i64 10880838204485145808, ; 225: CommunityToolkit.Maui.dll => 0x970080b2a4d614d0 => 35
	i64 10953751836886437922, ; 226: System.Linq.Async.dll => 0x98038b429b661022 => 82
	i64 11002576679268595294, ; 227: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 68
	i64 11009005086950030778, ; 228: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 73
	i64 11103970607964515343, ; 229: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11162124722117608902, ; 230: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 107
	i64 11220793807500858938, ; 231: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 232: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 69
	i64 11326322297822330275, ; 233: Google.Cloud.Firestore => 0x9d2f2e1ed5493da3 => 45
	i64 11340910727871153756, ; 234: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 91
	i64 11435314654401632883, ; 235: Grpc.Core.Api => 0x9eb266175e6d9a73 => 51
	i64 11441445377436144712, ; 236: Grpc.Net.Common.dll => 0x9ec82df38f1dd448 => 53
	i64 11485890710487134646, ; 237: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 163
	i64 11513602507638267977, ; 238: System.IO.Pipelines.dll => 0x9fc8887aa0d36049 => 81
	i64 11518296021396496455, ; 239: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 240: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 107
	i64 11530571088791430846, ; 241: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 67
	i64 11543207250219725293, ; 242: Grpc.Net.Client => 0xa031b5d5e60f71ed => 52
	i64 11597940890313164233, ; 243: netstandard => 0xa0f429ca8d1805c9 => 186
	i64 11705530742807338875, ; 244: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 9
	i64 12040886584167504988, ; 245: System.Net.ServicePoint => 0xa719d28d8e121c5c => 145
	i64 12123043025855404482, ; 246: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 157
	i64 12145679461940342714, ; 247: System.Text.Json => 0xa88e1f1ebcb62fba => 176
	i64 12201331334810686224, ; 248: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 167
	i64 12269460666702402136, ; 249: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 115
	i64 12313367145828839434, ; 250: System.IO.Pipelines => 0xaae1de2e1c17f00a => 81
	i64 12341818387765915815, ; 251: CommunityToolkit.Maui.Core.dll => 0xab46f26f152bf0a7 => 36
	i64 12437742355241350664, ; 252: Google.Apis.dll => 0xac9bbcc62bfdb608 => 42
	i64 12451044538927396471, ; 253: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 94
	i64 12466513435562512481, ; 254: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 99
	i64 12475113361194491050, ; 255: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12517810545449516888, ; 256: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 127
	i64 12538491095302438457, ; 257: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 87
	i64 12550732019250633519, ; 258: System.IO.Compression => 0xae2d28465e8e1b2f => 132
	i64 12681088699309157496, ; 259: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 14
	i64 12700543734426720211, ; 260: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 88
	i64 12708922737231849740, ; 261: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 174
	i64 12722065664929968482, ; 262: Google.Api.Gax.Rest.dll => 0xb08ddb515f583162 => 41
	i64 12823819093633476069, ; 263: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 27
	i64 12835242264250840079, ; 264: System.IO.Pipes => 0xb21ff0d5d6c0740f => 133
	i64 12843321153144804894, ; 265: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 70
	i64 12859557719246324186, ; 266: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 147
	i64 12958614573187252691, ; 267: Google.Apis => 0xb3d63f4bf006c1d3 => 42
	i64 13068258254871114833, ; 268: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 166
	i64 13221551921002590604, ; 269: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 1
	i64 13222659110913276082, ; 270: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 15
	i64 13295219713260136977, ; 271: Microsoft.AspNetCore.Http.Connections.Client => 0xb8821be35ba42a11 => 55
	i64 13343850469010654401, ; 272: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 189
	i64 13381594904270902445, ; 273: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13428779960367410341, ; 274: Microsoft.AspNetCore.SignalR.Client.Core.dll => 0xba5c9c39a8956ca5 => 58
	i64 13465488254036897740, ; 275: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 110
	i64 13467053111158216594, ; 276: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 29
	i64 13540124433173649601, ; 277: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13545416393490209236, ; 278: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 13
	i64 13572454107664307259, ; 279: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 104
	i64 13717397318615465333, ; 280: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 119
	i64 13755568601956062840, ; 281: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 8
	i64 13782512541859110153, ; 282: Google.Apis.Auth.dll => 0xbf45522249e0dd09 => 43
	i64 13814445057219246765, ; 283: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 11
	i64 13881769479078963060, ; 284: System.Console.dll => 0xc0a5f3cade5c6774 => 122
	i64 13959074834287824816, ; 285: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 94
	i64 14100563506285742564, ; 286: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 3
	i64 14124974489674258913, ; 287: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 87
	i64 14125464355221830302, ; 288: System.Threading.dll => 0xc407bafdbc707a9e => 181
	i64 14254574811015963973, ; 289: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 174
	i64 14327695147300244862, ; 290: System.Reflection.dll => 0xc6d632d338eb4d7e => 159
	i64 14327709162229390963, ; 291: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 172
	i64 14461014870687870182, ; 292: System.Net.Requests.dll => 0xc8afd8683afdece6 => 143
	i64 14464374589798375073, ; 293: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14522721392235705434, ; 294: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 5
	i64 14551742072151931844, ; 295: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 175
	i64 14556034074661724008, ; 296: CommunityToolkit.Maui.Core => 0xca016bdea6b19f68 => 36
	i64 14561513370130550166, ; 297: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 171
	i64 14604329626201521481, ; 298: Microsoft.AspNetCore.SignalR.Client => 0xcaad006b00747d49 => 57
	i64 14622043554576106986, ; 299: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 166
	i64 14650706219563630045, ; 300: Grpc.Auth => 0xcb51c3af15b23ddd => 50
	i64 14669215534098758659, ; 301: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 64
	i64 14705122255218365489, ; 302: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14744092281598614090, ; 303: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14809184851036126845, ; 304: Microsoft.AspNetCore.SignalR.Client.Core => 0xcd84cb28db1abe7d => 58
	i64 14832630590065248058, ; 305: System.Security.Claims => 0xcdd816ef5d6e873a => 169
	i64 14852515768018889994, ; 306: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 91
	i64 14892012299694389861, ; 307: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 33
	i64 14904040806490515477, ; 308: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14954917835170835695, ; 309: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 65
	i64 14984936317414011727, ; 310: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 147
	i64 14987728460634540364, ; 311: System.IO.Compression.dll => 0xcfff1ba06622494c => 132
	i64 15015154896917945444, ; 312: System.Net.Security.dll => 0xd0608bd33642dc64 => 144
	i64 15076659072870671916, ; 313: System.ObjectModel.dll => 0xd13b0d8c1620662c => 151
	i64 15097078878581906526, ; 314: Google.Api.Gax.Grpc.dll => 0xd183994097ed5c5e => 40
	i64 15111608613780139878, ; 315: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 316: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 131
	i64 15133485256822086103, ; 317: System.Linq.dll => 0xd204f0a9127dd9d7 => 136
	i64 15226617129428527123, ; 318: WorkerUnity.dll => 0xd34fcf9aea772813 => 112
	i64 15227001540531775957, ; 319: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 63
	i64 15370334346939861994, ; 320: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 90
	i64 15391712275433856905, ; 321: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 65
	i64 15527772828719725935, ; 322: System.Console => 0xd77dbb1e38cd3d6f => 122
	i64 15530465045505749832, ; 323: System.Net.HttpListener.dll => 0xd7874bacc9fdb348 => 139
	i64 15536481058354060254, ; 324: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15541854775306130054, ; 325: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 172
	i64 15557562860424774966, ; 326: System.Net.Sockets => 0xd7e790fe7a6dc536 => 146
	i64 15582737692548360875, ; 327: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 98
	i64 15609085926864131306, ; 328: System.dll => 0xd89e9cf3334914ea => 185
	i64 15661133872274321916, ; 329: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 183
	i64 15664356999916475676, ; 330: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 4
	i64 15743187114543869802, ; 331: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 12
	i64 15783653065526199428, ; 332: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 15847085070278954535, ; 333: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 178
	i64 15963349826457351533, ; 334: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 179
	i64 16018552496348375205, ; 335: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 141
	i64 16154507427712707110, ; 336: System => 0xe03056ea4e39aa26 => 185
	i64 16156430004425724367, ; 337: Microsoft.AspNetCore.Http.Connections.Client.dll => 0xe0372b7d144211cf => 55
	i64 16219561732052121626, ; 338: System.Net.Security => 0xe1177575db7c781a => 144
	i64 16288847719894691167, ; 339: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 340: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 68
	i64 16343918515847859304, ; 341: Microsoft.Extensions.Features.dll => 0xe2d1434bdf0a8c68 => 66
	i64 16454459195343277943, ; 342: System.Net.NetworkInformation => 0xe459fb756d988f77 => 141
	i64 16605226748660468415, ; 343: Microsoft.AspNetCore.SignalR.Common => 0xe6719dbfe8b8cabf => 59
	i64 16649148416072044166, ; 344: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 75
	i64 16677317093839702854, ; 345: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 103
	i64 16856067890322379635, ; 346: System.Data.Common.dll => 0xe9ecc87060889373 => 123
	i64 16890310621557459193, ; 347: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 177
	i64 16942731696432749159, ; 348: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16955525858597485057, ; 349: Google.Api.Gax => 0xeb4e20ef25a73a01 => 39
	i64 16991533501433402966, ; 350: Google.Api.CommonProtos.dll => 0xebce0db1ce165656 => 38
	i64 16998075588627545693, ; 351: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 101
	i64 17008137082415910100, ; 352: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 116
	i64 17031351772568316411, ; 353: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 100
	i64 17062143951396181894, ; 354: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 119
	i64 17089008752050867324, ; 355: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 32
	i64 17118171214553292978, ; 356: System.Threading.Channels => 0xed8ff6060fc420b2 => 178
	i64 17230721278011714856, ; 357: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 153
	i64 17260702271250283638, ; 358: System.Data.Common => 0xef8a5543bba6bc76 => 123
	i64 17338386382517543202, ; 359: System.Net.WebSockets.Client.dll => 0xf09e528d5c6da122 => 148
	i64 17342750010158924305, ; 360: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17438153253682247751, ; 361: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 25
	i64 17509662556995089465, ; 362: System.Net.WebSockets.dll => 0xf2fed1534ea67439 => 149
	i64 17514990004910432069, ; 363: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17553799493972570483, ; 364: Google.Protobuf.dll => 0xf39b9fa2c0aab173 => 49
	i64 17571845317586269034, ; 365: Microsoft.AspNetCore.Connections.Abstractions.dll => 0xf3dbbc377ad7336a => 54
	i64 17623389608345532001, ; 366: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17636563193350668017, ; 367: Microsoft.AspNetCore.Http.Connections.Common => 0xf4c1a8c826653ef1 => 56
	i64 17685921127322830888, ; 368: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 124
	i64 17702523067201099846, ; 369: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 31
	i64 17704177640604968747, ; 370: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 99
	i64 17710060891934109755, ; 371: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 97
	i64 17712670374920797664, ; 372: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 163
	i64 17743407583038752114, ; 373: System.CodeDom.dll => 0xf63d3f302bff4572 => 80
	i64 17777860260071588075, ; 374: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 165
	i64 18025913125965088385, ; 375: System.Threading => 0xfa28e87b91334681 => 181
	i64 18099568558057551825, ; 376: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 19
	i64 18121036031235206392, ; 377: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 100
	i64 18146411883821974900, ; 378: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 130
	i64 18245806341561545090, ; 379: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 114
	i64 18305135509493619199, ; 380: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 102
	i64 18324163916253801303 ; 381: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [382 x i32] [
	i32 47, ; 0
	i32 70, ; 1
	i32 190, ; 2
	i32 74, ; 3
	i32 134, ; 4
	i32 88, ; 5
	i32 105, ; 6
	i32 83, ; 7
	i32 7, ; 8
	i32 158, ; 9
	i32 37, ; 10
	i32 180, ; 11
	i32 121, ; 12
	i32 10, ; 13
	i32 93, ; 14
	i32 158, ; 15
	i32 109, ; 16
	i32 18, ; 17
	i32 129, ; 18
	i32 101, ; 19
	i32 142, ; 20
	i32 71, ; 21
	i32 139, ; 22
	i32 189, ; 23
	i32 180, ; 24
	i32 16, ; 25
	i32 86, ; 26
	i32 98, ; 27
	i32 77, ; 28
	i32 137, ; 29
	i32 152, ; 30
	i32 49, ; 31
	i32 85, ; 32
	i32 162, ; 33
	i32 6, ; 34
	i32 105, ; 35
	i32 61, ; 36
	i32 128, ; 37
	i32 28, ; 38
	i32 72, ; 39
	i32 28, ; 40
	i32 170, ; 41
	i32 97, ; 42
	i32 2, ; 43
	i32 20, ; 44
	i32 179, ; 45
	i32 128, ; 46
	i32 77, ; 47
	i32 93, ; 48
	i32 114, ; 49
	i32 24, ; 50
	i32 96, ; 51
	i32 175, ; 52
	i32 160, ; 53
	i32 45, ; 54
	i32 89, ; 55
	i32 168, ; 56
	i32 84, ; 57
	i32 27, ; 58
	i32 140, ; 59
	i32 64, ; 60
	i32 2, ; 61
	i32 149, ; 62
	i32 160, ; 63
	i32 44, ; 64
	i32 7, ; 65
	i32 109, ; 66
	i32 95, ; 67
	i32 150, ; 68
	i32 165, ; 69
	i32 146, ; 70
	i32 111, ; 71
	i32 74, ; 72
	i32 50, ; 73
	i32 62, ; 74
	i32 106, ; 75
	i32 187, ; 76
	i32 22, ; 77
	i32 168, ; 78
	i32 63, ; 79
	i32 183, ; 80
	i32 62, ; 81
	i32 186, ; 82
	i32 104, ; 83
	i32 59, ; 84
	i32 67, ; 85
	i32 72, ; 86
	i32 46, ; 87
	i32 143, ; 88
	i32 137, ; 89
	i32 167, ; 90
	i32 43, ; 91
	i32 154, ; 92
	i32 33, ; 93
	i32 121, ; 94
	i32 169, ; 95
	i32 134, ; 96
	i32 120, ; 97
	i32 30, ; 98
	i32 133, ; 99
	i32 0, ; 100
	i32 84, ; 101
	i32 106, ; 102
	i32 129, ; 103
	i32 140, ; 104
	i32 164, ; 105
	i32 112, ; 106
	i32 47, ; 107
	i32 117, ; 108
	i32 117, ; 109
	i32 164, ; 110
	i32 162, ; 111
	i32 124, ; 112
	i32 26, ; 113
	i32 29, ; 114
	i32 131, ; 115
	i32 173, ; 116
	i32 170, ; 117
	i32 44, ; 118
	i32 108, ; 119
	i32 130, ; 120
	i32 171, ; 121
	i32 56, ; 122
	i32 57, ; 123
	i32 23, ; 124
	i32 23, ; 125
	i32 176, ; 126
	i32 155, ; 127
	i32 34, ; 128
	i32 96, ; 129
	i32 11, ; 130
	i32 92, ; 131
	i32 69, ; 132
	i32 19, ; 133
	i32 22, ; 134
	i32 54, ; 135
	i32 127, ; 136
	i32 184, ; 137
	i32 182, ; 138
	i32 150, ; 139
	i32 41, ; 140
	i32 83, ; 141
	i32 60, ; 142
	i32 153, ; 143
	i32 26, ; 144
	i32 76, ; 145
	i32 136, ; 146
	i32 159, ; 147
	i32 120, ; 148
	i32 182, ; 149
	i32 151, ; 150
	i32 126, ; 151
	i32 48, ; 152
	i32 138, ; 153
	i32 17, ; 154
	i32 187, ; 155
	i32 113, ; 156
	i32 110, ; 157
	i32 38, ; 158
	i32 86, ; 159
	i32 48, ; 160
	i32 118, ; 161
	i32 95, ; 162
	i32 125, ; 163
	i32 157, ; 164
	i32 188, ; 165
	i32 118, ; 166
	i32 60, ; 167
	i32 75, ; 168
	i32 126, ; 169
	i32 161, ; 170
	i32 82, ; 171
	i32 76, ; 172
	i32 173, ; 173
	i32 103, ; 174
	i32 156, ; 175
	i32 115, ; 176
	i32 152, ; 177
	i32 35, ; 178
	i32 21, ; 179
	i32 188, ; 180
	i32 113, ; 181
	i32 102, ; 182
	i32 21, ; 183
	i32 40, ; 184
	i32 125, ; 185
	i32 79, ; 186
	i32 184, ; 187
	i32 31, ; 188
	i32 108, ; 189
	i32 85, ; 190
	i32 52, ; 191
	i32 177, ; 192
	i32 89, ; 193
	i32 116, ; 194
	i32 190, ; 195
	i32 135, ; 196
	i32 73, ; 197
	i32 80, ; 198
	i32 6, ; 199
	i32 78, ; 200
	i32 138, ; 201
	i32 154, ; 202
	i32 53, ; 203
	i32 148, ; 204
	i32 71, ; 205
	i32 3, ; 206
	i32 37, ; 207
	i32 66, ; 208
	i32 92, ; 209
	i32 145, ; 210
	i32 156, ; 211
	i32 46, ; 212
	i32 155, ; 213
	i32 111, ; 214
	i32 90, ; 215
	i32 61, ; 216
	i32 1, ; 217
	i32 161, ; 218
	i32 78, ; 219
	i32 142, ; 220
	i32 135, ; 221
	i32 39, ; 222
	i32 79, ; 223
	i32 51, ; 224
	i32 35, ; 225
	i32 82, ; 226
	i32 68, ; 227
	i32 73, ; 228
	i32 12, ; 229
	i32 107, ; 230
	i32 15, ; 231
	i32 69, ; 232
	i32 45, ; 233
	i32 91, ; 234
	i32 51, ; 235
	i32 53, ; 236
	i32 163, ; 237
	i32 81, ; 238
	i32 13, ; 239
	i32 107, ; 240
	i32 67, ; 241
	i32 52, ; 242
	i32 186, ; 243
	i32 9, ; 244
	i32 145, ; 245
	i32 157, ; 246
	i32 176, ; 247
	i32 167, ; 248
	i32 115, ; 249
	i32 81, ; 250
	i32 36, ; 251
	i32 42, ; 252
	i32 94, ; 253
	i32 99, ; 254
	i32 34, ; 255
	i32 127, ; 256
	i32 87, ; 257
	i32 132, ; 258
	i32 14, ; 259
	i32 88, ; 260
	i32 174, ; 261
	i32 41, ; 262
	i32 27, ; 263
	i32 133, ; 264
	i32 70, ; 265
	i32 147, ; 266
	i32 42, ; 267
	i32 166, ; 268
	i32 1, ; 269
	i32 15, ; 270
	i32 55, ; 271
	i32 189, ; 272
	i32 9, ; 273
	i32 58, ; 274
	i32 110, ; 275
	i32 29, ; 276
	i32 30, ; 277
	i32 13, ; 278
	i32 104, ; 279
	i32 119, ; 280
	i32 8, ; 281
	i32 43, ; 282
	i32 11, ; 283
	i32 122, ; 284
	i32 94, ; 285
	i32 3, ; 286
	i32 87, ; 287
	i32 181, ; 288
	i32 174, ; 289
	i32 159, ; 290
	i32 172, ; 291
	i32 143, ; 292
	i32 24, ; 293
	i32 5, ; 294
	i32 175, ; 295
	i32 36, ; 296
	i32 171, ; 297
	i32 57, ; 298
	i32 166, ; 299
	i32 50, ; 300
	i32 64, ; 301
	i32 16, ; 302
	i32 32, ; 303
	i32 58, ; 304
	i32 169, ; 305
	i32 91, ; 306
	i32 33, ; 307
	i32 0, ; 308
	i32 65, ; 309
	i32 147, ; 310
	i32 132, ; 311
	i32 144, ; 312
	i32 151, ; 313
	i32 40, ; 314
	i32 17, ; 315
	i32 131, ; 316
	i32 136, ; 317
	i32 112, ; 318
	i32 63, ; 319
	i32 90, ; 320
	i32 65, ; 321
	i32 122, ; 322
	i32 139, ; 323
	i32 4, ; 324
	i32 172, ; 325
	i32 146, ; 326
	i32 98, ; 327
	i32 185, ; 328
	i32 183, ; 329
	i32 4, ; 330
	i32 12, ; 331
	i32 5, ; 332
	i32 178, ; 333
	i32 179, ; 334
	i32 141, ; 335
	i32 185, ; 336
	i32 55, ; 337
	i32 144, ; 338
	i32 18, ; 339
	i32 68, ; 340
	i32 66, ; 341
	i32 141, ; 342
	i32 59, ; 343
	i32 75, ; 344
	i32 103, ; 345
	i32 123, ; 346
	i32 177, ; 347
	i32 25, ; 348
	i32 39, ; 349
	i32 38, ; 350
	i32 101, ; 351
	i32 116, ; 352
	i32 100, ; 353
	i32 119, ; 354
	i32 32, ; 355
	i32 178, ; 356
	i32 153, ; 357
	i32 123, ; 358
	i32 148, ; 359
	i32 10, ; 360
	i32 25, ; 361
	i32 149, ; 362
	i32 8, ; 363
	i32 49, ; 364
	i32 54, ; 365
	i32 20, ; 366
	i32 56, ; 367
	i32 124, ; 368
	i32 31, ; 369
	i32 99, ; 370
	i32 97, ; 371
	i32 163, ; 372
	i32 80, ; 373
	i32 165, ; 374
	i32 181, ; 375
	i32 19, ; 376
	i32 100, ; 377
	i32 130, ; 378
	i32 114, ; 379
	i32 102, ; 380
	i32 14 ; 381
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
