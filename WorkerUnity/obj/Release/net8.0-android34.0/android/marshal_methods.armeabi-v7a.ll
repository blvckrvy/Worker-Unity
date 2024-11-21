; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [191 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [382 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 141
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 140
	i32 39109920, ; 2: Newtonsoft.Json.dll => 0x254c520 => 77
	i32 39485524, ; 3: System.Net.WebSockets.dll => 0x25a8054 => 149
	i32 42639949, ; 4: System.Threading.Thread => 0x28aa24d => 180
	i32 67008169, ; 5: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 68219467, ; 6: System.Security.Cryptography.Primitives => 0x410f24b => 171
	i32 72070932, ; 7: Microsoft.Maui.Graphics.dll => 0x44bb714 => 75
	i32 117431740, ; 8: System.Runtime.InteropServices => 0x6ffddbc => 163
	i32 122350210, ; 9: System.Threading.Channels.dll => 0x74aea82 => 178
	i32 142721839, ; 10: System.Net.WebHeaderCollection => 0x881c32f => 147
	i32 149972175, ; 11: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 171
	i32 165246403, ; 12: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 88
	i32 182336117, ; 13: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 106
	i32 195452805, ; 14: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 15: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 16: System.ComponentModel => 0xc38ff48 => 121
	i32 220171995, ; 17: System.Diagnostics.Debug => 0xd1f8edb => 124
	i32 221063263, ; 18: Microsoft.AspNetCore.Http.Connections.Client => 0xd2d285f => 55
	i32 230752869, ; 19: Microsoft.CSharp.dll => 0xdc10265 => 113
	i32 246610117, ; 20: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 156
	i32 280992041, ; 21: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 22: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 23: Xamarin.AndroidX.Activity.dll => 0x13031348 => 84
	i32 336156722, ; 24: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 25: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 95
	i32 348048101, ; 26: Microsoft.AspNetCore.Http.Connections.Common.dll => 0x14becae5 => 56
	i32 356389973, ; 27: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 364956269, ; 28: Grpc.Net.Common => 0x15c0ca6d => 53
	i32 367780167, ; 29: System.IO.Pipes => 0x15ebe147 => 133
	i32 371306672, ; 30: Grpc.Core.Api.dll => 0x1621b0b0 => 51
	i32 375677976, ; 31: System.Net.ServicePoint.dll => 0x16646418 => 145
	i32 379916513, ; 32: System.Threading.Thread.dll => 0x16a510e1 => 180
	i32 385762202, ; 33: System.Memory.dll => 0x16fe439a => 137
	i32 391886110, ; 34: Grpc.Net.Client.dll => 0x175bb51e => 52
	i32 395744057, ; 35: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 36: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 37: System.Collections => 0x1a61054f => 118
	i32 450948140, ; 38: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 94
	i32 451504562, ; 39: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 172
	i32 458494020, ; 40: Microsoft.AspNetCore.SignalR.Common.dll => 0x1b541044 => 59
	i32 459347974, ; 41: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 167
	i32 469710990, ; 42: System.dll => 0x1bff388e => 185
	i32 498788369, ; 43: System.ObjectModel => 0x1dbae811 => 151
	i32 500358224, ; 44: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 45: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 46: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 70
	i32 530272170, ; 47: System.Linq.Queryable => 0x1f9b4faa => 135
	i32 539058512, ; 48: Microsoft.Extensions.Logging => 0x20216150 => 67
	i32 545304856, ; 49: System.Runtime.Extensions => 0x2080b118 => 161
	i32 548916678, ; 50: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 61
	i32 592146354, ; 51: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 597488923, ; 52: CommunityToolkit.Maui => 0x239cf51b => 35
	i32 613668793, ; 53: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 170
	i32 627609679, ; 54: Xamarin.AndroidX.CustomView => 0x2568904f => 92
	i32 627931235, ; 55: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 646990296, ; 56: Google.Cloud.Firestore.V1.dll => 0x269049d8 => 46
	i32 662205335, ; 57: System.Text.Encodings.Web.dll => 0x27787397 => 175
	i32 672442732, ; 58: System.Collections.Concurrent => 0x2814a96c => 114
	i32 683518922, ; 59: System.Net.Security => 0x28bdabca => 144
	i32 688181140, ; 60: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 690569205, ; 61: System.Xml.Linq.dll => 0x29293ff5 => 182
	i32 706645707, ; 62: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 63: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 64: System.Runtime.Loader.dll => 0x2b15ed29 => 164
	i32 759454413, ; 65: System.Net.Requests => 0x2d445acd => 143
	i32 762598435, ; 66: System.IO.Pipes.dll => 0x2d745423 => 133
	i32 775507847, ; 67: System.IO.Compression => 0x2e394f87 => 132
	i32 777317022, ; 68: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 69: Microsoft.Extensions.Options => 0x2f0980eb => 69
	i32 804715423, ; 70: System.Data.Common => 0x2ff6fb9f => 123
	i32 823281589, ; 71: System.Private.Uri.dll => 0x311247b5 => 152
	i32 830298997, ; 72: System.IO.Compression.Brotli => 0x317d5b75 => 131
	i32 832711436, ; 73: Microsoft.AspNetCore.SignalR.Protocols.Json.dll => 0x31a22b0c => 60
	i32 880660139, ; 74: Remotion.Linq => 0x347dceab => 79
	i32 904024072, ; 75: System.ComponentModel.Primitives.dll => 0x35e25008 => 119
	i32 926902833, ; 76: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 955402788, ; 77: Newtonsoft.Json => 0x38f24a24 => 77
	i32 967690846, ; 78: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 95
	i32 975874589, ; 79: System.Xml.XDocument => 0x3a2aaa1d => 184
	i32 992768348, ; 80: System.Collections.dll => 0x3b2c715c => 118
	i32 1012816738, ; 81: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 105
	i32 1019214401, ; 82: System.Drawing => 0x3cbffa41 => 129
	i32 1028951442, ; 83: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 65
	i32 1029334545, ; 84: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1034459858, ; 85: Remotion.Linq.dll => 0x3da89ad2 => 79
	i32 1035644815, ; 86: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 85
	i32 1036536393, ; 87: System.Drawing.Primitives.dll => 0x3dc84a49 => 128
	i32 1040379654, ; 88: WorkerUnity.dll => 0x3e02ef06 => 112
	i32 1044663988, ; 89: System.Linq.Expressions.dll => 0x3e444eb4 => 134
	i32 1049751285, ; 90: Google.Api.CommonProtos.dll => 0x3e91eef5 => 38
	i32 1052210849, ; 91: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 97
	i32 1058641855, ; 92: Microsoft.AspNetCore.Http.Connections.Common => 0x3f1997bf => 56
	i32 1082857460, ; 93: System.ComponentModel.TypeConverter => 0x408b17f4 => 120
	i32 1084122840, ; 94: Xamarin.Kotlin.StdLib => 0x409e66d8 => 110
	i32 1098259244, ; 95: System => 0x41761b2c => 185
	i32 1118262833, ; 96: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1145085672, ; 97: System.Linq.Async.dll => 0x44409ee8 => 82
	i32 1168523401, ; 98: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 99: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 102
	i32 1203173028, ; 100: Grpc.Net.Client => 0x47b6f6a4 => 52
	i32 1203215381, ; 101: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1208641965, ; 102: System.Diagnostics.Process => 0x480a69ad => 126
	i32 1233093933, ; 103: Microsoft.AspNetCore.SignalR.Client.Core.dll => 0x497f852d => 58
	i32 1234928153, ; 104: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1241264201, ; 105: Realm.dll => 0x49fc3049 => 78
	i32 1260983243, ; 106: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 107: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 93
	i32 1324164729, ; 108: System.Linq => 0x4eed2679 => 136
	i32 1373134921, ; 109: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 110: Xamarin.AndroidX.SavedState => 0x52114ed3 => 105
	i32 1391893274, ; 111: MongoDB.Bson.dll => 0x52f69b1a => 76
	i32 1406073936, ; 112: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 89
	i32 1408764838, ; 113: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 166
	i32 1411638395, ; 114: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 160
	i32 1414043276, ; 115: Microsoft.AspNetCore.Connections.Abstractions.dll => 0x5448968c => 54
	i32 1430672901, ; 116: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1437713837, ; 117: Grpc.Auth => 0x55b1c5ad => 50
	i32 1452070440, ; 118: System.Formats.Asn1.dll => 0x568cd628 => 130
	i32 1457743152, ; 119: System.Runtime.Extensions.dll => 0x56e36530 => 161
	i32 1458022317, ; 120: System.Net.Security.dll => 0x56e7a7ad => 144
	i32 1461004990, ; 121: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 122: System.Collections.Immutable.dll => 0x5718a9ef => 115
	i32 1462112819, ; 123: System.IO.Compression.dll => 0x57261233 => 132
	i32 1469204771, ; 124: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 86
	i32 1470490898, ; 125: Microsoft.Extensions.Primitives => 0x57a5e912 => 70
	i32 1479771757, ; 126: System.Collections.Immutable => 0x5833866d => 115
	i32 1480492111, ; 127: System.IO.Compression.Brotli.dll => 0x583e844f => 131
	i32 1493001747, ; 128: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 129: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 130: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 177
	i32 1550322496, ; 131: System.Reflection.Extensions.dll => 0x5c680b40 => 157
	i32 1551623176, ; 132: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1618516317, ; 133: System.Net.WebSockets.Client.dll => 0x6078995d => 148
	i32 1622152042, ; 134: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 99
	i32 1624863272, ; 135: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 108
	i32 1634654947, ; 136: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 36
	i32 1636350590, ; 137: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 91
	i32 1639515021, ; 138: System.Net.Http.dll => 0x61b9038d => 138
	i32 1639986890, ; 139: System.Text.RegularExpressions => 0x61c036ca => 177
	i32 1657153582, ; 140: System.Runtime => 0x62c6282e => 168
	i32 1658251792, ; 141: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 109
	i32 1677501392, ; 142: System.Net.Primitives.dll => 0x63fca3d0 => 142
	i32 1678508291, ; 143: System.Net.WebSockets => 0x640c0103 => 149
	i32 1679769178, ; 144: System.Security.Cryptography => 0x641f3e5a => 173
	i32 1701541528, ; 145: System.Diagnostics.Debug.dll => 0x656b7698 => 124
	i32 1726116996, ; 146: System.Reflection.dll => 0x66e27484 => 159
	i32 1729485958, ; 147: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 87
	i32 1736233607, ; 148: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 149: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1746115085, ; 150: System.IO.Pipelines.dll => 0x68139a0d => 81
	i32 1763938596, ; 151: System.Diagnostics.TraceSource.dll => 0x69239124 => 127
	i32 1765942094, ; 152: System.Reflection.Extensions => 0x6942234e => 157
	i32 1766324549, ; 153: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 106
	i32 1770582343, ; 154: Microsoft.Extensions.Logging.dll => 0x6988f147 => 67
	i32 1780572499, ; 155: Mono.Android.Runtime.dll => 0x6a216153 => 189
	i32 1782161461, ; 156: Grpc.Core.Api => 0x6a39a035 => 51
	i32 1782862114, ; 157: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 158: Xamarin.AndroidX.Fragment => 0x6a96652d => 94
	i32 1793755602, ; 159: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1796167890, ; 160: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 61
	i32 1808609942, ; 161: Xamarin.AndroidX.Loader => 0x6bcd3296 => 99
	i32 1813058853, ; 162: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 110
	i32 1813201214, ; 163: Xamarin.Google.Android.Material => 0x6c13413e => 109
	i32 1818569960, ; 164: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 103
	i32 1824175904, ; 165: System.Text.Encoding.Extensions => 0x6cbab720 => 174
	i32 1824722060, ; 166: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 166
	i32 1828688058, ; 167: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 68
	i32 1842015223, ; 168: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 169: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 170: System.Linq.Expressions => 0x6ec71a65 => 134
	i32 1870277092, ; 171: System.Reflection.Primitives => 0x6f7a29e4 => 158
	i32 1875935024, ; 172: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1900519031, ; 173: Grpc.Auth.dll => 0x71479e77 => 50
	i32 1910275211, ; 174: System.Collections.NonGeneric.dll => 0x71dc7c8b => 116
	i32 1927897671, ; 175: System.CodeDom.dll => 0x72e96247 => 80
	i32 1939592360, ; 176: System.Private.Xml.Linq => 0x739bd4a8 => 153
	i32 1945717188, ; 177: Microsoft.AspNetCore.SignalR.Client.Core => 0x73f949c4 => 58
	i32 1967334205, ; 178: Microsoft.AspNetCore.SignalR.Common => 0x7543233d => 59
	i32 1968388702, ; 179: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 62
	i32 2003115576, ; 180: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 181: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 97
	i32 2025202353, ; 182: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 183: System.Private.Xml => 0x79eb68ee => 154
	i32 2055257422, ; 184: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 96
	i32 2066184531, ; 185: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 186: System.Diagnostics.TraceSource => 0x7b6f419e => 127
	i32 2079903147, ; 187: System.Runtime.dll => 0x7bf8cdab => 168
	i32 2090596640, ; 188: System.Numerics.Vectors => 0x7c9bf920 => 150
	i32 2127167465, ; 189: System.Console => 0x7ec9ffe9 => 122
	i32 2142473426, ; 190: System.Collections.Specialized => 0x7fb38cd2 => 117
	i32 2159891885, ; 191: Microsoft.Maui => 0x80bd55ad => 73
	i32 2169148018, ; 192: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2178612968, ; 193: System.CodeDom => 0x81dafee8 => 80
	i32 2181898931, ; 194: Microsoft.Extensions.Options.dll => 0x820d22b3 => 69
	i32 2192057212, ; 195: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 68
	i32 2193016926, ; 196: System.ObjectModel.dll => 0x82b6c85e => 151
	i32 2201107256, ; 197: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 111
	i32 2201231467, ; 198: System.Net.Http => 0x8334206b => 138
	i32 2207618523, ; 199: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2229158877, ; 200: Microsoft.Extensions.Features.dll => 0x84de43dd => 66
	i32 2266799131, ; 201: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 63
	i32 2270573516, ; 202: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 203: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 104
	i32 2295906218, ; 204: System.Net.Sockets => 0x88d8bfaa => 146
	i32 2303942373, ; 205: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 206: System.Private.CoreLib.dll => 0x896b7878 => 187
	i32 2319144366, ; 207: Microsoft.AspNetCore.SignalR.Client => 0x8a3b55ae => 57
	i32 2340441535, ; 208: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 162
	i32 2353062107, ; 209: System.Net.Primitives => 0x8c40e0db => 142
	i32 2368005991, ; 210: System.Xml.ReaderWriter.dll => 0x8d24e767 => 183
	i32 2371007202, ; 211: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 62
	i32 2395872292, ; 212: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2397347608, ; 213: Google.LongRunning.dll => 0x8ee49f18 => 48
	i32 2427813419, ; 214: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 215: System.Console.dll => 0x912896e5 => 122
	i32 2441199521, ; 216: Google.Cloud.Firestore => 0x9181bfa1 => 45
	i32 2458678730, ; 217: System.Net.Sockets.dll => 0x928c75ca => 146
	i32 2471841756, ; 218: netstandard.dll => 0x93554fdc => 186
	i32 2475788418, ; 219: Java.Interop.dll => 0x93918882 => 188
	i32 2480646305, ; 220: Microsoft.Maui.Controls => 0x93dba8a1 => 71
	i32 2484371297, ; 221: System.Net.ServicePoint => 0x94147f61 => 145
	i32 2486847491, ; 222: Google.Api.Gax => 0x943a4803 => 39
	i32 2538310050, ; 223: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 156
	i32 2550873716, ; 224: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2562349572, ; 225: Microsoft.CSharp => 0x98ba5a04 => 113
	i32 2570120770, ; 226: System.Text.Encodings.Web => 0x9930ee42 => 175
	i32 2585220780, ; 227: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 174
	i32 2593496499, ; 228: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2595928349, ; 229: FirebaseAdmin => 0x9abab91d => 37
	i32 2605712449, ; 230: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 111
	i32 2617129537, ; 231: System.Private.Xml.dll => 0x9bfe3a41 => 154
	i32 2620871830, ; 232: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 91
	i32 2626831493, ; 233: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2629053246, ; 234: Google.Api.Gax.Rest => 0x9cb42b3e => 41
	i32 2635732976, ; 235: Google.Cloud.Firestore.dll => 0x9d1a17f0 => 45
	i32 2637500010, ; 236: Microsoft.Extensions.Features => 0x9d350e6a => 66
	i32 2663698177, ; 237: System.Runtime.Loader => 0x9ec4cf01 => 164
	i32 2664396074, ; 238: System.Xml.XDocument.dll => 0x9ecf752a => 184
	i32 2665622720, ; 239: System.Drawing.Primitives => 0x9ee22cc0 => 128
	i32 2676780864, ; 240: System.Data.Common.dll => 0x9f8c6f40 => 123
	i32 2717744543, ; 241: System.Security.Claims => 0xa1fd7d9f => 169
	i32 2724373263, ; 242: System.Runtime.Numerics.dll => 0xa262a30f => 165
	i32 2732626843, ; 243: Xamarin.AndroidX.Activity => 0xa2e0939b => 84
	i32 2735172069, ; 244: System.Threading.Channels => 0xa30769e5 => 178
	i32 2737747696, ; 245: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 86
	i32 2744327253, ; 246: Google.Api.Gax.Grpc.dll => 0xa3931c55 => 40
	i32 2752995522, ; 247: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2757554483, ; 248: Google.Api.Gax.Grpc => 0xa45cf133 => 40
	i32 2758225723, ; 249: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 72
	i32 2764765095, ; 250: Microsoft.Maui.dll => 0xa4caf7a7 => 73
	i32 2778768386, ; 251: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 107
	i32 2785988530, ; 252: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 253: Microsoft.Maui.Graphics => 0xa7008e0b => 75
	i32 2806116107, ; 254: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 255: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 89
	i32 2818335264, ; 256: System.Linq.Async => 0xa7fc6220 => 82
	i32 2831556043, ; 257: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2839679515, ; 258: Google.LongRunning => 0xa942121b => 48
	i32 2853208004, ; 259: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 107
	i32 2858567058, ; 260: WorkerUnity => 0xaa624592 => 112
	i32 2860834411, ; 261: Realm => 0xaa84de6b => 78
	i32 2861189240, ; 262: Microsoft.Maui.Essentials => 0xaa8a4878 => 74
	i32 2868488919, ; 263: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 36
	i32 2875347124, ; 264: Microsoft.AspNetCore.Http.Connections.Client.dll => 0xab6250b4 => 55
	i32 2893550578, ; 265: Google.Apis.Core => 0xac7813f2 => 44
	i32 2898407901, ; 266: System.Management => 0xacc231dd => 83
	i32 2901442782, ; 267: System.Reflection => 0xacf080de => 159
	i32 2909740682, ; 268: System.Private.CoreLib => 0xad6f1e8a => 187
	i32 2912646636, ; 269: Google.Api.CommonProtos => 0xad9b75ec => 38
	i32 2916838712, ; 270: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 108
	i32 2919462931, ; 271: System.Numerics.Vectors.dll => 0xae037813 => 150
	i32 2959614098, ; 272: System.ComponentModel.dll => 0xb0682092 => 121
	i32 2972252294, ; 273: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 170
	i32 2978675010, ; 274: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 93
	i32 2990604888, ; 275: Google.Apis => 0xb2410258 => 42
	i32 3038032645, ; 276: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 277: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 100
	i32 3059408633, ; 278: Mono.Android.Runtime => 0xb65adef9 => 189
	i32 3059793426, ; 279: System.ComponentModel.Primitives => 0xb660be12 => 119
	i32 3077302341, ; 280: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3090735792, ; 281: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 172
	i32 3099732863, ; 282: System.Security.Claims.dll => 0xb8c22b7f => 169
	i32 3103600923, ; 283: System.Formats.Asn1 => 0xb8fd311b => 130
	i32 3106263381, ; 284: Grpc.Net.Common.dll => 0xb925d155 => 53
	i32 3124832203, ; 285: System.Threading.Tasks.Extensions => 0xba4127cb => 179
	i32 3159123045, ; 286: System.Reflection.Primitives.dll => 0xbc4c6465 => 158
	i32 3178803400, ; 287: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 101
	i32 3203277885, ; 288: Google.Api.Gax.dll => 0xbeee243d => 39
	i32 3220365878, ; 289: System.Threading => 0xbff2e236 => 181
	i32 3258312781, ; 290: Xamarin.AndroidX.CardView => 0xc235e84d => 87
	i32 3258876633, ; 291: MongoDB.Bson => 0xc23e82d9 => 76
	i32 3265493905, ; 292: System.Linq.Queryable.dll => 0xc2a37b91 => 135
	i32 3265893370, ; 293: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 179
	i32 3305363605, ; 294: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 295: System.Net.Requests.dll => 0xc5b097e4 => 143
	i32 3317135071, ; 296: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 92
	i32 3346324047, ; 297: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 102
	i32 3357674450, ; 298: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 299: System.Text.Json => 0xc82afec1 => 176
	i32 3362522851, ; 300: Xamarin.AndroidX.Core => 0xc86c06e3 => 90
	i32 3366347497, ; 301: Java.Interop => 0xc8a662e9 => 188
	i32 3374999561, ; 302: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 104
	i32 3381016424, ; 303: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3395150330, ; 304: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 160
	i32 3428513518, ; 305: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 64
	i32 3430777524, ; 306: netstandard => 0xcc7d82b4 => 186
	i32 3453592554, ; 307: Google.Apis.Core.dll => 0xcdd9a3ea => 44
	i32 3463511458, ; 308: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3466904072, ; 309: Microsoft.AspNetCore.SignalR.Client.dll => 0xcea4c208 => 57
	i32 3471940407, ; 310: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 120
	i32 3476120550, ; 311: Mono.Android => 0xcf3163e6 => 190
	i32 3479583265, ; 312: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 313: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 314: System.Text.Json.dll => 0xcfbaacae => 176
	i32 3499097210, ; 315: Google.Protobuf.dll => 0xd08ffc7a => 49
	i32 3509114376, ; 316: System.Xml.Linq => 0xd128d608 => 182
	i32 3539954161, ; 317: System.Net.HttpListener => 0xd2ff69f1 => 139
	i32 3580758918, ; 318: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3598063517, ; 319: Google.Cloud.Firestore.V1 => 0xd676179d => 46
	i32 3598340787, ; 320: System.Net.WebSockets.Client => 0xd67a52b3 => 148
	i32 3608519521, ; 321: System.Linq.dll => 0xd715a361 => 136
	i32 3612435020, ; 322: System.Management.dll => 0xd751624c => 83
	i32 3621458322, ; 323: Google.Api.Gax.Rest.dll => 0xd7db1192 => 41
	i32 3624195450, ; 324: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 162
	i32 3641597786, ; 325: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 96
	i32 3643446276, ; 326: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 327: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 101
	i32 3645630983, ; 328: Google.Protobuf => 0xd94bea07 => 49
	i32 3657292374, ; 329: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 63
	i32 3660523487, ; 330: System.Net.NetworkInformation => 0xda2f27df => 141
	i32 3672681054, ; 331: Mono.Android.dll => 0xdae8aa5e => 190
	i32 3691870036, ; 332: Microsoft.AspNetCore.SignalR.Protocols.Json => 0xdc0d7754 => 60
	i32 3697841164, ; 333: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 334: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 100
	i32 3732100267, ; 335: System.Net.NameResolution => 0xde7354ab => 140
	i32 3748608112, ; 336: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 125
	i32 3757995660, ; 337: Google.Cloud.Location.dll => 0xdffe768c => 47
	i32 3786282454, ; 338: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 88
	i32 3787005001, ; 339: Microsoft.AspNetCore.Connections.Abstractions => 0xe1b91c49 => 54
	i32 3792276235, ; 340: System.Collections.NonGeneric => 0xe2098b0b => 116
	i32 3793997468, ; 341: Google.Apis.Auth.dll => 0xe223ce9c => 43
	i32 3802395368, ; 342: System.Collections.Specialized.dll => 0xe2a3f2e8 => 117
	i32 3817368567, ; 343: CommunityToolkit.Maui.dll => 0xe3886bf7 => 35
	i32 3823082795, ; 344: System.Security.Cryptography.dll => 0xe3df9d2b => 173
	i32 3841636137, ; 345: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 65
	i32 3849253459, ; 346: System.Runtime.InteropServices.dll => 0xe56ef253 => 163
	i32 3870376305, ; 347: System.Net.HttpListener.dll => 0xe6b14171 => 139
	i32 3885497537, ; 348: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 147
	i32 3889960447, ; 349: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 350: System.Collections.Concurrent.dll => 0xe839deed => 114
	i32 3896760992, ; 351: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 90
	i32 3928044579, ; 352: System.Xml.ReaderWriter => 0xea213423 => 183
	i32 3931092270, ; 353: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 103
	i32 3955647286, ; 354: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 85
	i32 3980434154, ; 355: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 356: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4003436829, ; 357: System.Diagnostics.Process.dll => 0xee9f991d => 126
	i32 4023392905, ; 358: System.IO.Pipelines => 0xefd01a89 => 81
	i32 4025784931, ; 359: System.Memory => 0xeff49a63 => 137
	i32 4046471985, ; 360: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 72
	i32 4054681211, ; 361: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 155
	i32 4056144661, ; 362: Google.Cloud.Location => 0xf1c3db15 => 47
	i32 4059682726, ; 363: Google.Apis.dll => 0xf1f9d7a6 => 42
	i32 4068434129, ; 364: System.Private.Xml.Linq.dll => 0xf27f60d1 => 153
	i32 4073602200, ; 365: System.Threading.dll => 0xf2ce3c98 => 181
	i32 4082882467, ; 366: Google.Apis.Auth => 0xf35bd7a3 => 43
	i32 4094352644, ; 367: Microsoft.Maui.Essentials.dll => 0xf40add04 => 74
	i32 4099507663, ; 368: System.Drawing.dll => 0xf45985cf => 129
	i32 4100113165, ; 369: System.Private.Uri => 0xf462c30d => 152
	i32 4102112229, ; 370: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 371: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 372: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 64
	i32 4147896353, ; 373: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 155
	i32 4150914736, ; 374: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4177102269, ; 375: FirebaseAdmin.dll => 0xf8f985bd => 37
	i32 4181436372, ; 376: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 167
	i32 4182413190, ; 377: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 98
	i32 4213026141, ; 378: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 125
	i32 4271975918, ; 379: Microsoft.Maui.Controls.dll => 0xfea12dee => 71
	i32 4274976490, ; 380: System.Runtime.Numerics => 0xfecef6ea => 165
	i32 4292120959 ; 381: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 98
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [382 x i32] [
	i32 141, ; 0
	i32 140, ; 1
	i32 77, ; 2
	i32 149, ; 3
	i32 180, ; 4
	i32 33, ; 5
	i32 171, ; 6
	i32 75, ; 7
	i32 163, ; 8
	i32 178, ; 9
	i32 147, ; 10
	i32 171, ; 11
	i32 88, ; 12
	i32 106, ; 13
	i32 30, ; 14
	i32 31, ; 15
	i32 121, ; 16
	i32 124, ; 17
	i32 55, ; 18
	i32 113, ; 19
	i32 156, ; 20
	i32 2, ; 21
	i32 30, ; 22
	i32 84, ; 23
	i32 15, ; 24
	i32 95, ; 25
	i32 56, ; 26
	i32 14, ; 27
	i32 53, ; 28
	i32 133, ; 29
	i32 51, ; 30
	i32 145, ; 31
	i32 180, ; 32
	i32 137, ; 33
	i32 52, ; 34
	i32 34, ; 35
	i32 26, ; 36
	i32 118, ; 37
	i32 94, ; 38
	i32 172, ; 39
	i32 59, ; 40
	i32 167, ; 41
	i32 185, ; 42
	i32 151, ; 43
	i32 13, ; 44
	i32 7, ; 45
	i32 70, ; 46
	i32 135, ; 47
	i32 67, ; 48
	i32 161, ; 49
	i32 61, ; 50
	i32 21, ; 51
	i32 35, ; 52
	i32 170, ; 53
	i32 92, ; 54
	i32 19, ; 55
	i32 46, ; 56
	i32 175, ; 57
	i32 114, ; 58
	i32 144, ; 59
	i32 1, ; 60
	i32 182, ; 61
	i32 16, ; 62
	i32 4, ; 63
	i32 164, ; 64
	i32 143, ; 65
	i32 133, ; 66
	i32 132, ; 67
	i32 25, ; 68
	i32 69, ; 69
	i32 123, ; 70
	i32 152, ; 71
	i32 131, ; 72
	i32 60, ; 73
	i32 79, ; 74
	i32 119, ; 75
	i32 28, ; 76
	i32 77, ; 77
	i32 95, ; 78
	i32 184, ; 79
	i32 118, ; 80
	i32 105, ; 81
	i32 129, ; 82
	i32 65, ; 83
	i32 3, ; 84
	i32 79, ; 85
	i32 85, ; 86
	i32 128, ; 87
	i32 112, ; 88
	i32 134, ; 89
	i32 38, ; 90
	i32 97, ; 91
	i32 56, ; 92
	i32 120, ; 93
	i32 110, ; 94
	i32 185, ; 95
	i32 16, ; 96
	i32 82, ; 97
	i32 22, ; 98
	i32 102, ; 99
	i32 52, ; 100
	i32 20, ; 101
	i32 126, ; 102
	i32 58, ; 103
	i32 18, ; 104
	i32 78, ; 105
	i32 2, ; 106
	i32 93, ; 107
	i32 136, ; 108
	i32 32, ; 109
	i32 105, ; 110
	i32 76, ; 111
	i32 89, ; 112
	i32 166, ; 113
	i32 160, ; 114
	i32 54, ; 115
	i32 0, ; 116
	i32 50, ; 117
	i32 130, ; 118
	i32 161, ; 119
	i32 144, ; 120
	i32 6, ; 121
	i32 115, ; 122
	i32 132, ; 123
	i32 86, ; 124
	i32 70, ; 125
	i32 115, ; 126
	i32 131, ; 127
	i32 10, ; 128
	i32 5, ; 129
	i32 177, ; 130
	i32 157, ; 131
	i32 25, ; 132
	i32 148, ; 133
	i32 99, ; 134
	i32 108, ; 135
	i32 36, ; 136
	i32 91, ; 137
	i32 138, ; 138
	i32 177, ; 139
	i32 168, ; 140
	i32 109, ; 141
	i32 142, ; 142
	i32 149, ; 143
	i32 173, ; 144
	i32 124, ; 145
	i32 159, ; 146
	i32 87, ; 147
	i32 23, ; 148
	i32 1, ; 149
	i32 81, ; 150
	i32 127, ; 151
	i32 157, ; 152
	i32 106, ; 153
	i32 67, ; 154
	i32 189, ; 155
	i32 51, ; 156
	i32 17, ; 157
	i32 94, ; 158
	i32 9, ; 159
	i32 61, ; 160
	i32 99, ; 161
	i32 110, ; 162
	i32 109, ; 163
	i32 103, ; 164
	i32 174, ; 165
	i32 166, ; 166
	i32 68, ; 167
	i32 29, ; 168
	i32 26, ; 169
	i32 134, ; 170
	i32 158, ; 171
	i32 8, ; 172
	i32 50, ; 173
	i32 116, ; 174
	i32 80, ; 175
	i32 153, ; 176
	i32 58, ; 177
	i32 59, ; 178
	i32 62, ; 179
	i32 5, ; 180
	i32 97, ; 181
	i32 0, ; 182
	i32 154, ; 183
	i32 96, ; 184
	i32 4, ; 185
	i32 127, ; 186
	i32 168, ; 187
	i32 150, ; 188
	i32 122, ; 189
	i32 117, ; 190
	i32 73, ; 191
	i32 12, ; 192
	i32 80, ; 193
	i32 69, ; 194
	i32 68, ; 195
	i32 151, ; 196
	i32 111, ; 197
	i32 138, ; 198
	i32 14, ; 199
	i32 66, ; 200
	i32 63, ; 201
	i32 8, ; 202
	i32 104, ; 203
	i32 146, ; 204
	i32 18, ; 205
	i32 187, ; 206
	i32 57, ; 207
	i32 162, ; 208
	i32 142, ; 209
	i32 183, ; 210
	i32 62, ; 211
	i32 13, ; 212
	i32 48, ; 213
	i32 10, ; 214
	i32 122, ; 215
	i32 45, ; 216
	i32 146, ; 217
	i32 186, ; 218
	i32 188, ; 219
	i32 71, ; 220
	i32 145, ; 221
	i32 39, ; 222
	i32 156, ; 223
	i32 11, ; 224
	i32 113, ; 225
	i32 175, ; 226
	i32 174, ; 227
	i32 20, ; 228
	i32 37, ; 229
	i32 111, ; 230
	i32 154, ; 231
	i32 91, ; 232
	i32 15, ; 233
	i32 41, ; 234
	i32 45, ; 235
	i32 66, ; 236
	i32 164, ; 237
	i32 184, ; 238
	i32 128, ; 239
	i32 123, ; 240
	i32 169, ; 241
	i32 165, ; 242
	i32 84, ; 243
	i32 178, ; 244
	i32 86, ; 245
	i32 40, ; 246
	i32 21, ; 247
	i32 40, ; 248
	i32 72, ; 249
	i32 73, ; 250
	i32 107, ; 251
	i32 27, ; 252
	i32 75, ; 253
	i32 6, ; 254
	i32 89, ; 255
	i32 82, ; 256
	i32 19, ; 257
	i32 48, ; 258
	i32 107, ; 259
	i32 112, ; 260
	i32 78, ; 261
	i32 74, ; 262
	i32 36, ; 263
	i32 55, ; 264
	i32 44, ; 265
	i32 83, ; 266
	i32 159, ; 267
	i32 187, ; 268
	i32 38, ; 269
	i32 108, ; 270
	i32 150, ; 271
	i32 121, ; 272
	i32 170, ; 273
	i32 93, ; 274
	i32 42, ; 275
	i32 34, ; 276
	i32 100, ; 277
	i32 189, ; 278
	i32 119, ; 279
	i32 12, ; 280
	i32 172, ; 281
	i32 169, ; 282
	i32 130, ; 283
	i32 53, ; 284
	i32 179, ; 285
	i32 158, ; 286
	i32 101, ; 287
	i32 39, ; 288
	i32 181, ; 289
	i32 87, ; 290
	i32 76, ; 291
	i32 135, ; 292
	i32 179, ; 293
	i32 7, ; 294
	i32 143, ; 295
	i32 92, ; 296
	i32 102, ; 297
	i32 24, ; 298
	i32 176, ; 299
	i32 90, ; 300
	i32 188, ; 301
	i32 104, ; 302
	i32 3, ; 303
	i32 160, ; 304
	i32 64, ; 305
	i32 186, ; 306
	i32 44, ; 307
	i32 11, ; 308
	i32 57, ; 309
	i32 120, ; 310
	i32 190, ; 311
	i32 24, ; 312
	i32 23, ; 313
	i32 176, ; 314
	i32 49, ; 315
	i32 182, ; 316
	i32 139, ; 317
	i32 31, ; 318
	i32 46, ; 319
	i32 148, ; 320
	i32 136, ; 321
	i32 83, ; 322
	i32 41, ; 323
	i32 162, ; 324
	i32 96, ; 325
	i32 28, ; 326
	i32 101, ; 327
	i32 49, ; 328
	i32 63, ; 329
	i32 141, ; 330
	i32 190, ; 331
	i32 60, ; 332
	i32 33, ; 333
	i32 100, ; 334
	i32 140, ; 335
	i32 125, ; 336
	i32 47, ; 337
	i32 88, ; 338
	i32 54, ; 339
	i32 116, ; 340
	i32 43, ; 341
	i32 117, ; 342
	i32 35, ; 343
	i32 173, ; 344
	i32 65, ; 345
	i32 163, ; 346
	i32 139, ; 347
	i32 147, ; 348
	i32 32, ; 349
	i32 114, ; 350
	i32 90, ; 351
	i32 183, ; 352
	i32 103, ; 353
	i32 85, ; 354
	i32 27, ; 355
	i32 9, ; 356
	i32 126, ; 357
	i32 81, ; 358
	i32 137, ; 359
	i32 72, ; 360
	i32 155, ; 361
	i32 47, ; 362
	i32 42, ; 363
	i32 153, ; 364
	i32 181, ; 365
	i32 43, ; 366
	i32 74, ; 367
	i32 129, ; 368
	i32 152, ; 369
	i32 22, ; 370
	i32 17, ; 371
	i32 64, ; 372
	i32 155, ; 373
	i32 29, ; 374
	i32 37, ; 375
	i32 167, ; 376
	i32 98, ; 377
	i32 125, ; 378
	i32 71, ; 379
	i32 165, ; 380
	i32 98 ; 381
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

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
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
