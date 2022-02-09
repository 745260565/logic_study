; ModuleID = '<swift-imported-modules>'
source_filename = "<swift-imported-modules>"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

%T4main7TeacherC = type <{ %swift.refcounted, %TSiIegy_Sg }>
%swift.refcounted = type { %swift.type*, i64 }
%swift.type = type { i64 }
%TSiIegy_Sg = type <{ [16 x i8] }>
%struct._SwiftEmptyArrayStorage = type { %struct.HeapObject, %struct._SwiftArrayBodyStorage }
%struct.HeapObject = type { %struct.HeapMetadata*, %struct.InlineRefCountsPlaceholder }
%struct.HeapMetadata = type opaque
%struct.InlineRefCountsPlaceholder = type { i64 }
%struct._SwiftArrayBodyStorage = type { i64, i64 }
%objc_class = type { %objc_class*, %objc_class*, %swift.opaque*, %swift.opaque*, i64 }
%swift.opaque = type opaque
%swift.full_boxmetadata = type { void (%swift.refcounted*)*, i8**, %swift.type, i32, i8* }
%objc_block = type { %objc_class*, i32, i32, i8*, i8* }
%swift.function = type { i8*, %swift.refcounted* }
%swift.method_descriptor = type { i32, i32 }
%swift.full_type = type { i8**, %swift.type }
%swift.protocol_conformance_descriptor = type { i32, i32, i32, i32 }
%swift.type_descriptor = type opaque
%swift.type_metadata_record = type { i32 }
%swift.metadata_response = type { %swift.type*, i64 }
%"$s4main7TeacherC16completionHandleySicSgvM.Frame" = type { [24 x i8] }
%TSi = type <{ i64 }>
%swift.vwtable = type { i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i64, i64, i32, i32 }
%TSo17OS_dispatch_queueC = type opaque
%TSa = type <{ %Ts12_ArrayBufferV }>
%Ts12_ArrayBufferV = type <{ %Ts14_BridgeStorageV }>
%Ts14_BridgeStorageV = type <{ %swift.bridge* }>
%swift.bridge = type opaque
%Any = type { [24 x i8], %swift.type* }
%Ts28__ContiguousArrayStorageBaseC = type <{ %swift.refcounted, %Ts10_ArrayBodyV }>
%Ts10_ArrayBodyV = type <{ %TSo22_SwiftArrayBodyStorageV }>
%TSo22_SwiftArrayBodyStorageV = type <{ %TSi, %TSu }>
%TSu = type <{ i64 }>

@"$s4main1tAA7TeacherCvp" = hidden global %T4main7TeacherC* null, align 8
@_swiftEmptyArrayStorage = external global %struct._SwiftEmptyArrayStorage, align 8
@"$sSo17OS_dispatch_queueCML" = linkonce_odr hidden global %swift.type* null, align 8
@"OBJC_CLASS_REF_$_OS_dispatch_queue" = private externally_initialized global %objc_class* @"OBJC_CLASS_$_OS_dispatch_queue", section "__DATA,__objc_classrefs,regular,no_dead_strip", align 8
@"OBJC_CLASS_$_OS_dispatch_queue" = external global %objc_class, align 8
@"symbolic SiIegy_" = linkonce_odr hidden constant <{ [7 x i8], i8 }> <{ [7 x i8] c"SiIegy_", i8 0 }>, section "__TEXT,__swift5_typeref, regular, no_dead_strip", align 2
@"symbolic Si" = linkonce_odr hidden constant <{ [2 x i8], i8 }> <{ [2 x i8] c"Si", i8 0 }>, section "__TEXT,__swift5_typeref, regular, no_dead_strip", align 2
@"\01l__swift5_reflection_descriptor" = private constant { i32, i32, i32, i32, i32 } { i32 2, i32 0, i32 0, i32 trunc (i64 sub (i64 ptrtoint (<{ [7 x i8], i8 }>* @"symbolic SiIegy_" to i64), i64 ptrtoint (i32* getelementptr inbounds ({ i32, i32, i32, i32, i32 }, { i32, i32, i32, i32, i32 }* @"\01l__swift5_reflection_descriptor", i32 0, i32 3) to i64)) to i32), i32 trunc (i64 sub (i64 ptrtoint (<{ [2 x i8], i8 }>* @"symbolic Si" to i64), i64 ptrtoint (i32* getelementptr inbounds ({ i32, i32, i32, i32, i32 }, { i32, i32, i32, i32, i32 }* @"\01l__swift5_reflection_descriptor", i32 0, i32 4) to i64)) to i32) }, section "__TEXT,__swift5_capture, regular, no_dead_strip", align 4
@metadata = private constant %swift.full_boxmetadata { void (%swift.refcounted*)* @objectdestroy, i8** null, %swift.type { i64 1024 }, i32 16, i8* bitcast ({ i32, i32, i32, i32, i32 }* @"\01l__swift5_reflection_descriptor" to i8*) }, align 8
@_NSConcreteStackBlock = external global %objc_class
@0 = private unnamed_addr constant [6 x i8] c"v8@?0\00"
@block_descriptor = internal constant { i64, i64, void ({ %objc_block, %swift.function }*, { %objc_block, %swift.function }*)*, void ({ %objc_block, %swift.function }*)*, i8* } { i64 0, i64 48, void ({ %objc_block, %swift.function }*, { %objc_block, %swift.function }*)* @block_copy_helper, void ({ %objc_block, %swift.function }*)* @block_destroy_helper, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @0, i64 0, i64 0) }, align 8
@"\01l_entry_point" = private constant { i32 } { i32 trunc (i64 sub (i64 ptrtoint (i32 (i32, i8**)* @main to i64), i64 ptrtoint ({ i32 }* @"\01l_entry_point" to i64)) to i32) }, section "__TEXT, __swift5_entry, regular, no_dead_strip", align 4
@"$s4main7TeacherC16completionHandleySicSgvpWvd" = hidden constant i64 16, align 8
@"$sBoWV" = external global i8*, align 8
@"$s4main7TeacherCMm" = hidden global %objc_class { %objc_class* @"OBJC_METACLASS_$__TtCs12_SwiftObject", %objc_class* @"OBJC_METACLASS_$__TtCs12_SwiftObject", %swift.opaque* @_objc_empty_cache, %swift.opaque* null, i64 ptrtoint ({ i32, i32, i32, i32, i8*, i8*, i8*, i8*, i8*, i8*, i8* }* @_METACLASS_DATA__TtC4main7Teacher to i64) }, align 8
@"OBJC_CLASS_$__TtCs12_SwiftObject" = external global %objc_class, align 8
@_objc_empty_cache = external global %swift.opaque
@"OBJC_METACLASS_$__TtCs12_SwiftObject" = external global %objc_class, align 8
@1 = private unnamed_addr constant [18 x i8] c"_TtC4main7Teacher\00"
@_METACLASS_DATA__TtC4main7Teacher = internal constant { i32, i32, i32, i32, i8*, i8*, i8*, i8*, i8*, i8*, i8* } { i32 129, i32 40, i32 40, i32 0, i8* null, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @1, i64 0, i64 0), i8* null, i8* null, i8* null, i8* null, i8* null }, section "__DATA, __objc_const", align 8
@2 = private unnamed_addr constant [17 x i8] c"completionHandle\00"
@3 = private unnamed_addr constant [1 x i8] zeroinitializer
@_IVARS__TtC4main7Teacher = internal constant { i32, i32, [1 x { i64*, i8*, i8*, i32, i32 }] } { i32 32, i32 1, [1 x { i64*, i8*, i8*, i32, i32 }] [{ i64*, i8*, i8*, i32, i32 } { i64* @"$s4main7TeacherC16completionHandleySicSgvpWvd", i8* getelementptr inbounds ([17 x i8], [17 x i8]* @2, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @3, i64 0, i64 0), i32 3, i32 16 }] }, section "__DATA, __objc_const", align 8
@_DATA__TtC4main7Teacher = internal constant { i32, i32, i32, i32, i8*, i8*, i8*, i8*, { i32, i32, [1 x { i64*, i8*, i8*, i32, i32 }] }*, i8*, i8* } { i32 128, i32 16, i32 32, i32 0, i8* null, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @1, i64 0, i64 0), i8* null, i8* null, { i32, i32, [1 x { i64*, i8*, i8*, i32, i32 }] }* @_IVARS__TtC4main7Teacher, i8* null, i8* null }, section "__DATA, __objc_const", align 8
@4 = private constant [5 x i8] c"main\00"
@"$s4mainMXM" = linkonce_odr hidden constant <{ i32, i32, i32 }> <{ i32 0, i32 0, i32 trunc (i64 sub (i64 ptrtoint ([5 x i8]* @4 to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32 }>, <{ i32, i32, i32 }>* @"$s4mainMXM", i32 0, i32 2) to i64)) to i32) }>, section "__TEXT,__const", align 4
@5 = private constant [8 x i8] c"Teacher\00"
@"$s4main7TeacherCMn" = hidden constant <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }> <{ i32 -2147483568, i32 trunc (i64 sub (i64 ptrtoint (<{ i32, i32, i32 }>* @"$s4mainMXM" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main7TeacherCMn", i32 0, i32 1) to i64)) to i32), i32 trunc (i64 sub (i64 ptrtoint ([8 x i8]* @5 to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main7TeacherCMn", i32 0, i32 2) to i64)) to i32), i32 trunc (i64 sub (i64 ptrtoint (%swift.metadata_response (i64)* @"$s4main7TeacherCMa" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main7TeacherCMn", i32 0, i32 3) to i64)) to i32), i32 trunc (i64 sub (i64 ptrtoint ({ i32, i32, i16, i16, i32, i32, i32, i32 }* @"$s4main7TeacherCMF" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main7TeacherCMn", i32 0, i32 4) to i64)) to i32), i32 0, i32 2, i32 17, i32 7, i32 1, i32 10, i32 11, i32 6, %swift.method_descriptor { i32 18, i32 trunc (i64 sub (i64 ptrtoint ({ i64, i64 } (%T4main7TeacherC*)* @"$s4main7TeacherC16completionHandleySicSgvg" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main7TeacherCMn", i32 0, i32 13, i32 1) to i64)) to i32) }, %swift.method_descriptor { i32 19, i32 trunc (i64 sub (i64 ptrtoint (void (i64, i64, %T4main7TeacherC*)* @"$s4main7TeacherC16completionHandleySicSgvs" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main7TeacherCMn", i32 0, i32 14, i32 1) to i64)) to i32) }, %swift.method_descriptor { i32 20, i32 trunc (i64 sub (i64 ptrtoint ({ i8*, %TSiIegy_Sg* } (i8*, %T4main7TeacherC*)* @"$s4main7TeacherC16completionHandleySicSgvM" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main7TeacherCMn", i32 0, i32 15, i32 1) to i64)) to i32) }, %swift.method_descriptor { i32 16, i32 trunc (i64 sub (i64 ptrtoint (void (i64, i8*, %swift.refcounted*, %T4main7TeacherC*)* @"$s4main7TeacherC15makeIncrementer_6handleySi_ySictF" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main7TeacherCMn", i32 0, i32 16, i32 1) to i64)) to i32) }, %swift.method_descriptor { i32 16, i32 trunc (i64 sub (i64 ptrtoint (void (%T4main7TeacherC*)* @"$s4main7TeacherC11dosomethingyyF" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main7TeacherCMn", i32 0, i32 17, i32 1) to i64)) to i32) }, %swift.method_descriptor { i32 1, i32 trunc (i64 sub (i64 ptrtoint (%T4main7TeacherC* (%swift.type*)* @"$s4main7TeacherCACycfC" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main7TeacherCMn", i32 0, i32 18, i32 1) to i64)) to i32) } }>, section "__TEXT,__const", align 4
@"$s4main7TeacherCMf" = internal global <{ void (%T4main7TeacherC*)*, i8**, i64, %objc_class*, %swift.opaque*, %swift.opaque*, i64, i32, i32, i32, i16, i16, i32, i32, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>*, i8*, i64, { i64, i64 } (%T4main7TeacherC*)*, void (i64, i64, %T4main7TeacherC*)*, { i8*, %TSiIegy_Sg* } (i8*, %T4main7TeacherC*)*, void (i64, i8*, %swift.refcounted*, %T4main7TeacherC*)*, void (%T4main7TeacherC*)*, %T4main7TeacherC* (%swift.type*)* }> <{ void (%T4main7TeacherC*)* @"$s4main7TeacherCfD", i8** @"$sBoWV", i64 ptrtoint (%objc_class* @"$s4main7TeacherCMm" to i64), %objc_class* @"OBJC_CLASS_$__TtCs12_SwiftObject", %swift.opaque* @_objc_empty_cache, %swift.opaque* null, i64 add (i64 ptrtoint ({ i32, i32, i32, i32, i8*, i8*, i8*, i8*, { i32, i32, [1 x { i64*, i8*, i8*, i32, i32 }] }*, i8*, i8* }* @_DATA__TtC4main7Teacher to i64), i64 2), i32 2, i32 0, i32 32, i16 7, i16 0, i32 152, i32 16, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main7TeacherCMn", i8* null, i64 16, { i64, i64 } (%T4main7TeacherC*)* @"$s4main7TeacherC16completionHandleySicSgvg", void (i64, i64, %T4main7TeacherC*)* @"$s4main7TeacherC16completionHandleySicSgvs", { i8*, %TSiIegy_Sg* } (i8*, %T4main7TeacherC*)* @"$s4main7TeacherC16completionHandleySicSgvM", void (i64, i8*, %swift.refcounted*, %T4main7TeacherC*)* @"$s4main7TeacherC15makeIncrementer_6handleySi_ySictF", void (%T4main7TeacherC*)* @"$s4main7TeacherC11dosomethingyyF", %T4main7TeacherC* (%swift.type*)* @"$s4main7TeacherCACycfC" }>, align 8
@"symbolic _____ 4main7TeacherC" = linkonce_odr hidden constant <{ i8, i32, i8 }> <{ i8 1, i32 trunc (i64 sub (i64 ptrtoint (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main7TeacherCMn" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i8, i32, i8 }>, <{ i8, i32, i8 }>* @"symbolic _____ 4main7TeacherC", i32 0, i32 1) to i64)) to i32), i8 0 }>, section "__TEXT,__swift5_typeref, regular, no_dead_strip", align 2
@"symbolic ySicSg" = linkonce_odr hidden constant <{ [6 x i8], i8 }> <{ [6 x i8] c"ySicSg", i8 0 }>, section "__TEXT,__swift5_typeref, regular, no_dead_strip", align 2
@6 = private constant [17 x i8] c"completionHandle\00", section "__TEXT,__swift5_reflstr, regular, no_dead_strip"
@"$s4main7TeacherCMF" = internal constant { i32, i32, i16, i16, i32, i32, i32, i32 } { i32 trunc (i64 sub (i64 ptrtoint (<{ i8, i32, i8 }>* @"symbolic _____ 4main7TeacherC" to i64), i64 ptrtoint ({ i32, i32, i16, i16, i32, i32, i32, i32 }* @"$s4main7TeacherCMF" to i64)) to i32), i32 0, i16 1, i16 12, i32 1, i32 2, i32 trunc (i64 sub (i64 ptrtoint (<{ [6 x i8], i8 }>* @"symbolic ySicSg" to i64), i64 ptrtoint (i32* getelementptr inbounds ({ i32, i32, i16, i16, i32, i32, i32, i32 }, { i32, i32, i16, i16, i32, i32, i32, i32 }* @"$s4main7TeacherCMF", i32 0, i32 6) to i64)) to i32), i32 trunc (i64 sub (i64 ptrtoint ([17 x i8]* @6 to i64), i64 ptrtoint (i32* getelementptr inbounds ({ i32, i32, i16, i16, i32, i32, i32, i32 }, { i32, i32, i16, i16, i32, i32, i32, i32 }* @"$s4main7TeacherCMF", i32 0, i32 7) to i64)) to i32) }, section "__TEXT,__swift5_fieldmd, regular, no_dead_strip", align 4
@"_swift_FORCE_LOAD_$_swiftFoundation_$_main" = weak_odr hidden constant void ()* @"_swift_FORCE_LOAD_$_swiftFoundation"
@"_swift_FORCE_LOAD_$_swiftObjectiveC_$_main" = weak_odr hidden constant void ()* @"_swift_FORCE_LOAD_$_swiftObjectiveC"
@"_swift_FORCE_LOAD_$_swiftDarwin_$_main" = weak_odr hidden constant void ()* @"_swift_FORCE_LOAD_$_swiftDarwin"
@"_swift_FORCE_LOAD_$_swiftCoreFoundation_$_main" = weak_odr hidden constant void ()* @"_swift_FORCE_LOAD_$_swiftCoreFoundation"
@"_swift_FORCE_LOAD_$_swiftDispatch_$_main" = weak_odr hidden constant void ()* @"_swift_FORCE_LOAD_$_swiftDispatch"
@"_swift_FORCE_LOAD_$_swiftXPC_$_main" = weak_odr hidden constant void ()* @"_swift_FORCE_LOAD_$_swiftXPC"
@"_swift_FORCE_LOAD_$_swiftIOKit_$_main" = weak_odr hidden constant void ()* @"_swift_FORCE_LOAD_$_swiftIOKit"
@"_swift_FORCE_LOAD_$_swiftCoreGraphics_$_main" = weak_odr hidden constant void ()* @"_swift_FORCE_LOAD_$_swiftCoreGraphics"
@"$sypN" = external global %swift.full_type
@"$sSiN" = external global %swift.type, align 8
@7 = private unnamed_addr constant [2 x i8] c"\0A\00"
@8 = private unnamed_addr constant [2 x i8] c" \00"
@"$s8Dispatch0A13WorkItemFlagsVACs10SetAlgebraAAWL" = linkonce_odr hidden global i8** null, align 8
@"$s8Dispatch0A13WorkItemFlagsVs10SetAlgebraAAMc" = external global %swift.protocol_conformance_descriptor, align 4
@"$s8Dispatch0A13WorkItemFlagsVMn" = external global %swift.type_descriptor, align 4
@"got.$s8Dispatch0A13WorkItemFlagsVMn" = private unnamed_addr constant %swift.type_descriptor* @"$s8Dispatch0A13WorkItemFlagsVMn"
@"symbolic Say_____G 8Dispatch0A13WorkItemFlagsV" = linkonce_odr hidden constant <{ [3 x i8], i8, i32, [1 x i8], i8 }> <{ [3 x i8] c"Say", i8 2, i32 trunc (i64 sub (i64 ptrtoint (%swift.type_descriptor** @"got.$s8Dispatch0A13WorkItemFlagsVMn" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ [3 x i8], i8, i32, [1 x i8], i8 }>, <{ [3 x i8], i8, i32, [1 x i8], i8 }>* @"symbolic Say_____G 8Dispatch0A13WorkItemFlagsV", i32 0, i32 2) to i64)) to i32), [1 x i8] c"G", i8 0 }>, section "__TEXT,__swift5_typeref, regular, no_dead_strip", align 2
@"$sSay8Dispatch0A13WorkItemFlagsVGMD" = linkonce_odr hidden global { i32, i32 } { i32 trunc (i64 sub (i64 ptrtoint (<{ [3 x i8], i8, i32, [1 x i8], i8 }>* @"symbolic Say_____G 8Dispatch0A13WorkItemFlagsV" to i64), i64 ptrtoint ({ i32, i32 }* @"$sSay8Dispatch0A13WorkItemFlagsVGMD" to i64)) to i32), i32 -9 }, align 8
@"$sSay8Dispatch0A13WorkItemFlagsVGSayxGSTsWL" = linkonce_odr hidden global i8** null, align 8
@"$sSayxGSTsMc" = external global %swift.protocol_conformance_descriptor, align 4
@"$s8Dispatch0A3QoSV0B6SClassO7defaultyA2EmFWC" = external constant i32, align 4
@"\01l_type_metadata_table" = private constant [1 x %swift.type_metadata_record] [%swift.type_metadata_record { i32 trunc (i64 sub (i64 ptrtoint (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main7TeacherCMn" to i64), i64 ptrtoint ([1 x %swift.type_metadata_record]* @"\01l_type_metadata_table" to i64)) to i32) }], section "__TEXT, __swift5_types, regular, no_dead_strip", align 4
@__swift_reflection_version = linkonce_odr hidden constant i16 3
@objc_classes = internal global [1 x i8*] [i8* bitcast (%swift.type* @"$s4main7TeacherCN" to i8*)], section "__DATA,__objc_classlist,regular,no_dead_strip", align 8
@llvm.used = appending global [15 x i8*] [i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* bitcast ({ i32, i32, i32, i32, i32 }* @"\01l__swift5_reflection_descriptor" to i8*), i8* bitcast ({ i32 }* @"\01l_entry_point" to i8*), i8* bitcast ({ i32, i32, i16, i16, i32, i32, i32, i32 }* @"$s4main7TeacherCMF" to i8*), i8* bitcast (void ()** @"_swift_FORCE_LOAD_$_swiftFoundation_$_main" to i8*), i8* bitcast (void ()** @"_swift_FORCE_LOAD_$_swiftObjectiveC_$_main" to i8*), i8* bitcast (void ()** @"_swift_FORCE_LOAD_$_swiftDarwin_$_main" to i8*), i8* bitcast (void ()** @"_swift_FORCE_LOAD_$_swiftCoreFoundation_$_main" to i8*), i8* bitcast (void ()** @"_swift_FORCE_LOAD_$_swiftDispatch_$_main" to i8*), i8* bitcast (void ()** @"_swift_FORCE_LOAD_$_swiftXPC_$_main" to i8*), i8* bitcast (void ()** @"_swift_FORCE_LOAD_$_swiftIOKit_$_main" to i8*), i8* bitcast (void ()** @"_swift_FORCE_LOAD_$_swiftCoreGraphics_$_main" to i8*), i8* bitcast ([1 x %swift.type_metadata_record]* @"\01l_type_metadata_table" to i8*), i8* bitcast (i16* @__swift_reflection_version to i8*), i8* bitcast ([1 x i8*]* @objc_classes to i8*)], section "llvm.metadata", align 8
@llvm.compiler.used = appending global [1 x i8*] [i8* bitcast (%objc_class** @"OBJC_CLASS_REF_$_OS_dispatch_queue" to i8*)], section "llvm.metadata", align 8

@"$s4main7TeacherC16completionHandleySicSgvgTq" = hidden alias %swift.method_descriptor, getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main7TeacherCMn", i32 0, i32 13)
@"$s4main7TeacherC16completionHandleySicSgvsTq" = hidden alias %swift.method_descriptor, getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main7TeacherCMn", i32 0, i32 14)
@"$s4main7TeacherC16completionHandleySicSgvMTq" = hidden alias %swift.method_descriptor, getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main7TeacherCMn", i32 0, i32 15)
@"$s4main7TeacherC15makeIncrementer_6handleySi_ySictFTq" = hidden alias %swift.method_descriptor, getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main7TeacherCMn", i32 0, i32 16)
@"$s4main7TeacherC11dosomethingyyFTq" = hidden alias %swift.method_descriptor, getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main7TeacherCMn", i32 0, i32 17)
@"$s4main7TeacherCACycfCTq" = hidden alias %swift.method_descriptor, getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main7TeacherCMn", i32 0, i32 18)
@"$s4main7TeacherCN" = hidden alias %swift.type, bitcast (i64* getelementptr inbounds (<{ void (%T4main7TeacherC*)*, i8**, i64, %objc_class*, %swift.opaque*, %swift.opaque*, i64, i32, i32, i32, i16, i16, i32, i32, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>*, i8*, i64, { i64, i64 } (%T4main7TeacherC*)*, void (i64, i64, %T4main7TeacherC*)*, { i8*, %TSiIegy_Sg* } (i8*, %T4main7TeacherC*)*, void (i64, i8*, %swift.refcounted*, %T4main7TeacherC*)*, void (%T4main7TeacherC*)*, %T4main7TeacherC* (%swift.type*)* }>, <{ void (%T4main7TeacherC*)*, i8**, i64, %objc_class*, %swift.opaque*, %swift.opaque*, i64, i32, i32, i32, i16, i16, i32, i32, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>*, i8*, i64, { i64, i64 } (%T4main7TeacherC*)*, void (i64, i64, %T4main7TeacherC*)*, { i8*, %TSiIegy_Sg* } (i8*, %T4main7TeacherC*)*, void (i64, i8*, %swift.refcounted*, %T4main7TeacherC*)*, void (%T4main7TeacherC*)*, %T4main7TeacherC* (%swift.type*)* }>* @"$s4main7TeacherCMf", i32 0, i32 2) to %swift.type*)

define i32 @main(i32 %0, i8** %1) #0 {
entry:
  %access-scratch = alloca [24 x i8], align 8
  %access-scratch1 = alloca [24 x i8], align 8
  %2 = alloca %TSiIegy_Sg, align 8
  %3 = bitcast i8** %1 to i8*
  %4 = call swiftcc %swift.metadata_response @"$s4main7TeacherCMa"(i64 0) #10
  %5 = extractvalue %swift.metadata_response %4, 0
  %6 = call swiftcc %T4main7TeacherC* @"$s4main7TeacherCACycfC"(%swift.type* swiftself %5)
  store %T4main7TeacherC* %6, %T4main7TeacherC** @"$s4main1tAA7TeacherCvp", align 8
  %7 = bitcast [24 x i8]* %access-scratch to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %7)
  call void @swift_beginAccess(i8* bitcast (%T4main7TeacherC** @"$s4main1tAA7TeacherCvp" to i8*), [24 x i8]* %access-scratch, i64 32, i8* null) #4
  %8 = load %T4main7TeacherC*, %T4main7TeacherC** @"$s4main1tAA7TeacherCvp", align 8
  %9 = bitcast %T4main7TeacherC* %8 to %swift.refcounted*
  %10 = call %swift.refcounted* @swift_retain(%swift.refcounted* returned %9) #4
  call void @swift_endAccess([24 x i8]* %access-scratch) #4
  %11 = bitcast [24 x i8]* %access-scratch to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %11)
  %12 = getelementptr inbounds %T4main7TeacherC, %T4main7TeacherC* %8, i32 0, i32 0, i32 0
  %13 = load %swift.type*, %swift.type** %12, align 8
  %14 = bitcast %swift.type* %13 to void (%T4main7TeacherC*)**
  %15 = getelementptr inbounds void (%T4main7TeacherC*)*, void (%T4main7TeacherC*)** %14, i64 15
  %16 = load void (%T4main7TeacherC*)*, void (%T4main7TeacherC*)** %15, align 8, !invariant.load !45
  call swiftcc void %16(%T4main7TeacherC* swiftself %8)
  call void bitcast (void (%swift.refcounted*)* @swift_release to void (%T4main7TeacherC*)*)(%T4main7TeacherC* %8) #4
  %17 = bitcast [24 x i8]* %access-scratch1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %17)
  call void @swift_beginAccess(i8* bitcast (%T4main7TeacherC** @"$s4main1tAA7TeacherCvp" to i8*), [24 x i8]* %access-scratch1, i64 32, i8* null) #4
  %18 = load %T4main7TeacherC*, %T4main7TeacherC** @"$s4main1tAA7TeacherCvp", align 8
  %19 = bitcast %T4main7TeacherC* %18 to %swift.refcounted*
  %20 = call %swift.refcounted* @swift_retain(%swift.refcounted* returned %19) #4
  call void @swift_endAccess([24 x i8]* %access-scratch1) #4
  %21 = bitcast [24 x i8]* %access-scratch1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %21)
  %22 = bitcast %TSiIegy_Sg* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* %22)
  %23 = getelementptr inbounds %T4main7TeacherC, %T4main7TeacherC* %18, i32 0, i32 0, i32 0
  %24 = load %swift.type*, %swift.type** %23, align 8
  %25 = bitcast %swift.type* %24 to { i64, i64 } (%T4main7TeacherC*)**
  %26 = getelementptr inbounds { i64, i64 } (%T4main7TeacherC*)*, { i64, i64 } (%T4main7TeacherC*)** %25, i64 11
  %27 = load { i64, i64 } (%T4main7TeacherC*)*, { i64, i64 } (%T4main7TeacherC*)** %26, align 8, !invariant.load !45
  %28 = call swiftcc { i64, i64 } %27(%T4main7TeacherC* swiftself %18)
  %29 = extractvalue { i64, i64 } %28, 0
  %30 = extractvalue { i64, i64 } %28, 1
  %31 = bitcast %TSiIegy_Sg* %2 to { i64, i64 }*
  %32 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %31, i32 0, i32 0
  store i64 %29, i64* %32, align 8
  %33 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %31, i32 0, i32 1
  store i64 %30, i64* %33, align 8
  %34 = bitcast %TSiIegy_Sg* %2 to { i64, i64 }*
  %35 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %34, i32 0, i32 0
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %34, i32 0, i32 1
  %38 = load i64, i64* %37, align 8
  %39 = icmp eq i64 %36, 0
  %40 = xor i1 %39, true
  br i1 %40, label %44, label %41

41:                                               ; preds = %entry
  %42 = call %TSiIegy_Sg* @"$sSiIegy_SgWOh"(%TSiIegy_Sg* %2)
  %43 = bitcast %TSiIegy_Sg* %2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 16, i8* %43)
  call void bitcast (void (%swift.refcounted*)* @swift_release to void (%T4main7TeacherC*)*)(%T4main7TeacherC* %18) #4
  br label %52

44:                                               ; preds = %entry
  %45 = bitcast %TSiIegy_Sg* %2 to %swift.function*
  %.fn = getelementptr inbounds %swift.function, %swift.function* %45, i32 0, i32 0
  %46 = load i8*, i8** %.fn, align 8
  %.data = getelementptr inbounds %swift.function, %swift.function* %45, i32 0, i32 1
  %47 = load %swift.refcounted*, %swift.refcounted** %.data, align 8
  %48 = call %swift.refcounted* @swift_retain(%swift.refcounted* returned %47) #4
  %49 = call %TSiIegy_Sg* @"$sSiIegy_SgWOh"(%TSiIegy_Sg* %2)
  call void bitcast (void (%swift.refcounted*)* @swift_release to void (%T4main7TeacherC*)*)(%T4main7TeacherC* %18) #4
  %50 = bitcast i8* %46 to void (i64, %swift.refcounted*)*
  call swiftcc void %50(i64 10, %swift.refcounted* swiftself %47)
  call void @swift_release(%swift.refcounted* %47) #4
  %51 = bitcast %TSiIegy_Sg* %2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 16, i8* %51)
  br label %52

52:                                               ; preds = %44, %41
  %53 = phi i1 [ true, %41 ], [ false, %44 ]
  ret i32 0
}

; Function Attrs: noinline nounwind readnone
define hidden swiftcc %swift.metadata_response @"$s4main7TeacherCMa"(i64 %0) #1 {
entry:
  %1 = call %objc_class* @objc_opt_self(%objc_class* bitcast (i64* getelementptr inbounds (<{ void (%T4main7TeacherC*)*, i8**, i64, %objc_class*, %swift.opaque*, %swift.opaque*, i64, i32, i32, i32, i16, i16, i32, i32, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>*, i8*, i64, { i64, i64 } (%T4main7TeacherC*)*, void (i64, i64, %T4main7TeacherC*)*, { i8*, %TSiIegy_Sg* } (i8*, %T4main7TeacherC*)*, void (i64, i8*, %swift.refcounted*, %T4main7TeacherC*)*, void (%T4main7TeacherC*)*, %T4main7TeacherC* (%swift.type*)* }>, <{ void (%T4main7TeacherC*)*, i8**, i64, %objc_class*, %swift.opaque*, %swift.opaque*, i64, i32, i32, i32, i16, i16, i32, i32, <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>*, i8*, i64, { i64, i64 } (%T4main7TeacherC*)*, void (i64, i64, %T4main7TeacherC*)*, { i8*, %TSiIegy_Sg* } (i8*, %T4main7TeacherC*)*, void (i64, i8*, %swift.refcounted*, %T4main7TeacherC*)*, void (%T4main7TeacherC*)*, %T4main7TeacherC* (%swift.type*)* }>* @"$s4main7TeacherCMf", i32 0, i32 2) to %objc_class*))
  %2 = bitcast %objc_class* %1 to %swift.type*
  %3 = insertvalue %swift.metadata_response undef, %swift.type* %2, 0
  %4 = insertvalue %swift.metadata_response %3, i64 0, 1
  ret %swift.metadata_response %4
}

define hidden swiftcc { i64, i64 } @"$s4main7TeacherC16completionHandleySicSgvpfi"() #0 {
entry:
  ret { i64, i64 } zeroinitializer
}

define hidden swiftcc { i64, i64 } @"$s4main7TeacherC16completionHandleySicSgvg"(%T4main7TeacherC* swiftself %0) #0 {
entry:
  %access-scratch = alloca [24 x i8], align 8
  %1 = getelementptr inbounds %T4main7TeacherC, %T4main7TeacherC* %0, i32 0, i32 1
  %2 = bitcast [24 x i8]* %access-scratch to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %2)
  %3 = bitcast %TSiIegy_Sg* %1 to i8*
  call void @swift_beginAccess(i8* %3, [24 x i8]* %access-scratch, i64 32, i8* null) #4
  %4 = bitcast %TSiIegy_Sg* %1 to { i64, i64 }*
  %5 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %4, i32 0, i32 0
  %6 = load i64, i64* %5, align 8
  %7 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %4, i32 0, i32 1
  %8 = load i64, i64* %7, align 8
  call void @"$sSiIegy_SgWOy"(i64 %6, i64 %8)
  call void @swift_endAccess([24 x i8]* %access-scratch) #4
  %9 = bitcast [24 x i8]* %access-scratch to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %9)
  %10 = insertvalue { i64, i64 } undef, i64 %6, 0
  %11 = insertvalue { i64, i64 } %10, i64 %8, 1
  ret { i64, i64 } %11
}

define hidden swiftcc void @"$s4main7TeacherC16completionHandleySicSgvs"(i64 %0, i64 %1, %T4main7TeacherC* swiftself %2) #0 {
entry:
  %access-scratch = alloca [24 x i8], align 8
  call void @"$sSiIegy_SgWOy"(i64 %0, i64 %1)
  %3 = getelementptr inbounds %T4main7TeacherC, %T4main7TeacherC* %2, i32 0, i32 1
  %4 = bitcast [24 x i8]* %access-scratch to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %4)
  %5 = bitcast %TSiIegy_Sg* %3 to i8*
  call void @swift_beginAccess(i8* %5, [24 x i8]* %access-scratch, i64 33, i8* null) #4
  %6 = bitcast %TSiIegy_Sg* %3 to { i64, i64 }*
  %7 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %6, i32 0, i32 0
  %8 = load i64, i64* %7, align 8
  %9 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %6, i32 0, i32 1
  %10 = load i64, i64* %9, align 8
  %11 = bitcast %TSiIegy_Sg* %3 to { i64, i64 }*
  %12 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %11, i32 0, i32 0
  store i64 %0, i64* %12, align 8
  %13 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %11, i32 0, i32 1
  store i64 %1, i64* %13, align 8
  call void @"$sSiIegy_SgWOe"(i64 %8, i64 %10)
  call void @swift_endAccess([24 x i8]* %access-scratch) #4
  %14 = bitcast [24 x i8]* %access-scratch to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %14)
  call void @"$sSiIegy_SgWOe"(i64 %0, i64 %1)
  ret void
}

; Function Attrs: noinline
define hidden swiftcc { i8*, %TSiIegy_Sg* } @"$s4main7TeacherC16completionHandleySicSgvM"(i8* noalias dereferenceable(32) %0, %T4main7TeacherC* swiftself %1) #2 {
entry:
  %FramePtr = bitcast i8* %0 to %"$s4main7TeacherC16completionHandleySicSgvM.Frame"*
  %access-scratch = getelementptr inbounds %"$s4main7TeacherC16completionHandleySicSgvM.Frame", %"$s4main7TeacherC16completionHandleySicSgvM.Frame"* %FramePtr, i32 0, i32 0
  %2 = getelementptr inbounds %T4main7TeacherC, %T4main7TeacherC* %1, i32 0, i32 1
  %3 = bitcast [24 x i8]* %access-scratch to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %3)
  %4 = bitcast %TSiIegy_Sg* %2 to i8*
  call void @swift_beginAccess(i8* %4, [24 x i8]* %access-scratch, i64 33, i8* null) #4
  %5 = insertvalue { i8*, %TSiIegy_Sg* } { i8* bitcast (void (i8*, i1)* @"$s4main7TeacherC16completionHandleySicSgvM.resume.0" to i8*), %TSiIegy_Sg* undef }, %TSiIegy_Sg* %2, 1
  ret { i8*, %TSiIegy_Sg* } %5
}

define internal swiftcc void @"$s4main7TeacherC16completionHandleySicSgvM.resume.0"(i8* noalias nonnull align 8 dereferenceable(32) %0, i1 %1) #0 {
entryresume.0:
  %FramePtr = bitcast i8* %0 to %"$s4main7TeacherC16completionHandleySicSgvM.Frame"*
  %vFrame = bitcast %"$s4main7TeacherC16completionHandleySicSgvM.Frame"* %FramePtr to i8*
  %access-scratch = getelementptr inbounds %"$s4main7TeacherC16completionHandleySicSgvM.Frame", %"$s4main7TeacherC16completionHandleySicSgvM.Frame"* %FramePtr, i32 0, i32 0
  br i1 %1, label %4, label %2

2:                                                ; preds = %entryresume.0
  call void @swift_endAccess([24 x i8]* %access-scratch) #4
  %3 = bitcast [24 x i8]* %access-scratch to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %3)
  br label %CoroEnd

4:                                                ; preds = %entryresume.0
  call void @swift_endAccess([24 x i8]* %access-scratch) #4
  %5 = bitcast [24 x i8]* %access-scratch to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %5)
  br label %CoroEnd

CoroEnd:                                          ; preds = %2, %4
  ret void
}

define hidden swiftcc void @"$s4main7TeacherC15makeIncrementer_6handleySi_ySictF"(i64 %0, i8* %1, %swift.refcounted* %2, %T4main7TeacherC* swiftself %3) #0 {
entry:
  %amout.debug = alloca i64, align 8
  %4 = bitcast i64* %amout.debug to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %4, i8 0, i64 8, i1 false)
  %handle.debug = alloca %swift.function, align 8
  %5 = bitcast %swift.function* %handle.debug to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %5, i8 0, i64 16, i1 false)
  %self.debug = alloca %T4main7TeacherC*, align 8
  %6 = bitcast %T4main7TeacherC** %self.debug to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %6, i8 0, i64 8, i1 false)
  %7 = alloca %TSi, align 8
  %8 = bitcast %TSi* %7 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %8, i8 0, i64 8, i1 false)
  %9 = alloca { %objc_block, %swift.function }, align 8
  %10 = call swiftcc %swift.metadata_response @"$s8Dispatch0A13WorkItemFlagsVMa"(i64 0) #10
  %11 = extractvalue %swift.metadata_response %10, 0
  %12 = bitcast %swift.type* %11 to i8***
  %13 = getelementptr inbounds i8**, i8*** %12, i64 -1
  %.valueWitnesses = load i8**, i8*** %13, align 8, !invariant.load !45, !dereferenceable !46
  %14 = bitcast i8** %.valueWitnesses to %swift.vwtable*
  %15 = getelementptr inbounds %swift.vwtable, %swift.vwtable* %14, i32 0, i32 8
  %size = load i64, i64* %15, align 8, !invariant.load !45
  %16 = alloca i8, i64 %size, align 16
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %16)
  %17 = bitcast i8* %16 to %swift.opaque*
  %18 = call swiftcc %swift.metadata_response @"$s8Dispatch0A3QoSVMa"(i64 0) #10
  %19 = extractvalue %swift.metadata_response %18, 0
  %20 = bitcast %swift.type* %19 to i8***
  %21 = getelementptr inbounds i8**, i8*** %20, i64 -1
  %.valueWitnesses1 = load i8**, i8*** %21, align 8, !invariant.load !45, !dereferenceable !46
  %22 = bitcast i8** %.valueWitnesses1 to %swift.vwtable*
  %23 = getelementptr inbounds %swift.vwtable, %swift.vwtable* %22, i32 0, i32 8
  %size2 = load i64, i64* %23, align 8, !invariant.load !45
  %24 = alloca i8, i64 %size2, align 16
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %24)
  %25 = bitcast i8* %24 to %swift.opaque*
  %26 = call swiftcc %swift.metadata_response @"$s8Dispatch0A4TimeVMa"(i64 0) #10
  %27 = extractvalue %swift.metadata_response %26, 0
  %28 = bitcast %swift.type* %27 to i8***
  %29 = getelementptr inbounds i8**, i8*** %28, i64 -1
  %.valueWitnesses3 = load i8**, i8*** %29, align 8, !invariant.load !45, !dereferenceable !46
  %30 = bitcast i8** %.valueWitnesses3 to %swift.vwtable*
  %31 = getelementptr inbounds %swift.vwtable, %swift.vwtable* %30, i32 0, i32 8
  %size4 = load i64, i64* %31, align 8, !invariant.load !45
  %32 = alloca i8, i64 %size4, align 16
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %32)
  %33 = bitcast i8* %32 to %swift.opaque*
  %34 = call swiftcc %swift.metadata_response @"$s8Dispatch0A3QoSV0B6SClassOMa"(i64 0) #10
  %35 = extractvalue %swift.metadata_response %34, 0
  %36 = bitcast %swift.type* %35 to i8***
  %37 = getelementptr inbounds i8**, i8*** %36, i64 -1
  %.valueWitnesses5 = load i8**, i8*** %37, align 8, !invariant.load !45, !dereferenceable !46
  %38 = bitcast i8** %.valueWitnesses5 to %swift.vwtable*
  %39 = getelementptr inbounds %swift.vwtable, %swift.vwtable* %38, i32 0, i32 8
  %size6 = load i64, i64* %39, align 8, !invariant.load !45
  %40 = alloca i8, i64 %size6, align 16
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %40)
  %41 = bitcast i8* %40 to %swift.opaque*
  store i64 %0, i64* %amout.debug, align 8
  %42 = bitcast %swift.function* %handle.debug to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* %42)
  %handle.debug.fn = getelementptr inbounds %swift.function, %swift.function* %handle.debug, i32 0, i32 0
  store i8* %1, i8** %handle.debug.fn, align 8
  %handle.debug.data = getelementptr inbounds %swift.function, %swift.function* %handle.debug, i32 0, i32 1
  store %swift.refcounted* %2, %swift.refcounted** %handle.debug.data, align 8
  store %T4main7TeacherC* %3, %T4main7TeacherC** %self.debug, align 8
  %43 = bitcast %TSi* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %43)
  %._value = getelementptr inbounds %TSi, %TSi* %7, i32 0, i32 0
  store i64 10, i64* %._value, align 8
  %44 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 10, i64 %0)
  %45 = extractvalue { i64, i1 } %44, 0
  %46 = extractvalue { i64, i1 } %44, 1
  %47 = call i1 @llvm.expect.i1(i1 %46, i1 false)
  br i1 %47, label %83, label %48

48:                                               ; preds = %entry
  %._value7 = getelementptr inbounds %TSi, %TSi* %7, i32 0, i32 0
  store i64 %45, i64* %._value7, align 8
  %49 = call swiftcc %swift.metadata_response @"$sSo17OS_dispatch_queueCMa"(i64 0) #10
  %50 = extractvalue %swift.metadata_response %49, 0
  call swiftcc void @"$sSo17OS_dispatch_queueC8DispatchE6global3qosAbC0D3QoSV0G6SClassO_tFZfA_"(%swift.opaque* noalias nocapture sret(%swift.opaque) %41)
  %51 = call swiftcc %TSo17OS_dispatch_queueC* @"$sSo17OS_dispatch_queueC8DispatchE6global3qosAbC0D3QoSV0G6SClassO_tFZ"(%swift.opaque* noalias nocapture %41, %swift.type* swiftself %50)
  %52 = getelementptr inbounds i8*, i8** %.valueWitnesses5, i32 1
  %53 = load i8*, i8** %52, align 8, !invariant.load !45
  %destroy = bitcast i8* %53 to void (%swift.opaque*, %swift.type*)*
  call void %destroy(%swift.opaque* noalias %41, %swift.type* %35) #4
  call swiftcc void @"$s8Dispatch0A4TimeV3nowACyFZ"(%swift.opaque* noalias nocapture sret(%swift.opaque) %33)
  %54 = call %swift.refcounted* @swift_retain(%swift.refcounted* returned %2) #4
  %55 = call noalias %swift.refcounted* @swift_allocObject(%swift.type* getelementptr inbounds (%swift.full_boxmetadata, %swift.full_boxmetadata* @metadata, i32 0, i32 2), i64 40, i64 7) #4
  %56 = bitcast %swift.refcounted* %55 to <{ %swift.refcounted, %swift.function, %TSi }>*
  %57 = getelementptr inbounds <{ %swift.refcounted, %swift.function, %TSi }>, <{ %swift.refcounted, %swift.function, %TSi }>* %56, i32 0, i32 1
  %.fn = getelementptr inbounds %swift.function, %swift.function* %57, i32 0, i32 0
  store i8* %1, i8** %.fn, align 8
  %.data = getelementptr inbounds %swift.function, %swift.function* %57, i32 0, i32 1
  store %swift.refcounted* %2, %swift.refcounted** %.data, align 8
  %58 = getelementptr inbounds <{ %swift.refcounted, %swift.function, %TSi }>, <{ %swift.refcounted, %swift.function, %TSi }>* %56, i32 0, i32 2
  %._value8 = getelementptr inbounds %TSi, %TSi* %58, i32 0, i32 0
  store i64 %45, i64* %._value8, align 8
  %59 = bitcast { %objc_block, %swift.function }* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 48, i8* %59)
  %60 = getelementptr inbounds { %objc_block, %swift.function }, { %objc_block, %swift.function }* %9, i32 0, i32 1
  %.fn9 = getelementptr inbounds %swift.function, %swift.function* %60, i32 0, i32 0
  store i8* bitcast (void (%swift.refcounted*)* @"$s4main7TeacherC15makeIncrementer_6handleySi_ySictFyycfU_Tf2ni_nTA" to i8*), i8** %.fn9, align 8
  %.data10 = getelementptr inbounds %swift.function, %swift.function* %60, i32 0, i32 1
  store %swift.refcounted* %55, %swift.refcounted** %.data10, align 8
  %61 = getelementptr inbounds { %objc_block, %swift.function }, { %objc_block, %swift.function }* %9, i32 0, i32 0
  %62 = getelementptr inbounds %objc_block, %objc_block* %61, i32 0, i32 0
  store %objc_class* @_NSConcreteStackBlock, %objc_class** %62, align 8
  %63 = getelementptr inbounds %objc_block, %objc_block* %61, i32 0, i32 1
  store i32 1107296256, i32* %63, align 8
  %64 = getelementptr inbounds %objc_block, %objc_block* %61, i32 0, i32 2
  store i32 0, i32* %64, align 4
  %65 = getelementptr inbounds %objc_block, %objc_block* %61, i32 0, i32 3
  store i8* bitcast (void (void (...)*)* @"$sIeg_IeyB_TR" to i8*), i8** %65, align 8
  %66 = getelementptr inbounds %objc_block, %objc_block* %61, i32 0, i32 4
  store i8* bitcast ({ i64, i64, void ({ %objc_block, %swift.function }*, { %objc_block, %swift.function }*)*, void ({ %objc_block, %swift.function }*)*, i8* }* @block_descriptor to i8*), i8** %66, align 8
  %67 = bitcast { %objc_block, %swift.function }* %9 to %objc_block*
  %68 = call %objc_block* @_Block_copy(%objc_block* %67)
  call swiftcc void @"$sSo17OS_dispatch_queueC8DispatchE10asyncAfter8deadline3qos5flags7executeyAC0D4TimeV_AC0D3QoSVAC0D13WorkItemFlagsVyyXBtFfA0_"(%swift.opaque* noalias nocapture sret(%swift.opaque) %25)
  call swiftcc void @"$sSo17OS_dispatch_queueC8DispatchE10asyncAfter8deadline3qos5flags7executeyAC0D4TimeV_AC0D3QoSVAC0D13WorkItemFlagsVyyXBtFfA1_"(%swift.opaque* noalias nocapture sret(%swift.opaque) %17)
  call swiftcc void @"$sSo17OS_dispatch_queueC8DispatchE10asyncAfter8deadline3qos5flags7executeyAC0D4TimeV_AC0D3QoSVAC0D13WorkItemFlagsVyyXBtF"(%swift.opaque* noalias nocapture %33, %swift.opaque* noalias nocapture %25, %swift.opaque* noalias nocapture %17, %objc_block* %68, %TSo17OS_dispatch_queueC* swiftself %51)
  %69 = getelementptr inbounds i8*, i8** %.valueWitnesses, i32 1
  %70 = load i8*, i8** %69, align 8, !invariant.load !45
  %destroy11 = bitcast i8* %70 to void (%swift.opaque*, %swift.type*)*
  call void %destroy11(%swift.opaque* noalias %17, %swift.type* %11) #4
  %71 = getelementptr inbounds i8*, i8** %.valueWitnesses1, i32 1
  %72 = load i8*, i8** %71, align 8, !invariant.load !45
  %destroy12 = bitcast i8* %72 to void (%swift.opaque*, %swift.type*)*
  call void %destroy12(%swift.opaque* noalias %25, %swift.type* %19) #4
  call void @_Block_release(%objc_block* %68) #4
  %.data13 = getelementptr inbounds %swift.function, %swift.function* %60, i32 0, i32 1
  %73 = load %swift.refcounted*, %swift.refcounted** %.data13, align 8
  call void @swift_release(%swift.refcounted* %73) #4
  %74 = bitcast { %objc_block, %swift.function }* %9 to i8*
  call void @llvm.lifetime.end.p0i8(i64 48, i8* %74)
  %75 = getelementptr inbounds i8*, i8** %.valueWitnesses3, i32 1
  %76 = load i8*, i8** %75, align 8, !invariant.load !45
  %destroy14 = bitcast i8* %76 to void (%swift.opaque*, %swift.type*)*
  call void %destroy14(%swift.opaque* noalias %33, %swift.type* %27) #4
  %77 = bitcast %TSo17OS_dispatch_queueC* %51 to i8*
  call void @llvm.objc.release(i8* %77)
  %78 = bitcast %TSi* %7 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %78)
  %79 = bitcast %swift.opaque* %41 to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %79)
  %80 = bitcast %swift.opaque* %33 to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %80)
  %81 = bitcast %swift.opaque* %25 to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %81)
  %82 = bitcast %swift.opaque* %17 to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %82)
  ret void

83:                                               ; preds = %entry
  call void @llvm.trap()
  unreachable
}

define linkonce_odr hidden swiftcc void @"$sSo17OS_dispatch_queueC8DispatchE6global3qosAbC0D3QoSV0G6SClassO_tFZfA_"(%swift.opaque* noalias nocapture sret(%swift.opaque) %0) #0 {
entry:
  %1 = load i32, i32* @"$s8Dispatch0A3QoSV0B6SClassO7defaultyA2EmFWC", align 4
  %2 = call swiftcc %swift.metadata_response @"$s8Dispatch0A3QoSV0B6SClassOMa"(i64 0) #10
  %3 = extractvalue %swift.metadata_response %2, 0
  %4 = bitcast %swift.type* %3 to i8***
  %5 = getelementptr inbounds i8**, i8*** %4, i64 -1
  %.valueWitnesses = load i8**, i8*** %5, align 8, !invariant.load !45, !dereferenceable !46
  %6 = getelementptr inbounds i8*, i8** %.valueWitnesses, i32 13
  %7 = load i8*, i8** %6, align 8, !invariant.load !45
  %destructiveInjectEnumTag = bitcast i8* %7 to void (%swift.opaque*, i32, %swift.type*)*
  call void %destructiveInjectEnumTag(%swift.opaque* noalias %0, i32 %1, %swift.type* %3) #4
  ret void
}

define internal swiftcc void @"$s4main7TeacherC15makeIncrementer_6handleySi_ySictFyycfU_Tf2ni_n"(i8* %0, %swift.refcounted* %1, i64 %2) #0 {
entry:
  %handle.debug = alloca %swift.function, align 8
  %3 = bitcast %swift.function* %handle.debug to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %3, i8 0, i64 16, i1 false)
  %runningTool.debug = alloca i64, align 8
  %4 = bitcast i64* %runningTool.debug to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %4, i8 0, i64 8, i1 false)
  %5 = bitcast %swift.function* %handle.debug to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* %5)
  %handle.debug.fn = getelementptr inbounds %swift.function, %swift.function* %handle.debug, i32 0, i32 0
  store i8* %0, i8** %handle.debug.fn, align 8
  %handle.debug.data = getelementptr inbounds %swift.function, %swift.function* %handle.debug, i32 0, i32 1
  store %swift.refcounted* %1, %swift.refcounted** %handle.debug.data, align 8
  store i64 %2, i64* %runningTool.debug, align 8
  %6 = call %swift.refcounted* @swift_retain(%swift.refcounted* returned %1) #4
  %7 = bitcast i8* %0 to void (i64, %swift.refcounted*)*
  call swiftcc void %7(i64 %2, %swift.refcounted* swiftself %1)
  call void @swift_release(%swift.refcounted* %1) #4
  ret void
}

define linkonce_odr hidden void @"$sIeg_IeyB_TR"(void (...)* %0) #0 {
entry:
  %1 = bitcast void (...)* %0 to { %objc_block, %swift.function }*
  %2 = getelementptr inbounds { %objc_block, %swift.function }, { %objc_block, %swift.function }* %1, i32 0, i32 1
  %.fn = getelementptr inbounds %swift.function, %swift.function* %2, i32 0, i32 0
  %3 = load i8*, i8** %.fn, align 8
  %.data = getelementptr inbounds %swift.function, %swift.function* %2, i32 0, i32 1
  %4 = load %swift.refcounted*, %swift.refcounted** %.data, align 8
  %5 = call %swift.refcounted* @swift_retain(%swift.refcounted* returned %4) #4
  %6 = bitcast i8* %3 to void (%swift.refcounted*)*
  call swiftcc void %6(%swift.refcounted* swiftself %4) #14
  call void @swift_release(%swift.refcounted* %4) #4
  ret void
}

define linkonce_odr hidden swiftcc void @"$sSo17OS_dispatch_queueC8DispatchE10asyncAfter8deadline3qos5flags7executeyAC0D4TimeV_AC0D3QoSVAC0D13WorkItemFlagsVyyXBtFfA0_"(%swift.opaque* noalias nocapture sret(%swift.opaque) %0) #0 {
entry:
  call swiftcc void @"$s8Dispatch0A3QoSV11unspecifiedACvgZ"(%swift.opaque* noalias nocapture sret(%swift.opaque) %0)
  ret void
}

define linkonce_odr hidden swiftcc void @"$sSo17OS_dispatch_queueC8DispatchE10asyncAfter8deadline3qos5flags7executeyAC0D4TimeV_AC0D3QoSVAC0D13WorkItemFlagsVyyXBtFfA1_"(%swift.opaque* noalias nocapture sret(%swift.opaque) %0) #0 {
entry:
  %1 = alloca %TSa, align 8
  %2 = call swiftcc { %swift.bridge*, i8* } @"$sSa22_allocateUninitializedySayxG_SpyxGtSiFZ8Dispatch0C13WorkItemFlagsV_Tgq5"(i64 0)
  %3 = extractvalue { %swift.bridge*, i8* } %2, 0
  %4 = extractvalue { %swift.bridge*, i8* } %2, 1
  %5 = call swiftcc %swift.metadata_response @"$s8Dispatch0A13WorkItemFlagsVMa"(i64 0) #10
  %6 = extractvalue %swift.metadata_response %5, 0
  %7 = bitcast %TSa* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7)
  %._buffer = getelementptr inbounds %TSa, %TSa* %1, i32 0, i32 0
  %._buffer._storage = getelementptr inbounds %Ts12_ArrayBufferV, %Ts12_ArrayBufferV* %._buffer, i32 0, i32 0
  %._buffer._storage.rawValue = getelementptr inbounds %Ts14_BridgeStorageV, %Ts14_BridgeStorageV* %._buffer._storage, i32 0, i32 0
  store %swift.bridge* %3, %swift.bridge** %._buffer._storage.rawValue, align 8
  %8 = call i8** @"$s8Dispatch0A13WorkItemFlagsVACs10SetAlgebraAAWl"() #10
  %9 = bitcast %TSa* %1 to %swift.opaque*
  %10 = call %swift.type* @__swift_instantiateConcreteTypeFromMangledName({ i32, i32 }* @"$sSay8Dispatch0A13WorkItemFlagsVGMD") #10
  %11 = call i8** @"$sSay8Dispatch0A13WorkItemFlagsVGSayxGSTsWl"() #10
  call swiftcc void @"$ss10SetAlgebraPyxqd__ncSTRd__7ElementQyd__ACRtzlufCTj"(%swift.opaque* noalias nocapture sret(%swift.opaque) %0, %swift.opaque* noalias nocapture %9, %swift.type* %10, i8** %11, %swift.type* swiftself %6, %swift.type* %6, i8** %8)
  %12 = bitcast %TSa* %1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %12)
  ret void
}

define hidden swiftcc void @"$s4main7TeacherC11dosomethingyyF"(%T4main7TeacherC* swiftself %0) #0 {
entry:
  %self.debug = alloca %T4main7TeacherC*, align 8
  %1 = bitcast %T4main7TeacherC** %self.debug to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %1, i8 0, i64 8, i1 false)
  store %T4main7TeacherC* %0, %T4main7TeacherC** %self.debug, align 8
  %2 = getelementptr inbounds %T4main7TeacherC, %T4main7TeacherC* %0, i32 0, i32 0, i32 0
  %3 = load %swift.type*, %swift.type** %2, align 8
  %4 = bitcast %swift.type* %3 to void (i64, i8*, %swift.refcounted*, %T4main7TeacherC*)**
  %5 = getelementptr inbounds void (i64, i8*, %swift.refcounted*, %T4main7TeacherC*)*, void (i64, i8*, %swift.refcounted*, %T4main7TeacherC*)** %4, i64 14
  %6 = load void (i64, i8*, %swift.refcounted*, %T4main7TeacherC*)*, void (i64, i8*, %swift.refcounted*, %T4main7TeacherC*)** %5, align 8, !invariant.load !45
  call swiftcc void %6(i64 10, i8* bitcast (void (i64)* @"$s4main7TeacherC11dosomethingyyFySicfU_" to i8*), %swift.refcounted* null, %T4main7TeacherC* swiftself %0)
  ret void
}

define internal swiftcc void @"$s4main7TeacherC11dosomethingyyFySicfU_"(i64 %0) #0 {
entry:
  %"$0.debug" = alloca i64, align 8
  %1 = bitcast i64* %"$0.debug" to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %1, i8 0, i64 8, i1 false)
  store i64 %0, i64* %"$0.debug", align 8
  %2 = call swiftcc { %swift.bridge*, i8* } @"$ss27_allocateUninitializedArrayySayxG_BptBwlF"(i64 1, %swift.type* getelementptr inbounds (%swift.full_type, %swift.full_type* @"$sypN", i32 0, i32 1))
  %3 = extractvalue { %swift.bridge*, i8* } %2, 0
  %4 = extractvalue { %swift.bridge*, i8* } %2, 1
  %5 = bitcast i8* %4 to %Any*
  %6 = getelementptr inbounds %Any, %Any* %5, i32 0, i32 1
  store %swift.type* @"$sSiN", %swift.type** %6, align 8
  %7 = getelementptr inbounds %Any, %Any* %5, i32 0, i32 0
  %8 = getelementptr inbounds %Any, %Any* %5, i32 0, i32 0
  %9 = bitcast [24 x i8]* %8 to %TSi*
  %._value = getelementptr inbounds %TSi, %TSi* %9, i32 0, i32 0
  store i64 %0, i64* %._value, align 8
  %10 = call swiftcc %swift.bridge* @"$ss27_finalizeUninitializedArrayySayxGABnlF"(%swift.bridge* %3, %swift.type* getelementptr inbounds (%swift.full_type, %swift.full_type* @"$sypN", i32 0, i32 1))
  %11 = call swiftcc { i64, %swift.bridge* } @"$ss5print_9separator10terminatoryypd_S2StFfA0_"()
  %12 = extractvalue { i64, %swift.bridge* } %11, 0
  %13 = extractvalue { i64, %swift.bridge* } %11, 1
  %14 = call swiftcc { i64, %swift.bridge* } @"$ss5print_9separator10terminatoryypd_S2StFfA1_"()
  %15 = extractvalue { i64, %swift.bridge* } %14, 0
  %16 = extractvalue { i64, %swift.bridge* } %14, 1
  call swiftcc void @"$ss5print_9separator10terminatoryypd_S2StF"(%swift.bridge* %10, i64 %12, %swift.bridge* %13, i64 %15, %swift.bridge* %16)
  call void @swift_bridgeObjectRelease(%swift.bridge* %16) #4
  call void @swift_bridgeObjectRelease(%swift.bridge* %13) #4
  call void @swift_bridgeObjectRelease(%swift.bridge* %10) #4
  ret void
}

define linkonce_odr hidden swiftcc %swift.bridge* @"$ss27_finalizeUninitializedArrayySayxGABnlF"(%swift.bridge* %0, %swift.type* %Element) #0 {
entry:
  %Element1 = alloca %swift.type*, align 8
  %1 = alloca %TSa, align 8
  store %swift.type* %Element, %swift.type** %Element1, align 8
  %2 = bitcast %TSa* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2)
  %._buffer = getelementptr inbounds %TSa, %TSa* %1, i32 0, i32 0
  %._buffer._storage = getelementptr inbounds %Ts12_ArrayBufferV, %Ts12_ArrayBufferV* %._buffer, i32 0, i32 0
  %._buffer._storage.rawValue = getelementptr inbounds %Ts14_BridgeStorageV, %Ts14_BridgeStorageV* %._buffer._storage, i32 0, i32 0
  store %swift.bridge* %0, %swift.bridge** %._buffer._storage.rawValue, align 8
  %3 = call swiftcc %swift.metadata_response @"$sSaMa"(i64 0, %swift.type* %Element) #10
  %4 = extractvalue %swift.metadata_response %3, 0
  call swiftcc void @"$sSa12_endMutationyyF"(%swift.type* %4, %TSa* nocapture swiftself dereferenceable(8) %1)
  %._buffer2 = getelementptr inbounds %TSa, %TSa* %1, i32 0, i32 0
  %._buffer2._storage = getelementptr inbounds %Ts12_ArrayBufferV, %Ts12_ArrayBufferV* %._buffer2, i32 0, i32 0
  %._buffer2._storage.rawValue = getelementptr inbounds %Ts14_BridgeStorageV, %Ts14_BridgeStorageV* %._buffer2._storage, i32 0, i32 0
  %5 = load %swift.bridge*, %swift.bridge** %._buffer2._storage.rawValue, align 8
  %6 = bitcast %TSa* %1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %6)
  ret %swift.bridge* %5
}

define linkonce_odr hidden swiftcc { i64, %swift.bridge* } @"$ss5print_9separator10terminatoryypd_S2StFfA0_"() #0 {
entry:
  %0 = call swiftcc { i64, %swift.bridge* } @"$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC"(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @8, i64 0, i64 0), i64 1, i1 true)
  %1 = extractvalue { i64, %swift.bridge* } %0, 0
  %2 = extractvalue { i64, %swift.bridge* } %0, 1
  %3 = insertvalue { i64, %swift.bridge* } undef, i64 %1, 0
  %4 = insertvalue { i64, %swift.bridge* } %3, %swift.bridge* %2, 1
  ret { i64, %swift.bridge* } %4
}

define linkonce_odr hidden swiftcc { i64, %swift.bridge* } @"$ss5print_9separator10terminatoryypd_S2StFfA1_"() #0 {
entry:
  %0 = call swiftcc { i64, %swift.bridge* } @"$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC"(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @7, i64 0, i64 0), i64 1, i1 true)
  %1 = extractvalue { i64, %swift.bridge* } %0, 0
  %2 = extractvalue { i64, %swift.bridge* } %0, 1
  %3 = insertvalue { i64, %swift.bridge* } undef, i64 %1, 0
  %4 = insertvalue { i64, %swift.bridge* } %3, %swift.bridge* %2, 1
  ret { i64, %swift.bridge* } %4
}

define hidden swiftcc %swift.refcounted* @"$s4main7TeacherCfd"(%T4main7TeacherC* swiftself %0) #0 {
entry:
  %self.debug = alloca %T4main7TeacherC*, align 8
  %1 = bitcast %T4main7TeacherC** %self.debug to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %1, i8 0, i64 8, i1 false)
  store %T4main7TeacherC* %0, %T4main7TeacherC** %self.debug, align 8
  %2 = getelementptr inbounds %T4main7TeacherC, %T4main7TeacherC* %0, i32 0, i32 1
  %3 = call %TSiIegy_Sg* @"$sSiIegy_SgWOh"(%TSiIegy_Sg* %2)
  %4 = bitcast %T4main7TeacherC* %0 to %swift.refcounted*
  ret %swift.refcounted* %4
}

define hidden swiftcc void @"$s4main7TeacherCfD"(%T4main7TeacherC* swiftself %0) #0 {
entry:
  %self.debug = alloca %T4main7TeacherC*, align 8
  %1 = bitcast %T4main7TeacherC** %self.debug to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %1, i8 0, i64 8, i1 false)
  store %T4main7TeacherC* %0, %T4main7TeacherC** %self.debug, align 8
  %2 = call swiftcc %swift.refcounted* @"$s4main7TeacherCfd"(%T4main7TeacherC* swiftself %0)
  %3 = bitcast %swift.refcounted* %2 to %T4main7TeacherC*
  %4 = bitcast %T4main7TeacherC* %3 to %swift.refcounted*
  call void @swift_deallocClassInstance(%swift.refcounted* %4, i64 32, i64 7)
  ret void
}

define hidden swiftcc %T4main7TeacherC* @"$s4main7TeacherCACycfC"(%swift.type* swiftself %0) #0 {
entry:
  %1 = call noalias %swift.refcounted* @swift_allocObject(%swift.type* %0, i64 32, i64 7) #4
  %2 = bitcast %swift.refcounted* %1 to %T4main7TeacherC*
  %3 = call swiftcc %T4main7TeacherC* @"$s4main7TeacherCACycfc"(%T4main7TeacherC* swiftself %2)
  ret %T4main7TeacherC* %3
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind
declare void @swift_beginAccess(i8*, [24 x i8]*, i64, i8*) #4

; Function Attrs: nounwind
declare %swift.refcounted* @swift_retain(%swift.refcounted* returned) #4

; Function Attrs: nounwind
declare void @swift_endAccess([24 x i8]*) #4

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind
declare void @swift_release(%swift.refcounted*) #4

; Function Attrs: noinline nounwind
define linkonce_odr hidden %TSiIegy_Sg* @"$sSiIegy_SgWOh"(%TSiIegy_Sg* %0) #5 {
entry:
  %1 = bitcast %TSiIegy_Sg* %0 to { i64, i64 }*
  %2 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %1, i32 0, i32 0
  %3 = load i64, i64* %2, align 8
  %4 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %1, i32 0, i32 1
  %5 = load i64, i64* %4, align 8
  %6 = icmp eq i64 %3, 0
  br i1 %6, label %10, label %7

7:                                                ; preds = %entry
  %8 = bitcast %TSiIegy_Sg* %0 to %swift.function*
  %.data = getelementptr inbounds %swift.function, %swift.function* %8, i32 0, i32 1
  %9 = load %swift.refcounted*, %swift.refcounted** %.data, align 8
  call void @swift_release(%swift.refcounted* %9) #4
  br label %10

10:                                               ; preds = %7, %entry
  ret %TSiIegy_Sg* %0
}

; Function Attrs: noinline nounwind
define linkonce_odr hidden void @"$sSiIegy_SgWOy"(i64 %0, i64 %1) #5 {
entry:
  %2 = icmp eq i64 %0, 0
  br i1 %2, label %7, label %3

3:                                                ; preds = %entry
  %4 = inttoptr i64 %0 to i8*
  %5 = inttoptr i64 %1 to %swift.refcounted*
  %6 = call %swift.refcounted* @swift_retain(%swift.refcounted* returned %5) #4
  br label %7

7:                                                ; preds = %3, %entry
  ret void
}

; Function Attrs: noinline nounwind
define linkonce_odr hidden void @"$sSiIegy_SgWOe"(i64 %0, i64 %1) #5 {
entry:
  %2 = icmp eq i64 %0, 0
  br i1 %2, label %6, label %3

3:                                                ; preds = %entry
  %4 = inttoptr i64 %0 to i8*
  %5 = inttoptr i64 %1 to %swift.refcounted*
  call void @swift_release(%swift.refcounted* %5) #4
  br label %6

6:                                                ; preds = %3, %entry
  ret void
}

declare swiftcc void @"$s4main7TeacherCSiIegy_SgIetMAgYl_TC"(i8* noalias dereferenceable(32), i1) #0

declare i8* @malloc(i64)

declare void @free(i8*)

; Function Attrs: nounwind
declare token @llvm.coro.id.retcon.once(i32, i32, i8*, i8*, i8*, i8*) #4

; Function Attrs: nounwind
declare i8* @llvm.coro.begin(token, i8* writeonly) #4

; Function Attrs: nounwind
declare i1 @llvm.coro.suspend.retcon.i1(...) #4

; Function Attrs: nounwind
declare i1 @llvm.coro.end(i8*, i1) #4

declare swiftcc %swift.metadata_response @"$s8Dispatch0A13WorkItemFlagsVMa"(i64) #0

declare swiftcc %swift.metadata_response @"$s8Dispatch0A3QoSVMa"(i64) #0

declare swiftcc %swift.metadata_response @"$s8Dispatch0A4TimeVMa"(i64) #0

declare swiftcc %swift.metadata_response @"$s8Dispatch0A3QoSV0B6SClassOMa"(i64) #0

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #7

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i1 @llvm.expect.i1(i1, i1) #8

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #9

; Function Attrs: noinline nounwind readnone
define linkonce_odr hidden swiftcc %swift.metadata_response @"$sSo17OS_dispatch_queueCMa"(i64 %0) #1 {
entry:
  %1 = load %swift.type*, %swift.type** @"$sSo17OS_dispatch_queueCML", align 8
  %2 = icmp eq %swift.type* %1, null
  br i1 %2, label %cacheIsNull, label %cont

cacheIsNull:                                      ; preds = %entry
  %3 = load %objc_class*, %objc_class** @"OBJC_CLASS_REF_$_OS_dispatch_queue", align 8
  %4 = call %objc_class* @objc_opt_self(%objc_class* %3)
  %5 = call %swift.type* @swift_getObjCClassMetadata(%objc_class* %4) #10
  store atomic %swift.type* %5, %swift.type** @"$sSo17OS_dispatch_queueCML" release, align 8
  br label %cont

cont:                                             ; preds = %cacheIsNull, %entry
  %6 = phi %swift.type* [ %1, %entry ], [ %5, %cacheIsNull ]
  %7 = insertvalue %swift.metadata_response undef, %swift.type* %6, 0
  %8 = insertvalue %swift.metadata_response %7, i64 0, 1
  ret %swift.metadata_response %8
}

; Function Attrs: nounwind
declare %objc_class* @objc_opt_self(%objc_class*) #4

; Function Attrs: nounwind readnone
declare %swift.type* @swift_getObjCClassMetadata(%objc_class*) #10

declare swiftcc %TSo17OS_dispatch_queueC* @"$sSo17OS_dispatch_queueC8DispatchE6global3qosAbC0D3QoSV0G6SClassO_tFZ"(%swift.opaque* noalias nocapture, %swift.type* swiftself) #0

declare swiftcc void @"$s8Dispatch0A4TimeV3nowACyFZ"(%swift.opaque* noalias nocapture sret(%swift.opaque)) #0

define private swiftcc void @objectdestroy(%swift.refcounted* swiftself %0) #0 {
entry:
  %1 = bitcast %swift.refcounted* %0 to <{ %swift.refcounted, %swift.function, %TSi }>*
  %2 = getelementptr inbounds <{ %swift.refcounted, %swift.function, %TSi }>, <{ %swift.refcounted, %swift.function, %TSi }>* %1, i32 0, i32 1
  %.data = getelementptr inbounds %swift.function, %swift.function* %2, i32 0, i32 1
  %3 = load %swift.refcounted*, %swift.refcounted** %.data, align 8
  call void @swift_release(%swift.refcounted* %3) #4
  call void @swift_deallocObject(%swift.refcounted* %0, i64 40, i64 7)
  ret void
}

; Function Attrs: nounwind
declare void @swift_deallocObject(%swift.refcounted*, i64, i64) #4

; Function Attrs: nounwind
declare %swift.refcounted* @swift_allocObject(%swift.type*, i64, i64) #4

define internal swiftcc void @"$s4main7TeacherC15makeIncrementer_6handleySi_ySictFyycfU_Tf2ni_nTA"(%swift.refcounted* swiftself %0) #0 {
entry:
  %1 = bitcast %swift.refcounted* %0 to <{ %swift.refcounted, %swift.function, %TSi }>*
  %2 = getelementptr inbounds <{ %swift.refcounted, %swift.function, %TSi }>, <{ %swift.refcounted, %swift.function, %TSi }>* %1, i32 0, i32 1
  %.fn = getelementptr inbounds %swift.function, %swift.function* %2, i32 0, i32 0
  %3 = load i8*, i8** %.fn, align 8
  %.data = getelementptr inbounds %swift.function, %swift.function* %2, i32 0, i32 1
  %4 = load %swift.refcounted*, %swift.refcounted** %.data, align 8
  %5 = getelementptr inbounds <{ %swift.refcounted, %swift.function, %TSi }>, <{ %swift.refcounted, %swift.function, %TSi }>* %1, i32 0, i32 2
  %._value = getelementptr inbounds %TSi, %TSi* %5, i32 0, i32 0
  %6 = load i64, i64* %._value, align 8
  tail call swiftcc void @"$s4main7TeacherC15makeIncrementer_6handleySi_ySictFyycfU_Tf2ni_n"(i8* %3, %swift.refcounted* %4, i64 %6)
  ret void
}

define internal void @block_copy_helper({ %objc_block, %swift.function }* %0, { %objc_block, %swift.function }* %1) #0 {
entry:
  %2 = getelementptr inbounds { %objc_block, %swift.function }, { %objc_block, %swift.function }* %0, i32 0, i32 1
  %3 = getelementptr inbounds { %objc_block, %swift.function }, { %objc_block, %swift.function }* %1, i32 0, i32 1
  %.fn = getelementptr inbounds %swift.function, %swift.function* %3, i32 0, i32 0
  %.fn.load = load i8*, i8** %.fn, align 8
  %.data = getelementptr inbounds %swift.function, %swift.function* %3, i32 0, i32 1
  %4 = load %swift.refcounted*, %swift.refcounted** %.data, align 8
  %5 = call %swift.refcounted* @swift_retain(%swift.refcounted* returned %4) #4
  %.fn1 = getelementptr inbounds %swift.function, %swift.function* %2, i32 0, i32 0
  store i8* %.fn.load, i8** %.fn1, align 8
  %.data2 = getelementptr inbounds %swift.function, %swift.function* %2, i32 0, i32 1
  store %swift.refcounted* %4, %swift.refcounted** %.data2, align 8
  ret void
}

define internal void @block_destroy_helper({ %objc_block, %swift.function }* %0) #0 {
entry:
  %1 = getelementptr inbounds { %objc_block, %swift.function }, { %objc_block, %swift.function }* %0, i32 0, i32 1
  %.data = getelementptr inbounds %swift.function, %swift.function* %1, i32 0, i32 1
  %2 = load %swift.refcounted*, %swift.refcounted** %.data, align 8
  call void @swift_release(%swift.refcounted* %2) #4
  ret void
}

declare %objc_block* @_Block_copy(%objc_block*)

declare swiftcc void @"$sSo17OS_dispatch_queueC8DispatchE10asyncAfter8deadline3qos5flags7executeyAC0D4TimeV_AC0D3QoSVAC0D13WorkItemFlagsVyyXBtF"(%swift.opaque* noalias nocapture, %swift.opaque* noalias nocapture, %swift.opaque* noalias nocapture, %objc_block*, %TSo17OS_dispatch_queueC* swiftself) #0

; Function Attrs: nounwind
declare void @_Block_release(%objc_block*) #4

; Function Attrs: nounwind
declare void @llvm.objc.release(i8*) #4

; Function Attrs: nounwind
declare void @swift_deallocClassInstance(%swift.refcounted*, i64, i64) #4

define hidden swiftcc %T4main7TeacherC* @"$s4main7TeacherCACycfc"(%T4main7TeacherC* swiftself %0) #0 {
entry:
  %self.debug = alloca %T4main7TeacherC*, align 8
  %1 = bitcast %T4main7TeacherC** %self.debug to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %1, i8 0, i64 8, i1 false)
  store %T4main7TeacherC* %0, %T4main7TeacherC** %self.debug, align 8
  %2 = getelementptr inbounds %T4main7TeacherC, %T4main7TeacherC* %0, i32 0, i32 1
  %3 = bitcast %TSiIegy_Sg* %2 to { i64, i64 }*
  %4 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %3, i32 0, i32 0
  store i64 0, i64* %4, align 8
  %5 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %3, i32 0, i32 1
  store i64 0, i64* %5, align 8
  ret %T4main7TeacherC* %0
}

declare extern_weak void @"_swift_FORCE_LOAD_$_swiftFoundation"()

declare extern_weak void @"_swift_FORCE_LOAD_$_swiftObjectiveC"()

declare extern_weak void @"_swift_FORCE_LOAD_$_swiftDarwin"()

declare extern_weak void @"_swift_FORCE_LOAD_$_swiftCoreFoundation"()

declare extern_weak void @"_swift_FORCE_LOAD_$_swiftDispatch"()

declare extern_weak void @"_swift_FORCE_LOAD_$_swiftXPC"()

declare extern_weak void @"_swift_FORCE_LOAD_$_swiftIOKit"()

declare extern_weak void @"_swift_FORCE_LOAD_$_swiftCoreGraphics"()

declare swiftcc { %swift.bridge*, i8* } @"$ss27_allocateUninitializedArrayySayxG_BptBwlF"(i64, %swift.type*) #0

declare swiftcc void @"$ss5print_9separator10terminatoryypd_S2StF"(%swift.bridge*, i64, %swift.bridge*, i64, %swift.bridge*) #0

; Function Attrs: nounwind
declare void @swift_bridgeObjectRelease(%swift.bridge*) #4

declare swiftcc { i64, %swift.bridge* } @"$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC"(i8*, i64, i1) #0

define linkonce_odr hidden swiftcc { %swift.bridge*, i8* } @"$sSa22_allocateUninitializedySayxG_SpyxGtSiFZ8Dispatch0C13WorkItemFlagsV_Tgq5"(i64 %0) #0 {
entry:
  %1 = icmp slt i64 %0, 0
  %2 = call i1 @llvm.expect.i1(i1 %1, i1 false)
  br i1 %2, label %31, label %3

3:                                                ; preds = %entry
  %4 = icmp slt i64 0, %0
  br i1 %4, label %7, label %5

5:                                                ; preds = %3
  %6 = call %swift.refcounted* @swift_retain(%swift.refcounted* returned bitcast (%struct._SwiftEmptyArrayStorage* @_swiftEmptyArrayStorage to %swift.refcounted*)) #4
  br label %13

7:                                                ; preds = %3
  %8 = call swiftcc %swift.metadata_response @"$s8Dispatch0A13WorkItemFlagsVMa"(i64 0) #10
  %9 = extractvalue %swift.metadata_response %8, 0
  %10 = call swiftcc %swift.bridge* @"$sSa28_allocateBufferUninitialized15minimumCapacitys06_ArrayB0VyxGSi_tFZ"(i64 %0, %swift.type* %9)
  %11 = bitcast %swift.bridge* %10 to %Ts28__ContiguousArrayStorageBaseC*
  %12 = getelementptr inbounds %Ts28__ContiguousArrayStorageBaseC, %Ts28__ContiguousArrayStorageBaseC* %11, i32 0, i32 1
  %._storage = getelementptr inbounds %Ts10_ArrayBodyV, %Ts10_ArrayBodyV* %12, i32 0, i32 0
  %._storage.count = getelementptr inbounds %TSo22_SwiftArrayBodyStorageV, %TSo22_SwiftArrayBodyStorageV* %._storage, i32 0, i32 0
  %._storage.count._value = getelementptr inbounds %TSi, %TSi* %._storage.count, i32 0, i32 0
  store i64 %0, i64* %._storage.count._value, align 8
  br label %13

13:                                               ; preds = %7, %5
  %14 = phi %swift.bridge* [ bitcast (%struct._SwiftEmptyArrayStorage* @_swiftEmptyArrayStorage to %swift.bridge*), %5 ], [ %10, %7 ]
  %15 = bitcast %swift.bridge* %14 to %Ts28__ContiguousArrayStorageBaseC*
  %16 = call swiftcc %swift.metadata_response @"$s8Dispatch0A13WorkItemFlagsVMa"(i64 0) #10
  %17 = extractvalue %swift.metadata_response %16, 0
  %18 = bitcast %swift.type* %17 to i8***
  %19 = getelementptr inbounds i8**, i8*** %18, i64 -1
  %.valueWitnesses = load i8**, i8*** %19, align 8, !invariant.load !45, !dereferenceable !46
  %20 = bitcast i8** %.valueWitnesses to %swift.vwtable*
  %21 = getelementptr inbounds %swift.vwtable, %swift.vwtable* %20, i32 0, i32 10
  %flags = load i32, i32* %21, align 8, !invariant.load !45
  %22 = zext i32 %flags to i64
  %flags.alignmentMask = and i64 %22, 255
  %23 = add i64 32, %flags.alignmentMask
  %24 = xor i64 %flags.alignmentMask, -1
  %25 = and i64 %23, %24
  %26 = bitcast %Ts28__ContiguousArrayStorageBaseC* %15 to i8*
  %27 = getelementptr inbounds i8, i8* %26, i64 %25
  %tailaddr = bitcast i8* %27 to %swift.opaque*
  %28 = bitcast %swift.opaque* %tailaddr to i8*
  %29 = insertvalue { %swift.bridge*, i8* } undef, %swift.bridge* %14, 0
  %30 = insertvalue { %swift.bridge*, i8* } %29, i8* %28, 1
  ret { %swift.bridge*, i8* } %30

31:                                               ; preds = %entry
  call void @llvm.trap()
  unreachable
}

define linkonce_odr hidden swiftcc void @"$sSa12_endMutationyyF"(%swift.type* %"Array<Element>", %TSa* nocapture swiftself dereferenceable(8) %0) #0 {
entry:
  %._buffer = getelementptr inbounds %TSa, %TSa* %0, i32 0, i32 0
  %._buffer._storage = getelementptr inbounds %Ts12_ArrayBufferV, %Ts12_ArrayBufferV* %._buffer, i32 0, i32 0
  %._buffer._storage.rawValue = getelementptr inbounds %Ts14_BridgeStorageV, %Ts14_BridgeStorageV* %._buffer._storage, i32 0, i32 0
  %1 = load %swift.bridge*, %swift.bridge** %._buffer._storage.rawValue, align 8
  %._buffer1 = getelementptr inbounds %TSa, %TSa* %0, i32 0, i32 0
  %._buffer1._storage = getelementptr inbounds %Ts12_ArrayBufferV, %Ts12_ArrayBufferV* %._buffer1, i32 0, i32 0
  %._buffer1._storage.rawValue = getelementptr inbounds %Ts14_BridgeStorageV, %Ts14_BridgeStorageV* %._buffer1._storage, i32 0, i32 0
  store %swift.bridge* %1, %swift.bridge** %._buffer1._storage.rawValue, align 8
  ret void
}

declare swiftcc %swift.metadata_response @"$sSaMa"(i64, %swift.type*) #0

declare swiftcc void @"$ss10SetAlgebraPyxqd__ncSTRd__7ElementQyd__ACRtzlufCTj"(%swift.opaque* noalias nocapture sret(%swift.opaque), %swift.opaque* noalias nocapture, %swift.type*, i8**, %swift.type* swiftself, %swift.type*, i8**) #0

; Function Attrs: noinline nounwind readnone
define linkonce_odr hidden i8** @"$s8Dispatch0A13WorkItemFlagsVACs10SetAlgebraAAWl"() #1 {
entry:
  %0 = load i8**, i8*** @"$s8Dispatch0A13WorkItemFlagsVACs10SetAlgebraAAWL", align 8
  %1 = icmp eq i8** %0, null
  br i1 %1, label %cacheIsNull, label %cont

cacheIsNull:                                      ; preds = %entry
  %2 = call swiftcc %swift.metadata_response @"$s8Dispatch0A13WorkItemFlagsVMa"(i64 255) #10
  %3 = extractvalue %swift.metadata_response %2, 0
  %4 = extractvalue %swift.metadata_response %2, 1
  %5 = call i8** @swift_getWitnessTable(%swift.protocol_conformance_descriptor* @"$s8Dispatch0A13WorkItemFlagsVs10SetAlgebraAAMc", %swift.type* %3, i8*** undef) #4
  store atomic i8** %5, i8*** @"$s8Dispatch0A13WorkItemFlagsVACs10SetAlgebraAAWL" release, align 8
  br label %cont

cont:                                             ; preds = %cacheIsNull, %entry
  %6 = phi i8** [ %0, %entry ], [ %5, %cacheIsNull ]
  ret i8** %6
}

; Function Attrs: nounwind readonly
declare i8** @swift_getWitnessTable(%swift.protocol_conformance_descriptor*, %swift.type*, i8***) #11

; Function Attrs: noinline nounwind readnone
define linkonce_odr hidden %swift.type* @__swift_instantiateConcreteTypeFromMangledName({ i32, i32 }* %0) #1 {
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
  %16 = call swiftcc %swift.type* @swift_getTypeByMangledNameInContext(i8* %15, i64 %10, %swift.type_descriptor* null, i8** null) #10
  %17 = ptrtoint %swift.type* %16 to i64
  store atomic i64 %17, i64* %1 monotonic, align 8
  br label %5
}

; Function Attrs: argmemonly nounwind
declare swiftcc %swift.type* @swift_getTypeByMangledNameInContext(i8*, i64, %swift.type_descriptor*, i8**) #12

; Function Attrs: noinline nounwind readnone
define linkonce_odr hidden i8** @"$sSay8Dispatch0A13WorkItemFlagsVGSayxGSTsWl"() #1 {
entry:
  %0 = load i8**, i8*** @"$sSay8Dispatch0A13WorkItemFlagsVGSayxGSTsWL", align 8
  %1 = icmp eq i8** %0, null
  br i1 %1, label %cacheIsNull, label %cont

cacheIsNull:                                      ; preds = %entry
  %2 = call %swift.type* @__swift_instantiateConcreteTypeFromMangledNameAbstract({ i32, i32 }* @"$sSay8Dispatch0A13WorkItemFlagsVGMD") #10
  %3 = call i8** @swift_getWitnessTable(%swift.protocol_conformance_descriptor* @"$sSayxGSTsMc", %swift.type* %2, i8*** undef) #4
  store atomic i8** %3, i8*** @"$sSay8Dispatch0A13WorkItemFlagsVGSayxGSTsWL" release, align 8
  br label %cont

cont:                                             ; preds = %cacheIsNull, %entry
  %4 = phi i8** [ %0, %entry ], [ %3, %cacheIsNull ]
  ret i8** %4
}

; Function Attrs: noinline nounwind readnone
define linkonce_odr hidden %swift.type* @__swift_instantiateConcreteTypeFromMangledNameAbstract({ i32, i32 }* %0) #1 {
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
  %16 = call swiftcc %swift.type* @swift_getTypeByMangledNameInContextInMetadataState(i64 255, i8* %15, i64 %10, %swift.type_descriptor* null, i8** null) #10
  %17 = ptrtoint %swift.type* %16 to i64
  store atomic i64 %17, i64* %1 monotonic, align 8
  br label %5
}

; Function Attrs: argmemonly nounwind
declare swiftcc %swift.type* @swift_getTypeByMangledNameInContextInMetadataState(i64, i8*, i64, %swift.type_descriptor*, i8**) #12

; Function Attrs: noinline
declare swiftcc %swift.bridge* @"$sSa28_allocateBufferUninitialized15minimumCapacitys06_ArrayB0VyxGSi_tFZ"(i64, %swift.type*) #2

declare swiftcc void @"$s8Dispatch0A3QoSV11unspecifiedACvgZ"(%swift.opaque* noalias nocapture sret(%swift.opaque)) #0

; Function Attrs: alwaysinline
define private void @coro.devirt.trigger(i8* %0) #13 {
entry:
  ret void
}

attributes #0 = { "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind readnone "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nofree nosync nounwind willreturn }
attributes #4 = { nounwind }
attributes #5 = { noinline nounwind "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #7 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #8 = { nofree nosync nounwind readnone willreturn }
attributes #9 = { cold noreturn nounwind }
attributes #10 = { nounwind readnone }
attributes #11 = { nounwind readonly }
attributes #12 = { argmemonly nounwind }
attributes #13 = { alwaysinline }
attributes #14 = { noinline }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!swift.module.flags = !{!9}
!llvm.asan.globals = !{!10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23}
!llvm.linker.options = !{!24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44}

!0 = !{i32 2, !"SDK Version", [3 x i32] [i32 12, i32 0, i32 0]}
!1 = !{i32 1, !"Objective-C Version", i32 2}
!2 = !{i32 1, !"Objective-C Image Info Version", i32 0}
!3 = !{i32 1, !"Objective-C Image Info Section", !"__DATA,__objc_imageinfo,regular,no_dead_strip"}
!4 = !{i32 4, !"Objective-C Garbage Collection", i32 84215552}
!5 = !{i32 1, !"Objective-C Class Properties", i32 64}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 1, !"Swift Version", i32 7}
!9 = !{!"standard-library", i1 false}
!10 = !{<{ [7 x i8], i8 }>* @"symbolic SiIegy_", null, null, i1 false, i1 true}
!11 = !{<{ [2 x i8], i8 }>* @"symbolic Si", null, null, i1 false, i1 true}
!12 = !{{ i32, i32, i32, i32, i32 }* @"\01l__swift5_reflection_descriptor", null, null, i1 false, i1 true}
!13 = !{<{ i32, i32, i32 }>* @"$s4mainMXM", null, null, i1 false, i1 true}
!14 = !{<{ i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor, %swift.method_descriptor }>* @"$s4main7TeacherCMn", null, null, i1 false, i1 true}
!15 = !{<{ i8, i32, i8 }>* @"symbolic _____ 4main7TeacherC", null, null, i1 false, i1 true}
!16 = !{<{ [6 x i8], i8 }>* @"symbolic ySicSg", null, null, i1 false, i1 true}
!17 = !{[17 x i8]* @6, null, null, i1 false, i1 true}
!18 = !{{ i32, i32, i16, i16, i32, i32, i32, i32 }* @"$s4main7TeacherCMF", null, null, i1 false, i1 true}
!19 = !{<{ [3 x i8], i8, i32, [1 x i8], i8 }>* @"symbolic Say_____G 8Dispatch0A13WorkItemFlagsV", null, null, i1 false, i1 true}
!20 = !{[1 x %swift.type_metadata_record]* @"\01l_type_metadata_table", null, null, i1 false, i1 true}
!21 = !{[1 x i8*]* @objc_classes, null, null, i1 false, i1 true}
!22 = !{[15 x i8*]* @llvm.used, null, null, i1 false, i1 true}
!23 = !{[1 x i8*]* @llvm.compiler.used, null, null, i1 false, i1 true}
!24 = !{!"-lswiftFoundation"}
!25 = !{!"-lswiftCore"}
!26 = !{!"-lswift_Concurrency"}
!27 = !{!"-lswiftObjectiveC"}
!28 = !{!"-lswiftDarwin"}
!29 = !{!"-framework", !"Foundation"}
!30 = !{!"-lswiftCoreFoundation"}
!31 = !{!"-framework", !"CoreFoundation"}
!32 = !{!"-lswiftDispatch"}
!33 = !{!"-framework", !"Combine"}
!34 = !{!"-framework", !"CoreServices"}
!35 = !{!"-framework", !"Security"}
!36 = !{!"-lswiftXPC"}
!37 = !{!"-framework", !"CFNetwork"}
!38 = !{!"-framework", !"DiskArbitration"}
!39 = !{!"-lswiftIOKit"}
!40 = !{!"-framework", !"IOKit"}
!41 = !{!"-lswiftCoreGraphics"}
!42 = !{!"-framework", !"CoreGraphics"}
!43 = !{!"-lswiftSwiftOnoneSupport"}
!44 = !{!"-lobjc"}
!45 = !{}
!46 = !{i64 88}
