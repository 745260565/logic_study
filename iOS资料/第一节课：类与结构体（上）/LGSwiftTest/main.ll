; ModuleID = '-'
source_filename = "-"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.15.0"

%swift.type = type { i64 }
%objc_class = type { %objc_class*, %objc_class*, %swift.opaque*, %swift.opaque*, i64 }
%swift.opaque = type opaque
%swift.method_descriptor = type { i32, i32 }
%T4main9LGTeacherC = type <{ %swift.refcounted, %TSi, %TSS }>
%swift.refcounted = type { %swift.type*, i64 }
%TSi = type <{ i64 }>
%TSS = type <{ %Ts11_StringGutsV }>
%Ts11_StringGutsV = type <{ %Ts13_StringObjectV }>
%Ts13_StringObjectV = type <{ %Ts6UInt64V, %swift.bridge* }>
%Ts6UInt64V = type <{ i64 }>
%swift.bridge = type opaque
%swift.type_metadata_record = type { i32 }
%swift.metadata_response = type { %swift.type*, i64 }
%swift.vwtable = type { i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i64, i64, i32, i32 }
%swift.type_descriptor = type opaque
%"$s4main9LGTeacherC3ageSivM.Frame" = type { [24 x i8] }
%"$s4main9LGTeacherC4nameSSvM.Frame" = type { [24 x i8] }

@"$sSiN" = external global %swift.type, align 8
@"symbolic Si_Sit" = linkonce_odr hidden constant <{ [6 x i8], i8 }> <{ [6 x i8] c"Si_Sit", i8 0 }>, section "__TEXT,__swift5_typeref, regular, no_dead_strip", align 2
@"$sSi_SitMD" = linkonce_odr hidden global { i32, i32 } { i32 trunc (i64 sub (i64 ptrtoint (<{ [6 x i8], i8 }>* @"symbolic Si_Sit" to i64), i64 ptrtoint ({ i32, i32 }* @"$sSi_SitMD" to i64)) to i32), i32 -6 }, align 8
@0 = private unnamed_addr constant [5 x i8] c"Kody\00"
@"$s4main9LGTeacherC3ageSivpWvd" = hidden constant i64 16, align 8
@"$s4main9LGTeacherC4nameSSvpWvd" = hidden constant i64 24, align 8
@"$sBoWV" = external global i8*, align 8
@"$s4main9LGTeacherCMm" = hidden global %objc_class { %objc_class* @"OBJC_METACLASS_$__TtCs12_SwiftObject", %objc_class* @"OBJC_METACLASS_$__TtCs12_SwiftObject", %swift.opaque* @_objc_empty_cache, %swift.opaque* null, i64 ptrtoint ({ i32, i32, i32, i32, i8*, i8*, i8*, i8*, i8*, i8*, i8* }* @_METACLASS_DATA__TtC4main9LGTeacher to i64) }, align 8
@"OBJC_CLASS_$__TtCs12_SwiftObject" = external global %objc_class, align 8
@_objc_empty_cache = external global %swift.opaque
@"OBJC_METACLASS_$__TtCs12_SwiftObject" = external global %objc_class, align 8
@1 = private unnamed_addr constant [20 x i8] c"_TtC4main9LGTeacher\00"
@_METACLASS_DATA__TtC4main9LGTeacher = private constant { i32, i32, i32, i32, i8*, i8*, i8*, i8*, i8*, i8*, i8* } { i32 129, i32 40, i32 40, i32 0, i8* null, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @1, i64 0, i64 0), i8* null, i8* null, i8* null, i8* null, i8* null }, section "__DATA, __objc_const", align 8
@2 = private unnamed_addr constant [4 x i8] c"age\00"
@3 = private unnamed_addr constant [1 x i8] zeroinitializer
@4 = private unnamed_addr constant [5 x i8] c"name\00"
@_IVARS__TtC4main9LGTeacher = private constant { i32, i32, [2 x { i64*, i8*, i8*, i32, i32 }] } { i32 32, i32 2, [2 x { i64*, i8*, i8*, i32, i32 }] [{ i64*, i8*, i8*, i32, i32 } { i64* @"$s4main9LGTeacherC3ageSivpWvd", i8* getelementptr inbounds ([4 x i8], [4 x i8]* @2, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @3, i64 0, i64 0), i32 3, i32 8 }, { i64*, i8*, i8*, i32, i32 } { i64* @"$s4main9LGTeacherC4nameSSvpWvd", i8* getelementptr inbounds ([5 x i8], [5 x i8]* @4, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @3, i64 0, i64 0), i32 3, i32 16 }] }, section "__DATA, __objc_const", align 8
@_DATA__TtC4main9LGTeacher = private constant { i32, i32, i32, i32, i8*, i8*, i8*, i8*, { i32, i32, [2 x { i64*, i8*, i8*, i32, i32 }] }*, i8*, i8* } { i32 128, i32 16, i32 40, i32 0, i8* null, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @1, i64 0, i64 0), i8* null, i8* null, { i32, i32, [2 x { i64*, i8*, i8*, i32, i32 }] }* @_IVARS__TtC4main9LGTeacher, i8* null, i8* null }, section "__DATA, __objc_const", align 8
@5 = private constant [5 x i8] c"main\00"
@"$s4mainMXM" = linkonce_odr hidden constant <{ i32, i32, i32 }> <{ i32 0, i32 0, i32 trunc (i64 sub (i64 ptrtoint ([5 x i8]* @5 to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32 }>, <{ i32, i32, i32 }>* @"$s4mainMXM", i32 0, i32 2) to i64)) to i32) }>, section "__TEXT,__const", align 4
@6 = private constant [10 x i8] c"LGTeacher\00"
@"$s4main9LGTeacherCMn" = hidden constant <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }> <{ i32 -2147483568, i32 trunc (i64 sub (i64 ptrtoint (<{ i32, i32, i32 }>* @"$s4mainMXM" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main9LGTeacherCMn", i32 0, i32 1) to i64)) to i32), i32 trunc (i64 sub (i64 ptrtoint ([10 x i8]* @6 to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main9LGTeacherCMn", i32 0, i32 2) to i64)) to i32), i32 trunc (i64 sub (i64 ptrtoint (%swift.metadata_response (i64)* @"$s4main9LGTeacherCMa" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main9LGTeacherCMn", i32 0, i32 3) to i64)) to i32), i32 trunc (i64 sub (i64 ptrtoint ({ i32, i32, i16, i16, i32, i32, i32, i32, i32, i32, i32 }* @"$s4main9LGTeacherCMF" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main9LGTeacherCMn", i32 0, i32 4) to i64)) to i32), i32 0, i32 2, i32 19, i32 9, i32 2, i32 10, i32 12, i32 7, %swift.method_descriptor { i32 18, i32 trunc (i64 sub (i64 ptrtoint (i64 (%T4main9LGTeacherC*)* @"$s4main9LGTeacherC3ageSivg" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main9LGTeacherCMn", i32 0, i32 13, i32 1) to i64)) to i32) }, %swift.method_descriptor { i32 19, i32 trunc (i64 sub (i64 ptrtoint (void (i64, %T4main9LGTeacherC*)* @"$s4main9LGTeacherC3ageSivs" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main9LGTeacherCMn", i32 0, i32 14, i32 1) to i64)) to i32) }, %swift.method_descriptor { i32 20, i32 trunc (i64 sub (i64 ptrtoint ({ i8*, %TSi* } (i8*, %T4main9LGTeacherC*)* @"$s4main9LGTeacherC3ageSivM" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main9LGTeacherCMn", i32 0, i32 15, i32 1) to i64)) to i32) }, %swift.method_descriptor { i32 18, i32 trunc (i64 sub (i64 ptrtoint ({ i64, %swift.bridge* } (%T4main9LGTeacherC*)* @"$s4main9LGTeacherC4nameSSvg" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main9LGTeacherCMn", i32 0, i32 16, i32 1) to i64)) to i32) }, %swift.method_descriptor { i32 19, i32 trunc (i64 sub (i64 ptrtoint (void (i64, %swift.bridge*, %T4main9LGTeacherC*)* @"$s4main9LGTeacherC4nameSSvs" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main9LGTeacherCMn", i32 0, i32 17, i32 1) to i64)) to i32) }, %swift.method_descriptor { i32 20, i32 trunc (i64 sub (i64 ptrtoint ({ i8*, %TSS* } (i8*, %T4main9LGTeacherC*)* @"$s4main9LGTeacherC4nameSSvM" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main9LGTeacherCMn", i32 0, i32 18, i32 1) to i64)) to i32) }, %swift.method_descriptor { i32 1, i32 trunc (i64 sub (i64 ptrtoint (%T4main9LGTeacherC* (%swift.type*)* @"$s4main9LGTeacherCACycfC" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main9LGTeacherCMn", i32 0, i32 19, i32 1) to i64)) to i32) } }>, section "__TEXT,__const", align 4
@"$s4main9LGTeacherCML" = internal global %swift.type* null, align 8
@"$s4main9LGTeacherCMf" = internal global <{ void (%T4main9LGTeacherC*)*, i8**, i64, %objc_class*, %swift.opaque*, %swift.opaque*, i64, i32, i32, i32, i16, i16, i32, i32, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>*, i8*, i64, i64, i64 (%T4main9LGTeacherC*)*, void (i64, %T4main9LGTeacherC*)*, { i8*, %TSi* } (i8*, %T4main9LGTeacherC*)*, { i64, %swift.bridge* } (%T4main9LGTeacherC*)*, void (i64, %swift.bridge*, %T4main9LGTeacherC*)*, { i8*, %TSS* } (i8*, %T4main9LGTeacherC*)*, %T4main9LGTeacherC* (%swift.type*)* }> <{ void (%T4main9LGTeacherC*)* @"$s4main9LGTeacherCfD", i8** @"$sBoWV", i64 ptrtoint (%objc_class* @"$s4main9LGTeacherCMm" to i64), %objc_class* @"OBJC_CLASS_$__TtCs12_SwiftObject", %swift.opaque* @_objc_empty_cache, %swift.opaque* null, i64 add (i64 ptrtoint ({ i32, i32, i32, i32, i8*, i8*, i8*, i8*, { i32, i32, [2 x { i64*, i8*, i8*, i32, i32 }] }*, i8*, i8* }* @_DATA__TtC4main9LGTeacher to i64), i64 2), i32 2, i32 0, i32 40, i16 7, i16 0, i32 168, i32 16, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main9LGTeacherCMn", i8* null, i64 16, i64 24, i64 (%T4main9LGTeacherC*)* @"$s4main9LGTeacherC3ageSivg", void (i64, %T4main9LGTeacherC*)* @"$s4main9LGTeacherC3ageSivs", { i8*, %TSi* } (i8*, %T4main9LGTeacherC*)* @"$s4main9LGTeacherC3ageSivM", { i64, %swift.bridge* } (%T4main9LGTeacherC*)* @"$s4main9LGTeacherC4nameSSvg", void (i64, %swift.bridge*, %T4main9LGTeacherC*)* @"$s4main9LGTeacherC4nameSSvs", { i8*, %TSS* } (i8*, %T4main9LGTeacherC*)* @"$s4main9LGTeacherC4nameSSvM", %T4main9LGTeacherC* (%swift.type*)* @"$s4main9LGTeacherCACycfC" }>, align 8
@"symbolic _____ 4main9LGTeacherC" = linkonce_odr hidden constant <{ i8, i32, i8 }> <{ i8 1, i32 trunc (i64 sub (i64 ptrtoint (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main9LGTeacherCMn" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i8, i32, i8 }>, <{ i8, i32, i8 }>* @"symbolic _____ 4main9LGTeacherC", i32 0, i32 1) to i64)) to i32), i8 0 }>, section "__TEXT,__swift5_typeref, regular, no_dead_strip", align 2
@"symbolic Si" = linkonce_odr hidden constant <{ [2 x i8], i8 }> <{ [2 x i8] c"Si", i8 0 }>, section "__TEXT,__swift5_typeref, regular, no_dead_strip", align 2
@7 = private constant [4 x i8] c"age\00", section "__TEXT,__swift5_reflstr, regular, no_dead_strip"
@"symbolic SS" = linkonce_odr hidden constant <{ [2 x i8], i8 }> <{ [2 x i8] c"SS", i8 0 }>, section "__TEXT,__swift5_typeref, regular, no_dead_strip", align 2
@8 = private constant [5 x i8] c"name\00", section "__TEXT,__swift5_reflstr, regular, no_dead_strip"
@"$s4main9LGTeacherCMF" = internal constant { i32, i32, i16, i16, i32, i32, i32, i32, i32, i32, i32 } { i32 trunc (i64 sub (i64 ptrtoint (<{ i8, i32, i8 }>* @"symbolic _____ 4main9LGTeacherC" to i64), i64 ptrtoint ({ i32, i32, i16, i16, i32, i32, i32, i32, i32, i32, i32 }* @"$s4main9LGTeacherCMF" to i64)) to i32), i32 0, i16 1, i16 12, i32 2, i32 2, i32 trunc (i64 sub (i64 ptrtoint (<{ [2 x i8], i8 }>* @"symbolic Si" to i64), i64 ptrtoint (i32* getelementptr inbounds ({ i32, i32, i16, i16, i32, i32, i32, i32, i32, i32, i32 }, { i32, i32, i16, i16, i32, i32, i32, i32, i32, i32, i32 }* @"$s4main9LGTeacherCMF", i32 0, i32 6) to i64)) to i32), i32 trunc (i64 sub (i64 ptrtoint ([4 x i8]* @7 to i64), i64 ptrtoint (i32* getelementptr inbounds ({ i32, i32, i16, i16, i32, i32, i32, i32, i32, i32, i32 }, { i32, i32, i16, i16, i32, i32, i32, i32, i32, i32, i32 }* @"$s4main9LGTeacherCMF", i32 0, i32 7) to i64)) to i32), i32 2, i32 trunc (i64 sub (i64 ptrtoint (<{ [2 x i8], i8 }>* @"symbolic SS" to i64), i64 ptrtoint (i32* getelementptr inbounds ({ i32, i32, i16, i16, i32, i32, i32, i32, i32, i32, i32 }, { i32, i32, i16, i16, i32, i32, i32, i32, i32, i32, i32 }* @"$s4main9LGTeacherCMF", i32 0, i32 9) to i64)) to i32), i32 trunc (i64 sub (i64 ptrtoint ([5 x i8]* @8 to i64), i64 ptrtoint (i32* getelementptr inbounds ({ i32, i32, i16, i16, i32, i32, i32, i32, i32, i32, i32 }, { i32, i32, i16, i16, i32, i32, i32, i32, i32, i32, i32 }* @"$s4main9LGTeacherCMF", i32 0, i32 10) to i64)) to i32) }, section "__TEXT,__swift5_fieldmd, regular, no_dead_strip", align 4
@"\01l_type_metadata_table" = private constant [1 x %swift.type_metadata_record] [%swift.type_metadata_record { i32 trunc (i64 sub (i64 ptrtoint (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main9LGTeacherCMn" to i64), i64 ptrtoint ([1 x %swift.type_metadata_record]* @"\01l_type_metadata_table" to i64)) to i32) }], section "__TEXT, __swift5_types, regular, no_dead_strip", align 4
@__swift_reflection_version = linkonce_odr hidden constant i16 3
@objc_classes = internal global [1 x i8*] [i8* bitcast (%swift.type* @"$s4main9LGTeacherCN" to i8*)], section "__DATA,__objc_classlist,regular,no_dead_strip", align 8
@llvm.used = appending global [4 x i8*] [i8* bitcast ({ i32, i32, i16, i16, i32, i32, i32, i32, i32, i32, i32 }* @"$s4main9LGTeacherCMF" to i8*), i8* bitcast ([1 x %swift.type_metadata_record]* @"\01l_type_metadata_table" to i8*), i8* bitcast (i16* @__swift_reflection_version to i8*), i8* bitcast ([1 x i8*]* @objc_classes to i8*)], section "llvm.metadata", align 8

@"$s4main9LGTeacherC3ageSivgTq" = hidden alias %swift.method_descriptor, getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main9LGTeacherCMn", i32 0, i32 13)
@"$s4main9LGTeacherC3ageSivsTq" = hidden alias %swift.method_descriptor, getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main9LGTeacherCMn", i32 0, i32 14)
@"$s4main9LGTeacherC3ageSivMTq" = hidden alias %swift.method_descriptor, getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main9LGTeacherCMn", i32 0, i32 15)
@"$s4main9LGTeacherC4nameSSvgTq" = hidden alias %swift.method_descriptor, getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main9LGTeacherCMn", i32 0, i32 16)
@"$s4main9LGTeacherC4nameSSvsTq" = hidden alias %swift.method_descriptor, getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main9LGTeacherCMn", i32 0, i32 17)
@"$s4main9LGTeacherC4nameSSvMTq" = hidden alias %swift.method_descriptor, getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main9LGTeacherCMn", i32 0, i32 18)
@"$s4main9LGTeacherCACycfCTq" = hidden alias %swift.method_descriptor, getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main9LGTeacherCMn", i32 0, i32 19)
@"$s4main9LGTeacherCN" = hidden alias %swift.type, bitcast (i64* getelementptr inbounds (<{ void (%T4main9LGTeacherC*)*, i8**, i64, %objc_class*, %swift.opaque*, %swift.opaque*, i64, i32, i32, i32, i16, i16, i32, i32, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>*, i8*, i64, i64, i64 (%T4main9LGTeacherC*)*, void (i64, %T4main9LGTeacherC*)*, { i8*, %TSi* } (i8*, %T4main9LGTeacherC*)*, { i64, %swift.bridge* } (%T4main9LGTeacherC*)*, void (i64, %swift.bridge*, %T4main9LGTeacherC*)*, { i8*, %TSS* } (i8*, %T4main9LGTeacherC*)*, %T4main9LGTeacherC* (%swift.type*)* }>, <{ void (%T4main9LGTeacherC*)*, i8**, i64, %objc_class*, %swift.opaque*, %swift.opaque*, i64, i32, i32, i32, i16, i16, i32, i32, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>*, i8*, i64, i64, i64 (%T4main9LGTeacherC*)*, void (i64, %T4main9LGTeacherC*)*, { i8*, %TSi* } (i8*, %T4main9LGTeacherC*)*, { i64, %swift.bridge* } (%T4main9LGTeacherC*)*, void (i64, %swift.bridge*, %T4main9LGTeacherC*)*, { i8*, %TSS* } (i8*, %T4main9LGTeacherC*)*, %T4main9LGTeacherC* (%swift.type*)* }>* @"$s4main9LGTeacherCMf", i32 0, i32 2) to %swift.type*)

define i32 @main(i32, i8**) #0 {
entry:
  %2 = alloca %TSi, align 8
  %3 = alloca %TSi, align 8
  %4 = alloca <{ %TSi, %TSi }>, align 8
  %5 = alloca <{ %TSi, %TSi }>, align 8
  %6 = alloca %T4main9LGTeacherC*, align 8
  %7 = alloca %T4main9LGTeacherC*, align 8
  %8 = bitcast i8** %1 to i8*
  %9 = bitcast %TSi* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %9)
  %10 = bitcast %TSi* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %10)
  %._value = getelementptr inbounds %TSi, %TSi* %3, i32 0, i32 0
  store i64 10, i64* %._value, align 8
  %11 = bitcast %TSi* %2 to %swift.opaque*
  %12 = bitcast %TSi* %3 to %swift.opaque*
  call swiftcc void @"$s4main10testGenricyxxlF"(%swift.opaque* noalias nocapture sret %11, %swift.opaque* noalias nocapture %12, %swift.type* @"$sSiN")
  %13 = bitcast %TSi* %3 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %13)
  %._value1 = getelementptr inbounds %TSi, %TSi* %2, i32 0, i32 0
  %14 = load i64, i64* %._value1, align 8
  %15 = bitcast %TSi* %2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %15)
  %16 = bitcast <{ %TSi, %TSi }>* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* %16)
  %17 = bitcast <{ %TSi, %TSi }>* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* %17)
  %.elt = getelementptr inbounds <{ %TSi, %TSi }>, <{ %TSi, %TSi }>* %5, i32 0, i32 0
  %.elt2 = getelementptr inbounds <{ %TSi, %TSi }>, <{ %TSi, %TSi }>* %5, i32 0, i32 1
  %.elt._value = getelementptr inbounds %TSi, %TSi* %.elt, i32 0, i32 0
  store i64 10, i64* %.elt._value, align 8
  %.elt2._value = getelementptr inbounds %TSi, %TSi* %.elt2, i32 0, i32 0
  store i64 20, i64* %.elt2._value, align 8
  %18 = bitcast <{ %TSi, %TSi }>* %4 to %swift.opaque*
  %19 = bitcast <{ %TSi, %TSi }>* %5 to %swift.opaque*
  %20 = call %swift.type* @__swift_instantiateConcreteTypeFromMangledName({ i32, i32 }* @"$sSi_SitMD") #3
  call swiftcc void @"$s4main10testGenricyxxlF"(%swift.opaque* noalias nocapture sret %18, %swift.opaque* noalias nocapture %19, %swift.type* %20)
  %21 = bitcast <{ %TSi, %TSi }>* %5 to i8*
  call void @llvm.lifetime.end.p0i8(i64 16, i8* %21)
  %22 = bitcast <{ %TSi, %TSi }>* %4 to i8*
  call void @llvm.lifetime.end.p0i8(i64 16, i8* %22)
  %23 = bitcast %T4main9LGTeacherC** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %23)
  %24 = call swiftcc %swift.metadata_response @"$s4main9LGTeacherCMa"(i64 0) #3
  %25 = extractvalue %swift.metadata_response %24, 0
  %26 = call swiftcc %T4main9LGTeacherC* @"$s4main9LGTeacherCACycfC"(%swift.type* swiftself %25)
  %27 = bitcast %T4main9LGTeacherC** %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %27)
  store %T4main9LGTeacherC* %26, %T4main9LGTeacherC** %7, align 8
  %28 = bitcast %T4main9LGTeacherC** %6 to %swift.opaque*
  %29 = bitcast %T4main9LGTeacherC** %7 to %swift.opaque*
  call swiftcc void @"$s4main10testGenricyxxlF"(%swift.opaque* noalias nocapture sret %28, %swift.opaque* noalias nocapture %29, %swift.type* %25)
  %toDestroy = load %T4main9LGTeacherC*, %T4main9LGTeacherC** %7, align 8
  call void bitcast (void (%swift.refcounted*)* @swift_release to void (%T4main9LGTeacherC*)*)(%T4main9LGTeacherC* %toDestroy) #6
  %30 = bitcast %T4main9LGTeacherC** %7 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %30)
  %31 = load %T4main9LGTeacherC*, %T4main9LGTeacherC** %6, align 8
  call void bitcast (void (%swift.refcounted*)* @swift_release to void (%T4main9LGTeacherC*)*)(%T4main9LGTeacherC* %31) #6
  %32 = bitcast %T4main9LGTeacherC** %6 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %32)
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

define hidden swiftcc void @"$s4main10testGenricyxxlF"(%swift.opaque* noalias nocapture sret, %swift.opaque* noalias nocapture, %swift.type* %T) #0 {
entry:
  %T1 = alloca %swift.type*, align 8
  %tmp.debug = alloca i8*, align 8
  %2 = bitcast i8** %tmp.debug to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %2, i8 0, i64 8, i1 false)
  store %swift.type* %T, %swift.type** %T1, align 8
  %3 = bitcast %swift.type* %T to i8***
  %4 = getelementptr inbounds i8**, i8*** %3, i64 -1
  %T.valueWitnesses = load i8**, i8*** %4, align 8, !invariant.load !25, !dereferenceable !26
  %5 = bitcast i8** %T.valueWitnesses to %swift.vwtable*
  %6 = getelementptr inbounds %swift.vwtable, %swift.vwtable* %5, i32 0, i32 8
  %size = load i64, i64* %6, align 8, !invariant.load !25
  %7 = alloca i8, i64 %size, align 16
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %7)
  %8 = bitcast i8* %7 to %swift.opaque*
  store i8* %7, i8** %tmp.debug, align 8
  %9 = getelementptr inbounds i8*, i8** %T.valueWitnesses, i32 2
  %10 = load i8*, i8** %9, align 8, !invariant.load !25
  %initializeWithCopy = bitcast i8* %10 to %swift.opaque* (%swift.opaque*, %swift.opaque*, %swift.type*)*
  %11 = call %swift.opaque* %initializeWithCopy(%swift.opaque* noalias %8, %swift.opaque* noalias %1, %swift.type* %T) #6
  %12 = call %swift.opaque* %initializeWithCopy(%swift.opaque* noalias %0, %swift.opaque* noalias %8, %swift.type* %T) #6
  %13 = getelementptr inbounds i8*, i8** %T.valueWitnesses, i32 1
  %14 = load i8*, i8** %13, align 8, !invariant.load !25
  %destroy = bitcast i8* %14 to void (%swift.opaque*, %swift.type*)*
  call void %destroy(%swift.opaque* noalias %8, %swift.type* %T) #6
  %15 = bitcast %swift.opaque* %8 to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %15)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: noinline nounwind readnone
define linkonce_odr hidden %swift.type* @__swift_instantiateConcreteTypeFromMangledName({ i32, i32 }*) #2 {
entry:
  %1 = bitcast { i32, i32 }* %0 to i64*
  %2 = load atomic i64, i64* %1 monotonic, align 8
  %3 = icmp slt i64 %2, 0
  %4 = call i1 @llvm.expect.i1(i1 %3, i1 false)
  br i1 %4, label %8, label %5

5:                                                ; preds = %8, %entry
  %6 = phi i64 [ %2, %entry ], [ %17, %8 ]
  %7 = inttoptr i64 %6 to %swift.type*
  ret %swift.type* %7

8:                                                ; preds = %entry
  %9 = ashr i64 %2, 32
  %10 = sub i64 0, %9
  %11 = trunc i64 %2 to i32
  %12 = sext i32 %11 to i64
  %13 = ptrtoint { i32, i32 }* %0 to i64
  %14 = add i64 %13, %12
  %15 = inttoptr i64 %14 to i8*
  %16 = call swiftcc %swift.type* @swift_getTypeByMangledNameInContext(i8* %15, i64 %10, %swift.type_descriptor* null, i8** null) #3
  %17 = ptrtoint %swift.type* %16 to i64
  store atomic i64 %17, i64* %1 monotonic, align 8
  br label %5
}

; Function Attrs: nounwind readnone
declare i1 @llvm.expect.i1(i1, i1) #3

; Function Attrs: argmemonly nounwind
declare swiftcc %swift.type* @swift_getTypeByMangledNameInContext(i8*, i64, %swift.type_descriptor*, i8**) #1

; Function Attrs: noinline nounwind readnone
define hidden swiftcc %swift.metadata_response @"$s4main9LGTeacherCMa"(i64) #4 {
entry:
  %1 = load %swift.type*, %swift.type** @"$s4main9LGTeacherCML", align 8
  %2 = icmp eq %swift.type* %1, null
  br i1 %2, label %cacheIsNull, label %cont

cacheIsNull:                                      ; preds = %entry
  %3 = call %objc_class* @swift_getInitializedObjCClass(%objc_class* bitcast (i64* getelementptr inbounds (<{ void (%T4main9LGTeacherC*)*, i8**, i64, %objc_class*, %swift.opaque*, %swift.opaque*, i64, i32, i32, i32, i16, i16, i32, i32, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>*, i8*, i64, i64, i64 (%T4main9LGTeacherC*)*, void (i64, %T4main9LGTeacherC*)*, { i8*, %TSi* } (i8*, %T4main9LGTeacherC*)*, { i64, %swift.bridge* } (%T4main9LGTeacherC*)*, void (i64, %swift.bridge*, %T4main9LGTeacherC*)*, { i8*, %TSS* } (i8*, %T4main9LGTeacherC*)*, %T4main9LGTeacherC* (%swift.type*)* }>, <{ void (%T4main9LGTeacherC*)*, i8**, i64, %objc_class*, %swift.opaque*, %swift.opaque*, i64, i32, i32, i32, i16, i16, i32, i32, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>*, i8*, i64, i64, i64 (%T4main9LGTeacherC*)*, void (i64, %T4main9LGTeacherC*)*, { i8*, %TSi* } (i8*, %T4main9LGTeacherC*)*, { i64, %swift.bridge* } (%T4main9LGTeacherC*)*, void (i64, %swift.bridge*, %T4main9LGTeacherC*)*, { i8*, %TSS* } (i8*, %T4main9LGTeacherC*)*, %T4main9LGTeacherC* (%swift.type*)* }>* @"$s4main9LGTeacherCMf", i32 0, i32 2) to %objc_class*))
  %4 = bitcast %objc_class* %3 to %swift.type*
  store atomic %swift.type* %4, %swift.type** @"$s4main9LGTeacherCML" release, align 8
  br label %cont

cont:                                             ; preds = %cacheIsNull, %entry
  %5 = phi %swift.type* [ %1, %entry ], [ %4, %cacheIsNull ]
  %6 = insertvalue %swift.metadata_response undef, %swift.type* %5, 0
  %7 = insertvalue %swift.metadata_response %6, i64 0, 1
  ret %swift.metadata_response %7
}

define hidden swiftcc i64 @"$s4main9LGTeacherC3ageSivpfi"() #0 {
entry:
  ret i64 18
}

define hidden swiftcc i64 @"$s4main9LGTeacherC3ageSivg"(%T4main9LGTeacherC* swiftself) #0 {
entry:
  %access-scratch = alloca [24 x i8], align 8
  %1 = getelementptr inbounds %T4main9LGTeacherC, %T4main9LGTeacherC* %0, i32 0, i32 1
  %2 = bitcast [24 x i8]* %access-scratch to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %2)
  %3 = bitcast %TSi* %1 to i8*
  call void @swift_beginAccess(i8* %3, [24 x i8]* %access-scratch, i64 32, i8* null) #6
  %._value = getelementptr inbounds %TSi, %TSi* %1, i32 0, i32 0
  %4 = load i64, i64* %._value, align 8
  call void @swift_endAccess([24 x i8]* %access-scratch) #6
  %5 = bitcast [24 x i8]* %access-scratch to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %5)
  ret i64 %4
}

define hidden swiftcc void @"$s4main9LGTeacherC3ageSivs"(i64, %T4main9LGTeacherC* swiftself) #0 {
entry:
  %access-scratch = alloca [24 x i8], align 8
  %2 = getelementptr inbounds %T4main9LGTeacherC, %T4main9LGTeacherC* %1, i32 0, i32 1
  %3 = bitcast [24 x i8]* %access-scratch to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %3)
  %4 = bitcast %TSi* %2 to i8*
  call void @swift_beginAccess(i8* %4, [24 x i8]* %access-scratch, i64 33, i8* null) #6
  %._value = getelementptr inbounds %TSi, %TSi* %2, i32 0, i32 0
  store i64 %0, i64* %._value, align 8
  call void @swift_endAccess([24 x i8]* %access-scratch) #6
  %5 = bitcast [24 x i8]* %access-scratch to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %5)
  ret void
}

; Function Attrs: noinline
define hidden swiftcc { i8*, %TSi* } @"$s4main9LGTeacherC3ageSivM"(i8* noalias dereferenceable(32), %T4main9LGTeacherC* swiftself) #5 {
entry:
  %FramePtr = bitcast i8* %0 to %"$s4main9LGTeacherC3ageSivM.Frame"*
  %access-scratch = getelementptr inbounds %"$s4main9LGTeacherC3ageSivM.Frame", %"$s4main9LGTeacherC3ageSivM.Frame"* %FramePtr, i32 0, i32 0
  %2 = getelementptr inbounds %T4main9LGTeacherC, %T4main9LGTeacherC* %1, i32 0, i32 1
  %3 = bitcast [24 x i8]* %access-scratch to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %3)
  %4 = bitcast %TSi* %2 to i8*
  call void @swift_beginAccess(i8* %4, [24 x i8]* %access-scratch, i64 33, i8* null) #6
  %5 = insertvalue { i8*, %TSi* } { i8* bitcast (void (i8*, i1)* @"$s4main9LGTeacherC3ageSivM.resume.0" to i8*), %TSi* undef }, %TSi* %2, 1
  ret { i8*, %TSi* } %5
}

define internal swiftcc void @"$s4main9LGTeacherC3ageSivM.resume.0"(i8* noalias nonnull dereferenceable(32), i1) #0 {
entryresume.0:
  %FramePtr = bitcast i8* %0 to %"$s4main9LGTeacherC3ageSivM.Frame"*
  %vFrame = bitcast %"$s4main9LGTeacherC3ageSivM.Frame"* %FramePtr to i8*
  %access-scratch = getelementptr inbounds %"$s4main9LGTeacherC3ageSivM.Frame", %"$s4main9LGTeacherC3ageSivM.Frame"* %FramePtr, i32 0, i32 0
  %access-scratch.reload.addr1 = getelementptr inbounds %"$s4main9LGTeacherC3ageSivM.Frame", %"$s4main9LGTeacherC3ageSivM.Frame"* %FramePtr, i32 0, i32 0
  call void @swift_endAccess([24 x i8]* %access-scratch.reload.addr1) #6
  %2 = bitcast [24 x i8]* %access-scratch.reload.addr1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %2)
  ret void
}

define hidden swiftcc { i64, %swift.bridge* } @"$s4main9LGTeacherC4nameSSvpfi"() #0 {
entry:
  %0 = call swiftcc { i64, %swift.bridge* } @"$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC"(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @0, i64 0, i64 0), i64 4, i1 true)
  %1 = extractvalue { i64, %swift.bridge* } %0, 0
  %2 = extractvalue { i64, %swift.bridge* } %0, 1
  %3 = insertvalue { i64, %swift.bridge* } undef, i64 %1, 0
  %4 = insertvalue { i64, %swift.bridge* } %3, %swift.bridge* %2, 1
  ret { i64, %swift.bridge* } %4
}

define hidden swiftcc { i64, %swift.bridge* } @"$s4main9LGTeacherC4nameSSvg"(%T4main9LGTeacherC* swiftself) #0 {
entry:
  %access-scratch = alloca [24 x i8], align 8
  %1 = getelementptr inbounds %T4main9LGTeacherC, %T4main9LGTeacherC* %0, i32 0, i32 2
  %2 = bitcast [24 x i8]* %access-scratch to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %2)
  %3 = bitcast %TSS* %1 to i8*
  call void @swift_beginAccess(i8* %3, [24 x i8]* %access-scratch, i64 32, i8* null) #6
  %._guts = getelementptr inbounds %TSS, %TSS* %1, i32 0, i32 0
  %._guts._object = getelementptr inbounds %Ts11_StringGutsV, %Ts11_StringGutsV* %._guts, i32 0, i32 0
  %._guts._object._countAndFlagsBits = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %._guts._object, i32 0, i32 0
  %._guts._object._countAndFlagsBits._value = getelementptr inbounds %Ts6UInt64V, %Ts6UInt64V* %._guts._object._countAndFlagsBits, i32 0, i32 0
  %4 = load i64, i64* %._guts._object._countAndFlagsBits._value, align 8
  %._guts._object._object = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %._guts._object, i32 0, i32 1
  %5 = load %swift.bridge*, %swift.bridge** %._guts._object._object, align 8
  %6 = call %swift.bridge* @swift_bridgeObjectRetain(%swift.bridge* returned %5) #6
  call void @swift_endAccess([24 x i8]* %access-scratch) #6
  %7 = bitcast [24 x i8]* %access-scratch to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %7)
  %8 = insertvalue { i64, %swift.bridge* } undef, i64 %4, 0
  %9 = insertvalue { i64, %swift.bridge* } %8, %swift.bridge* %5, 1
  ret { i64, %swift.bridge* } %9
}

define hidden swiftcc void @"$s4main9LGTeacherC4nameSSvs"(i64, %swift.bridge*, %T4main9LGTeacherC* swiftself) #0 {
entry:
  %access-scratch = alloca [24 x i8], align 8
  %3 = call %swift.bridge* @swift_bridgeObjectRetain(%swift.bridge* returned %1) #6
  %4 = getelementptr inbounds %T4main9LGTeacherC, %T4main9LGTeacherC* %2, i32 0, i32 2
  %5 = bitcast [24 x i8]* %access-scratch to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %5)
  %6 = bitcast %TSS* %4 to i8*
  call void @swift_beginAccess(i8* %6, [24 x i8]* %access-scratch, i64 33, i8* null) #6
  %._guts = getelementptr inbounds %TSS, %TSS* %4, i32 0, i32 0
  %._guts._object = getelementptr inbounds %Ts11_StringGutsV, %Ts11_StringGutsV* %._guts, i32 0, i32 0
  %._guts._object._countAndFlagsBits = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %._guts._object, i32 0, i32 0
  %._guts._object._countAndFlagsBits._value = getelementptr inbounds %Ts6UInt64V, %Ts6UInt64V* %._guts._object._countAndFlagsBits, i32 0, i32 0
  %7 = load i64, i64* %._guts._object._countAndFlagsBits._value, align 8
  %._guts._object._object = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %._guts._object, i32 0, i32 1
  %8 = load %swift.bridge*, %swift.bridge** %._guts._object._object, align 8
  %._guts1 = getelementptr inbounds %TSS, %TSS* %4, i32 0, i32 0
  %._guts1._object = getelementptr inbounds %Ts11_StringGutsV, %Ts11_StringGutsV* %._guts1, i32 0, i32 0
  %._guts1._object._countAndFlagsBits = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %._guts1._object, i32 0, i32 0
  %._guts1._object._countAndFlagsBits._value = getelementptr inbounds %Ts6UInt64V, %Ts6UInt64V* %._guts1._object._countAndFlagsBits, i32 0, i32 0
  store i64 %0, i64* %._guts1._object._countAndFlagsBits._value, align 8
  %._guts1._object._object = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %._guts1._object, i32 0, i32 1
  store %swift.bridge* %1, %swift.bridge** %._guts1._object._object, align 8
  call void @swift_bridgeObjectRelease(%swift.bridge* %8) #6
  call void @swift_endAccess([24 x i8]* %access-scratch) #6
  %9 = bitcast [24 x i8]* %access-scratch to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %9)
  call void @swift_bridgeObjectRelease(%swift.bridge* %1) #6
  ret void
}

; Function Attrs: noinline
define hidden swiftcc { i8*, %TSS* } @"$s4main9LGTeacherC4nameSSvM"(i8* noalias dereferenceable(32), %T4main9LGTeacherC* swiftself) #5 {
entry:
  %FramePtr = bitcast i8* %0 to %"$s4main9LGTeacherC4nameSSvM.Frame"*
  %access-scratch = getelementptr inbounds %"$s4main9LGTeacherC4nameSSvM.Frame", %"$s4main9LGTeacherC4nameSSvM.Frame"* %FramePtr, i32 0, i32 0
  %2 = getelementptr inbounds %T4main9LGTeacherC, %T4main9LGTeacherC* %1, i32 0, i32 2
  %3 = bitcast [24 x i8]* %access-scratch to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %3)
  %4 = bitcast %TSS* %2 to i8*
  call void @swift_beginAccess(i8* %4, [24 x i8]* %access-scratch, i64 33, i8* null) #6
  %5 = insertvalue { i8*, %TSS* } { i8* bitcast (void (i8*, i1)* @"$s4main9LGTeacherC4nameSSvM.resume.0" to i8*), %TSS* undef }, %TSS* %2, 1
  ret { i8*, %TSS* } %5
}

define internal swiftcc void @"$s4main9LGTeacherC4nameSSvM.resume.0"(i8* noalias nonnull dereferenceable(32), i1) #0 {
entryresume.0:
  %FramePtr = bitcast i8* %0 to %"$s4main9LGTeacherC4nameSSvM.Frame"*
  %vFrame = bitcast %"$s4main9LGTeacherC4nameSSvM.Frame"* %FramePtr to i8*
  %access-scratch = getelementptr inbounds %"$s4main9LGTeacherC4nameSSvM.Frame", %"$s4main9LGTeacherC4nameSSvM.Frame"* %FramePtr, i32 0, i32 0
  %access-scratch.reload.addr1 = getelementptr inbounds %"$s4main9LGTeacherC4nameSSvM.Frame", %"$s4main9LGTeacherC4nameSSvM.Frame"* %FramePtr, i32 0, i32 0
  call void @swift_endAccess([24 x i8]* %access-scratch.reload.addr1) #6
  %2 = bitcast [24 x i8]* %access-scratch.reload.addr1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %2)
  ret void
}

define hidden swiftcc %swift.refcounted* @"$s4main9LGTeacherCfd"(%T4main9LGTeacherC* swiftself) #0 {
entry:
  %self.debug = alloca %T4main9LGTeacherC*, align 8
  %1 = bitcast %T4main9LGTeacherC** %self.debug to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %1, i8 0, i64 8, i1 false)
  store %T4main9LGTeacherC* %0, %T4main9LGTeacherC** %self.debug, align 8
  %2 = getelementptr inbounds %T4main9LGTeacherC, %T4main9LGTeacherC* %0, i32 0, i32 2
  %3 = call %TSS* @"$sSSWOh"(%TSS* %2)
  %4 = bitcast %T4main9LGTeacherC* %0 to %swift.refcounted*
  ret %swift.refcounted* %4
}

define hidden swiftcc void @"$s4main9LGTeacherCfD"(%T4main9LGTeacherC* swiftself) #0 {
entry:
  %self.debug = alloca %T4main9LGTeacherC*, align 8
  %1 = bitcast %T4main9LGTeacherC** %self.debug to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %1, i8 0, i64 8, i1 false)
  store %T4main9LGTeacherC* %0, %T4main9LGTeacherC** %self.debug, align 8
  %2 = call swiftcc %swift.refcounted* @"$s4main9LGTeacherCfd"(%T4main9LGTeacherC* swiftself %0)
  %3 = bitcast %swift.refcounted* %2 to %T4main9LGTeacherC*
  %4 = bitcast %T4main9LGTeacherC* %3 to %swift.refcounted*
  call void @swift_deallocClassInstance(%swift.refcounted* %4, i64 40, i64 7)
  ret void
}

define hidden swiftcc %T4main9LGTeacherC* @"$s4main9LGTeacherCACycfC"(%swift.type* swiftself) #0 {
entry:
  %1 = call noalias %swift.refcounted* @swift_allocObject(%swift.type* %0, i64 40, i64 7) #6
  %2 = bitcast %swift.refcounted* %1 to %T4main9LGTeacherC*
  %3 = call swiftcc %T4main9LGTeacherC* @"$s4main9LGTeacherCACycfc"(%T4main9LGTeacherC* swiftself %2)
  ret %T4main9LGTeacherC* %3
}

; Function Attrs: nounwind
declare void @swift_release(%swift.refcounted*) #6

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: nounwind
declare void @swift_beginAccess(i8*, [24 x i8]*, i64, i8*) #6

; Function Attrs: nounwind
declare void @swift_endAccess([24 x i8]*) #6

declare swiftcc void @"$s4main9LGTeacherCIetMg_TC"(i8* noalias dereferenceable(32), i1) #0

declare i8* @malloc(i64)

declare void @free(i8*)

; Function Attrs: nounwind
declare token @llvm.coro.id.retcon.once(i32, i32, i8*, i8*, i8*, i8*) #6

; Function Attrs: nounwind
declare i8* @llvm.coro.begin(token, i8* writeonly) #6

; Function Attrs: nounwind
declare i1 @llvm.coro.suspend.retcon.i1(...) #6

; Function Attrs: nounwind
declare i1 @llvm.coro.end(i8*, i1) #6

declare swiftcc { i64, %swift.bridge* } @"$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC"(i8*, i64, i1) #0

; Function Attrs: nounwind
declare %swift.bridge* @swift_bridgeObjectRetain(%swift.bridge* returned) #6

; Function Attrs: nounwind
declare void @swift_bridgeObjectRelease(%swift.bridge*) #6

; Function Attrs: noinline nounwind
define linkonce_odr hidden %TSS* @"$sSSWOh"(%TSS*) #7 {
entry:
  %._guts = getelementptr inbounds %TSS, %TSS* %0, i32 0, i32 0
  %._guts._object = getelementptr inbounds %Ts11_StringGutsV, %Ts11_StringGutsV* %._guts, i32 0, i32 0
  %._guts._object._object = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %._guts._object, i32 0, i32 1
  %toDestroy = load %swift.bridge*, %swift.bridge** %._guts._object._object, align 8
  call void @swift_bridgeObjectRelease(%swift.bridge* %toDestroy) #6
  ret %TSS* %0
}

; Function Attrs: nounwind
declare void @swift_deallocClassInstance(%swift.refcounted*, i64, i64) #6

; Function Attrs: nounwind
declare %swift.refcounted* @swift_allocObject(%swift.type*, i64, i64) #6

define hidden swiftcc %T4main9LGTeacherC* @"$s4main9LGTeacherCACycfc"(%T4main9LGTeacherC* swiftself) #0 {
entry:
  %self.debug = alloca %T4main9LGTeacherC*, align 8
  %1 = bitcast %T4main9LGTeacherC** %self.debug to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %1, i8 0, i64 8, i1 false)
  %access-scratch = alloca [24 x i8], align 8
  %access-scratch1 = alloca [24 x i8], align 8
  store %T4main9LGTeacherC* %0, %T4main9LGTeacherC** %self.debug, align 8
  %2 = getelementptr inbounds %T4main9LGTeacherC, %T4main9LGTeacherC* %0, i32 0, i32 1
  %3 = bitcast [24 x i8]* %access-scratch to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %3)
  %4 = bitcast %TSi* %2 to i8*
  call void @swift_beginAccess(i8* %4, [24 x i8]* %access-scratch, i64 33, i8* null) #6
  %._value = getelementptr inbounds %TSi, %TSi* %2, i32 0, i32 0
  store i64 18, i64* %._value, align 8
  call void @swift_endAccess([24 x i8]* %access-scratch) #6
  %5 = bitcast [24 x i8]* %access-scratch to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %5)
  %6 = call swiftcc { i64, %swift.bridge* } @"$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC"(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @0, i64 0, i64 0), i64 4, i1 true)
  %7 = extractvalue { i64, %swift.bridge* } %6, 0
  %8 = extractvalue { i64, %swift.bridge* } %6, 1
  %9 = getelementptr inbounds %T4main9LGTeacherC, %T4main9LGTeacherC* %0, i32 0, i32 2
  %10 = bitcast [24 x i8]* %access-scratch1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %10)
  %11 = bitcast %TSS* %9 to i8*
  call void @swift_beginAccess(i8* %11, [24 x i8]* %access-scratch1, i64 33, i8* null) #6
  %._guts = getelementptr inbounds %TSS, %TSS* %9, i32 0, i32 0
  %._guts._object = getelementptr inbounds %Ts11_StringGutsV, %Ts11_StringGutsV* %._guts, i32 0, i32 0
  %._guts._object._countAndFlagsBits = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %._guts._object, i32 0, i32 0
  %._guts._object._countAndFlagsBits._value = getelementptr inbounds %Ts6UInt64V, %Ts6UInt64V* %._guts._object._countAndFlagsBits, i32 0, i32 0
  store i64 %7, i64* %._guts._object._countAndFlagsBits._value, align 8
  %._guts._object._object = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %._guts._object, i32 0, i32 1
  store %swift.bridge* %8, %swift.bridge** %._guts._object._object, align 8
  call void @swift_endAccess([24 x i8]* %access-scratch1) #6
  %12 = bitcast [24 x i8]* %access-scratch1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %12)
  ret %T4main9LGTeacherC* %0
}

; Function Attrs: nounwind
declare %objc_class* @swift_getInitializedObjCClass(%objc_class*) #6

; Function Attrs: alwaysinline
define private void @coro.devirt.trigger(i8*) #8 {
entry:
  ret void
}

attributes #0 = { "frame-pointer"="all" "probe-stack"="__chkstk_darwin" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { noinline nounwind readnone "frame-pointer"="none" }
attributes #3 = { nounwind readnone }
attributes #4 = { noinline nounwind readnone "frame-pointer"="none" "probe-stack"="__chkstk_darwin" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" }
attributes #5 = { noinline "frame-pointer"="all" "probe-stack"="__chkstk_darwin" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" }
attributes #6 = { nounwind }
attributes #7 = { noinline nounwind }
attributes #8 = { alwaysinline }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!swift.module.flags = !{!9}
!llvm.asan.globals = !{!10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21}
!llvm.linker.options = !{!22, !23, !24}

!0 = !{i32 2, !"SDK Version", [3 x i32] [i32 10, i32 15, i32 6]}
!1 = !{i32 1, !"Objective-C Version", i32 2}
!2 = !{i32 1, !"Objective-C Image Info Version", i32 0}
!3 = !{i32 1, !"Objective-C Image Info Section", !"__DATA,__objc_imageinfo,regular,no_dead_strip"}
!4 = !{i32 4, !"Objective-C Garbage Collection", i32 84018944}
!5 = !{i32 1, !"Objective-C Class Properties", i32 64}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 1, !"Swift Version", i32 7}
!9 = !{!"standard-library", i1 false}
!10 = !{<{ [6 x i8], i8 }>* @"symbolic Si_Sit", null, null, i1 false, i1 true}
!11 = !{<{ i32, i32, i32 }>* @"$s4mainMXM", null, null, i1 false, i1 true}
!12 = !{<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main9LGTeacherCMn", null, null, i1 false, i1 true}
!13 = !{<{ i8, i32, i8 }>* @"symbolic _____ 4main9LGTeacherC", null, null, i1 false, i1 true}
!14 = !{<{ [2 x i8], i8 }>* @"symbolic Si", null, null, i1 false, i1 true}
!15 = !{[4 x i8]* @7, null, null, i1 false, i1 true}
!16 = !{<{ [2 x i8], i8 }>* @"symbolic SS", null, null, i1 false, i1 true}
!17 = !{[5 x i8]* @8, null, null, i1 false, i1 true}
!18 = !{{ i32, i32, i16, i16, i32, i32, i32, i32, i32, i32, i32 }* @"$s4main9LGTeacherCMF", null, null, i1 false, i1 true}
!19 = !{[1 x %swift.type_metadata_record]* @"\01l_type_metadata_table", null, null, i1 false, i1 true}
!20 = !{[1 x i8*]* @objc_classes, null, null, i1 false, i1 true}
!21 = !{[4 x i8*]* @llvm.used, null, null, i1 false, i1 true}
!22 = !{!"-lswiftSwiftOnoneSupport"}
!23 = !{!"-lswiftCore"}
!24 = !{!"-lobjc"}
!25 = !{}
!26 = !{i64 96}
