; ModuleID = '<swift-imported-modules>'
source_filename = "<swift-imported-modules>"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

%swift.function = type { i8*, %swift.refcounted* }
%swift.refcounted = type { %swift.type*, i64 }
%swift.type = type { i64 }
%swift.full_type = type { i8**, %swift.type }
%swift.bridge = type opaque
%Any = type { [24 x i8], %swift.type* }
%TSd = type <{ double }>
%TSa = type <{ %Ts12_ArrayBufferV }>
%Ts12_ArrayBufferV = type <{ %Ts14_BridgeStorageV }>
%Ts14_BridgeStorageV = type <{ %swift.bridge* }>
%swift.metadata_response = type { %swift.type*, i64 }

@"$s4main1myS2d_Sdtcvp" = hidden global %swift.function zeroinitializer, align 8
@"$sypN" = external global %swift.full_type
@"$sSdN" = external global %swift.type, align 8
@"\01l_entry_point" = private constant { i32 } { i32 trunc (i64 sub (i64 ptrtoint (i32 (i32, i8**)* @main to i64), i64 ptrtoint ({ i32 }* @"\01l_entry_point" to i64)) to i32) }, section "__TEXT, __swift5_entry, regular, no_dead_strip", align 4
@"_swift_FORCE_LOAD_$_swiftFoundation_$_main" = weak_odr hidden constant void ()* @"_swift_FORCE_LOAD_$_swiftFoundation"
@"_swift_FORCE_LOAD_$_swiftObjectiveC_$_main" = weak_odr hidden constant void ()* @"_swift_FORCE_LOAD_$_swiftObjectiveC"
@"_swift_FORCE_LOAD_$_swiftDarwin_$_main" = weak_odr hidden constant void ()* @"_swift_FORCE_LOAD_$_swiftDarwin"
@"_swift_FORCE_LOAD_$_swiftCoreFoundation_$_main" = weak_odr hidden constant void ()* @"_swift_FORCE_LOAD_$_swiftCoreFoundation"
@"_swift_FORCE_LOAD_$_swiftDispatch_$_main" = weak_odr hidden constant void ()* @"_swift_FORCE_LOAD_$_swiftDispatch"
@"_swift_FORCE_LOAD_$_swiftXPC_$_main" = weak_odr hidden constant void ()* @"_swift_FORCE_LOAD_$_swiftXPC"
@"_swift_FORCE_LOAD_$_swiftIOKit_$_main" = weak_odr hidden constant void ()* @"_swift_FORCE_LOAD_$_swiftIOKit"
@"_swift_FORCE_LOAD_$_swiftCoreGraphics_$_main" = weak_odr hidden constant void ()* @"_swift_FORCE_LOAD_$_swiftCoreGraphics"
@0 = private unnamed_addr constant [2 x i8] c"\0A\00"
@1 = private unnamed_addr constant [2 x i8] c" \00"
@__swift_reflection_version = linkonce_odr hidden constant i16 3
@llvm.used = appending global [11 x i8*] [i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* bitcast ({ i32 }* @"\01l_entry_point" to i8*), i8* bitcast (void ()** @"_swift_FORCE_LOAD_$_swiftFoundation_$_main" to i8*), i8* bitcast (void ()** @"_swift_FORCE_LOAD_$_swiftObjectiveC_$_main" to i8*), i8* bitcast (void ()** @"_swift_FORCE_LOAD_$_swiftDarwin_$_main" to i8*), i8* bitcast (void ()** @"_swift_FORCE_LOAD_$_swiftCoreFoundation_$_main" to i8*), i8* bitcast (void ()** @"_swift_FORCE_LOAD_$_swiftDispatch_$_main" to i8*), i8* bitcast (void ()** @"_swift_FORCE_LOAD_$_swiftXPC_$_main" to i8*), i8* bitcast (void ()** @"_swift_FORCE_LOAD_$_swiftIOKit_$_main" to i8*), i8* bitcast (void ()** @"_swift_FORCE_LOAD_$_swiftCoreGraphics_$_main" to i8*), i8* bitcast (i16* @__swift_reflection_version to i8*)], section "llvm.metadata", align 8

define i32 @main(i32 %0, i8** %1) #0 {
entry:
  %access-scratch = alloca [24 x i8], align 8
  %2 = bitcast i8** %1 to i8*
  store i8* bitcast (double (double, double)* @"$s4main10addTwoIntsyS2d_SdtF" to i8*), i8** getelementptr inbounds (%swift.function, %swift.function* @"$s4main1myS2d_Sdtcvp", i32 0, i32 0), align 8
  store %swift.refcounted* null, %swift.refcounted** getelementptr inbounds (%swift.function, %swift.function* @"$s4main1myS2d_Sdtcvp", i32 0, i32 1), align 8
  %3 = call swiftcc { %swift.bridge*, i8* } @"$ss27_allocateUninitializedArrayySayxG_BptBwlF"(i64 1, %swift.type* getelementptr inbounds (%swift.full_type, %swift.full_type* @"$sypN", i32 0, i32 1))
  %4 = extractvalue { %swift.bridge*, i8* } %3, 0
  %5 = extractvalue { %swift.bridge*, i8* } %3, 1
  %6 = bitcast i8* %5 to %Any*
  %7 = bitcast [24 x i8]* %access-scratch to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %7)
  call void @swift_beginAccess(i8* bitcast (%swift.function* @"$s4main1myS2d_Sdtcvp" to i8*), [24 x i8]* %access-scratch, i64 32, i8* null) #2
  %8 = load i8*, i8** getelementptr inbounds (%swift.function, %swift.function* @"$s4main1myS2d_Sdtcvp", i32 0, i32 0), align 8
  %9 = load %swift.refcounted*, %swift.refcounted** getelementptr inbounds (%swift.function, %swift.function* @"$s4main1myS2d_Sdtcvp", i32 0, i32 1), align 8
  %10 = call %swift.refcounted* @swift_retain(%swift.refcounted* returned %9) #2
  call void @swift_endAccess([24 x i8]* %access-scratch) #2
  %11 = bitcast [24 x i8]* %access-scratch to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %11)
  %12 = bitcast i8* %8 to double (double, double, %swift.refcounted*)*
  %13 = call swiftcc double %12(double 1.000000e+01, double 2.000000e+01, %swift.refcounted* swiftself %9)
  %14 = getelementptr inbounds %Any, %Any* %6, i32 0, i32 1
  store %swift.type* @"$sSdN", %swift.type** %14, align 8
  %15 = getelementptr inbounds %Any, %Any* %6, i32 0, i32 0
  %16 = getelementptr inbounds %Any, %Any* %6, i32 0, i32 0
  %17 = bitcast [24 x i8]* %16 to %TSd*
  %._value = getelementptr inbounds %TSd, %TSd* %17, i32 0, i32 0
  store double %13, double* %._value, align 8
  %18 = call swiftcc %swift.bridge* @"$ss27_finalizeUninitializedArrayySayxGABnlF"(%swift.bridge* %4, %swift.type* getelementptr inbounds (%swift.full_type, %swift.full_type* @"$sypN", i32 0, i32 1))
  call void @swift_release(%swift.refcounted* %9) #2
  %19 = call swiftcc { i64, %swift.bridge* } @"$ss5print_9separator10terminatoryypd_S2StFfA0_"()
  %20 = extractvalue { i64, %swift.bridge* } %19, 0
  %21 = extractvalue { i64, %swift.bridge* } %19, 1
  %22 = call swiftcc { i64, %swift.bridge* } @"$ss5print_9separator10terminatoryypd_S2StFfA1_"()
  %23 = extractvalue { i64, %swift.bridge* } %22, 0
  %24 = extractvalue { i64, %swift.bridge* } %22, 1
  call swiftcc void @"$ss5print_9separator10terminatoryypd_S2StF"(%swift.bridge* %18, i64 %20, %swift.bridge* %21, i64 %23, %swift.bridge* %24)
  call void @swift_bridgeObjectRelease(%swift.bridge* %24) #2
  call void @swift_bridgeObjectRelease(%swift.bridge* %21) #2
  call void @swift_bridgeObjectRelease(%swift.bridge* %18) #2
  ret i32 0
}

define hidden swiftcc i64 @"$s4main10addTwoIntsyS2i_SitF"(i64 %0, i64 %1) #0 {
entry:
  %a.debug = alloca i64, align 8
  %2 = bitcast i64* %a.debug to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %2, i8 0, i64 8, i1 false)
  %b.debug = alloca i64, align 8
  %3 = bitcast i64* %b.debug to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %3, i8 0, i64 8, i1 false)
  store i64 %0, i64* %a.debug, align 8
  store i64 %1, i64* %b.debug, align 8
  %4 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %0, i64 %1)
  %5 = extractvalue { i64, i1 } %4, 0
  %6 = extractvalue { i64, i1 } %4, 1
  %7 = call i1 @llvm.expect.i1(i1 %6, i1 false)
  br i1 %7, label %9, label %8

8:                                                ; preds = %entry
  ret i64 %5

9:                                                ; preds = %entry
  call void @llvm.trap()
  unreachable
}

define hidden swiftcc double @"$s4main10addTwoIntsyS2d_SdtF"(double %0, double %1) #0 {
entry:
  %a.debug = alloca double, align 8
  %2 = bitcast double* %a.debug to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %2, i8 0, i64 8, i1 false)
  %b.debug = alloca double, align 8
  %3 = bitcast double* %b.debug to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %3, i8 0, i64 8, i1 false)
  store double %0, double* %a.debug, align 8
  store double %1, double* %b.debug, align 8
  %4 = fadd double %0, %1
  ret double %4
}

declare swiftcc { %swift.bridge*, i8* } @"$ss27_allocateUninitializedArrayySayxG_BptBwlF"(i64, %swift.type*) #0

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind
declare void @swift_beginAccess(i8*, [24 x i8]*, i64, i8*) #2

; Function Attrs: nounwind
declare %swift.refcounted* @swift_retain(%swift.refcounted* returned) #2

; Function Attrs: nounwind
declare void @swift_endAccess([24 x i8]*) #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

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
  %3 = call swiftcc %swift.metadata_response @"$sSaMa"(i64 0, %swift.type* %Element) #7
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

; Function Attrs: nounwind
declare void @swift_release(%swift.refcounted*) #2

define linkonce_odr hidden swiftcc { i64, %swift.bridge* } @"$ss5print_9separator10terminatoryypd_S2StFfA0_"() #0 {
entry:
  %0 = call swiftcc { i64, %swift.bridge* } @"$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC"(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @1, i64 0, i64 0), i64 1, i1 true)
  %1 = extractvalue { i64, %swift.bridge* } %0, 0
  %2 = extractvalue { i64, %swift.bridge* } %0, 1
  %3 = insertvalue { i64, %swift.bridge* } undef, i64 %1, 0
  %4 = insertvalue { i64, %swift.bridge* } %3, %swift.bridge* %2, 1
  ret { i64, %swift.bridge* } %4
}

define linkonce_odr hidden swiftcc { i64, %swift.bridge* } @"$ss5print_9separator10terminatoryypd_S2StFfA1_"() #0 {
entry:
  %0 = call swiftcc { i64, %swift.bridge* } @"$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC"(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @0, i64 0, i64 0), i64 1, i1 true)
  %1 = extractvalue { i64, %swift.bridge* } %0, 0
  %2 = extractvalue { i64, %swift.bridge* } %0, 1
  %3 = insertvalue { i64, %swift.bridge* } undef, i64 %1, 0
  %4 = insertvalue { i64, %swift.bridge* } %3, %swift.bridge* %2, 1
  ret { i64, %swift.bridge* } %4
}

declare swiftcc void @"$ss5print_9separator10terminatoryypd_S2StF"(%swift.bridge*, i64, %swift.bridge*, i64, %swift.bridge*) #0

; Function Attrs: nounwind
declare void @swift_bridgeObjectRelease(%swift.bridge*) #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #4

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i1 @llvm.expect.i1(i1, i1) #5

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #6

declare extern_weak void @"_swift_FORCE_LOAD_$_swiftFoundation"()

declare extern_weak void @"_swift_FORCE_LOAD_$_swiftObjectiveC"()

declare extern_weak void @"_swift_FORCE_LOAD_$_swiftDarwin"()

declare extern_weak void @"_swift_FORCE_LOAD_$_swiftCoreFoundation"()

declare extern_weak void @"_swift_FORCE_LOAD_$_swiftDispatch"()

declare extern_weak void @"_swift_FORCE_LOAD_$_swiftXPC"()

declare extern_weak void @"_swift_FORCE_LOAD_$_swiftIOKit"()

declare extern_weak void @"_swift_FORCE_LOAD_$_swiftCoreGraphics"()

declare swiftcc { i64, %swift.bridge* } @"$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC"(i8*, i64, i1) #0

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

attributes #0 = { "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { nounwind }
attributes #3 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nofree nosync nounwind readnone willreturn }
attributes #6 = { cold noreturn nounwind }
attributes #7 = { nounwind readnone }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!swift.module.flags = !{!9}
!llvm.linker.options = !{!10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30}
!llvm.asan.globals = !{!31}

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
!10 = !{!"-lswiftFoundation"}
!11 = !{!"-lswiftCore"}
!12 = !{!"-lswift_Concurrency"}
!13 = !{!"-lswiftObjectiveC"}
!14 = !{!"-lswiftDarwin"}
!15 = !{!"-framework", !"Foundation"}
!16 = !{!"-lswiftCoreFoundation"}
!17 = !{!"-framework", !"CoreFoundation"}
!18 = !{!"-lswiftDispatch"}
!19 = !{!"-framework", !"Combine"}
!20 = !{!"-framework", !"CoreServices"}
!21 = !{!"-framework", !"Security"}
!22 = !{!"-lswiftXPC"}
!23 = !{!"-framework", !"CFNetwork"}
!24 = !{!"-framework", !"DiskArbitration"}
!25 = !{!"-lswiftIOKit"}
!26 = !{!"-framework", !"IOKit"}
!27 = !{!"-lswiftCoreGraphics"}
!28 = !{!"-framework", !"CoreGraphics"}
!29 = !{!"-lswiftSwiftOnoneSupport"}
!30 = !{!"-lobjc"}
!31 = !{[11 x i8*]* @llvm.used, null, null, i1 false, i1 true}
