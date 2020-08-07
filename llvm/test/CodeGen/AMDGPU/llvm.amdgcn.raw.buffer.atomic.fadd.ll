; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=amdgcn-mesa-mesa3d -mcpu=gfx908 -amdgpu-atomic-optimizations=false -verify-machineinstrs < %s | FileCheck %s -check-prefix=CHECK

define amdgpu_ps void @raw_buffer_atomic_add_f32_noret__vgpr_val__sgpr_rsrc__vgpr_voffset__sgpr_soffset(float %val, <4 x i32> inreg %rsrc, i32 %voffset, i32 inreg %soffset) {
; CHECK-LABEL: raw_buffer_atomic_add_f32_noret__vgpr_val__sgpr_rsrc__vgpr_voffset__sgpr_soffset:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_mov_b32 s11, s5
; CHECK-NEXT:    s_mov_b32 s10, s4
; CHECK-NEXT:    s_mov_b32 s9, s3
; CHECK-NEXT:    s_mov_b32 s8, s2
; CHECK-NEXT:    buffer_atomic_add_f32 v0, v1, s[8:11], s6 offen
; CHECK-NEXT:    s_endpgm
  call void @llvm.amdgcn.raw.buffer.atomic.fadd.f32(float %val, <4 x i32> %rsrc, i32 %voffset, i32 %soffset, i32 24)
  ret void
}

define amdgpu_ps void @raw_buffer_atomic_add_f32_noret__vgpr_val__sgpr_rsrc__0_voffset__sgpr_soffset(float %val, <4 x i32> inreg %rsrc, i32 inreg %soffset) {
; CHECK-LABEL: raw_buffer_atomic_add_f32_noret__vgpr_val__sgpr_rsrc__0_voffset__sgpr_soffset:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_mov_b32 s11, s5
; CHECK-NEXT:    s_mov_b32 s10, s4
; CHECK-NEXT:    s_mov_b32 s9, s3
; CHECK-NEXT:    s_mov_b32 s8, s2
; CHECK-NEXT:    buffer_atomic_add_f32 v0, off, s[8:11], s6
; CHECK-NEXT:    s_endpgm
  call void @llvm.amdgcn.raw.buffer.atomic.fadd.f32(float %val, <4 x i32> %rsrc, i32 0, i32 %soffset, i32 0)
  ret void
}

define amdgpu_ps void @raw_buffer_atomic_add_v2f16_noret__vgpr_val__sgpr_rsrc__vgpr_voffset__sgpr_soffset(<2 x half> %val, <4 x i32> inreg %rsrc, i32 %voffset, i32 inreg %soffset) {
; CHECK-LABEL: raw_buffer_atomic_add_v2f16_noret__vgpr_val__sgpr_rsrc__vgpr_voffset__sgpr_soffset:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_mov_b32 s11, s5
; CHECK-NEXT:    s_mov_b32 s10, s4
; CHECK-NEXT:    s_mov_b32 s9, s3
; CHECK-NEXT:    s_mov_b32 s8, s2
; CHECK-NEXT:    buffer_atomic_pk_add_f16 v0, v1, s[8:11], s6 offen
; CHECK-NEXT:    s_endpgm
  call void @llvm.amdgcn.raw.buffer.atomic.fadd.v2f16(<2 x half> %val, <4 x i32> %rsrc, i32 %voffset, i32 %soffset, i32 0)
  ret void
}

define amdgpu_ps void @raw_buffer_atomic_add_v2f16_noret__vgpr_val__sgpr_rsrc__0_voffset__sgpr_soffset(<2 x half> %val, <4 x i32> inreg %rsrc, i32 %voffset, i32 inreg %soffset) {
; CHECK-LABEL: raw_buffer_atomic_add_v2f16_noret__vgpr_val__sgpr_rsrc__0_voffset__sgpr_soffset:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_mov_b32 s11, s5
; CHECK-NEXT:    s_mov_b32 s10, s4
; CHECK-NEXT:    s_mov_b32 s9, s3
; CHECK-NEXT:    s_mov_b32 s8, s2
; CHECK-NEXT:    buffer_atomic_pk_add_f16 v0, off, s[8:11], s6 offset:92
; CHECK-NEXT:    s_endpgm
  call void @llvm.amdgcn.raw.buffer.atomic.fadd.v2f16(<2 x half> %val, <4 x i32> %rsrc, i32 92, i32 %soffset, i32 0)
  ret void
}

define amdgpu_ps void @raw_buffer_atomic_add_f32_noret__vgpr_val__sgpr_rsrc__vgpr_voffset__sgpr_soffset_slc(float %val, <4 x i32> inreg %rsrc, i32 %voffset, i32 inreg %soffset) {
; CHECK-LABEL: raw_buffer_atomic_add_f32_noret__vgpr_val__sgpr_rsrc__vgpr_voffset__sgpr_soffset_slc:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_mov_b32 s11, s5
; CHECK-NEXT:    s_mov_b32 s10, s4
; CHECK-NEXT:    s_mov_b32 s9, s3
; CHECK-NEXT:    s_mov_b32 s8, s2
; CHECK-NEXT:    buffer_atomic_add_f32 v0, v1, s[8:11], s6 offen slc
; CHECK-NEXT:    s_endpgm
  call void @llvm.amdgcn.raw.buffer.atomic.fadd.f32(float %val, <4 x i32> %rsrc, i32 %voffset, i32 %soffset, i32 2)
  ret void
}

declare void @llvm.amdgcn.raw.buffer.atomic.fadd.f32(float, <4 x i32>, i32, i32, i32 immarg) #0
declare void @llvm.amdgcn.raw.buffer.atomic.fadd.v2f16(<2 x half>, <4 x i32>, i32, i32, i32 immarg) #0

attributes #0 = { nounwind }