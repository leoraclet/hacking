(module
  (type $t0 (func (param i32 i32 i32) (result i32)))
  (type $t1 (func (param i32 i32) (result i32)))
  (type $t2 (func (param i32 i32)))
  (type $t3 (func (param i32)))
  (type $t4 (func (param i32 i32 i32)))
  (type $t5 (func (param i32) (result i32)))
  (type $t6 (func (result i32)))
  (type $t7 (func (param i32 i32 i32 i32) (result i32)))
  (type $t8 (func (param i32 i32 i32 i32)))
  (type $t9 (func))
  (import "typst_env" "wasm_minimal_protocol_send_result_to_host" (func $typst_env.wasm_minimal_protocol_send_result_to_host (type $t2)))
  (import "typst_env" "wasm_minimal_protocol_write_args_to_buffer" (func $typst_env.wasm_minimal_protocol_write_args_to_buffer (type $t3)))
  (func $f2 (type $t4) (param $p0 i32) (param $p1 i32) (param $p2 i32)
    (local $l3 i32)
    (call $f3
      (local.get $p0)
      (local.tee $p2
        (i32.sub
          (local.get $p2)
          (local.get $p1))))
    (drop
      (call $f44
        (i32.add
          (i32.load offset=4
            (local.get $p0))
          (local.tee $l3
            (i32.load offset=8
              (local.get $p0))))
        (local.get $p1)
        (local.get $p2)))
    (i32.store offset=8
      (local.get $p0)
      (i32.add
        (local.get $l3)
        (local.get $p2))))
  (func $f3 (type $t2) (param $p0 i32) (param $p1 i32)
    (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32)
    (global.set $g0
      (local.tee $l2
        (i32.sub
          (global.get $g0)
          (i32.const 16))))
    (block $B0
      (br_if $B0
        (i32.ge_u
          (i32.sub
            (local.tee $l3
              (i32.load
                (local.get $p0)))
            (local.tee $l4
              (i32.load offset=8
                (local.get $p0))))
          (local.get $p1)))
      (block $B1
        (block $B2
          (block $B3
            (br_if $B3
              (i32.ge_u
                (local.tee $p1
                  (i32.add
                    (local.get $l4)
                    (local.get $p1)))
                (local.get $l4)))
            (local.set $l5
              (i32.const 0))
            (br $B2))
          (local.set $l5
            (i32.const 0))
          (block $B4
            (br_if $B4
              (i32.ge_s
                (local.tee $p1
                  (select
                    (local.tee $p1
                      (select
                        (local.get $p1)
                        (local.tee $l4
                          (i32.shl
                            (local.get $l3)
                            (i32.const 1)))
                        (i32.gt_u
                          (local.get $p1)
                          (local.get $l4))))
                    (i32.const 8)
                    (i32.gt_u
                      (local.get $p1)
                      (i32.const 8))))
                (i32.const 0)))
            (br $B2))
          (block $B5
            (block $B6
              (br_if $B6
                (i32.eqz
                  (local.get $l3)))
              (local.set $l3
                (call $f15
                  (i32.load offset=4
                    (local.get $p0))
                  (local.get $l3)
                  (local.get $p1)))
              (br $B5))
            (call $f16
              (i32.add
                (local.get $l2)
                (i32.const 8))
              (local.get $p1))
            (local.set $l3
              (i32.load offset=8
                (local.get $l2))))
          (br_if $B1
            (local.get $l3))
          (local.set $l5
            (i32.const 1)))
        (call $f17
          (local.get $l5)
          (local.get $p1)
          (i32.const 1049708))
        (unreachable))
      (i32.store
        (local.get $p0)
        (local.get $p1))
      (i32.store offset=4
        (local.get $p0)
        (local.get $l3)))
    (global.set $g0
      (i32.add
        (local.get $l2)
        (i32.const 16))))
  (func $f4 (type $t1) (param $p0 i32) (param $p1 i32) (result i32)
    (call $f5
      (local.get $p0)
      (i32.const 1048576)
      (local.get $p1)))
  (func $f5 (type $t0) (param $p0 i32) (param $p1 i32) (param $p2 i32) (result i32)
    (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i32) (local $l10 i32) (local $l11 i32) (local $l12 i32)
    (global.set $g0
      (local.tee $l3
        (i32.sub
          (global.get $g0)
          (i32.const 48))))
    (i32.store offset=44
      (local.get $l3)
      (local.get $p1))
    (i32.store offset=40
      (local.get $l3)
      (local.get $p0))
    (i32.store8 offset=36
      (local.get $l3)
      (i32.const 3))
    (i64.store offset=28 align=4
      (local.get $l3)
      (i64.const 32))
    (local.set $l4
      (i32.const 0))
    (i32.store offset=20
      (local.get $l3)
      (i32.const 0))
    (i32.store offset=12
      (local.get $l3)
      (i32.const 0))
    (block $B0
      (block $B1
        (block $B2
          (block $B3
            (block $B4
              (br_if $B4
                (local.tee $l5
                  (i32.load offset=16
                    (local.get $p2))))
              (br_if $B3
                (i32.eqz
                  (local.tee $p0
                    (i32.load offset=12
                      (local.get $p2)))))
              (local.set $l6
                (i32.add
                  (local.tee $p1
                    (i32.load offset=8
                      (local.get $p2)))
                  (i32.shl
                    (local.get $p0)
                    (i32.const 3))))
              (local.set $l4
                (i32.add
                  (i32.and
                    (i32.add
                      (local.get $p0)
                      (i32.const -1))
                    (i32.const 536870911))
                  (i32.const 1)))
              (local.set $p0
                (i32.load
                  (local.get $p2)))
              (loop $L5
                (block $B6
                  (br_if $B6
                    (i32.eqz
                      (local.tee $l7
                        (i32.load
                          (i32.add
                            (local.get $p0)
                            (i32.const 4))))))
                  (br_if $B2
                    (call_indirect $T0 (type $t0)
                      (i32.load offset=40
                        (local.get $l3))
                      (i32.load
                        (local.get $p0))
                      (local.get $l7)
                      (i32.load offset=12
                        (i32.load offset=44
                          (local.get $l3))))))
                (br_if $B2
                  (call_indirect $T0 (type $t1)
                    (i32.load
                      (local.get $p1))
                    (i32.add
                      (local.get $l3)
                      (i32.const 12))
                    (i32.load
                      (i32.add
                        (local.get $p1)
                        (i32.const 4)))))
                (local.set $p0
                  (i32.add
                    (local.get $p0)
                    (i32.const 8)))
                (br_if $L5
                  (i32.ne
                    (local.tee $p1
                      (i32.add
                        (local.get $p1)
                        (i32.const 8)))
                    (local.get $l6)))
                (br $B3)))
            (br_if $B3
              (i32.eqz
                (local.tee $p1
                  (i32.load offset=20
                    (local.get $p2)))))
            (local.set $l8
              (i32.shl
                (local.get $p1)
                (i32.const 5)))
            (local.set $l4
              (i32.add
                (i32.and
                  (i32.add
                    (local.get $p1)
                    (i32.const -1))
                  (i32.const 134217727))
                (i32.const 1)))
            (local.set $l9
              (i32.load offset=8
                (local.get $p2)))
            (local.set $p0
              (i32.load
                (local.get $p2)))
            (local.set $l7
              (i32.const 0))
            (loop $L7
              (block $B8
                (br_if $B8
                  (i32.eqz
                    (local.tee $p1
                      (i32.load
                        (i32.add
                          (local.get $p0)
                          (i32.const 4))))))
                (br_if $B2
                  (call_indirect $T0 (type $t0)
                    (i32.load offset=40
                      (local.get $l3))
                    (i32.load
                      (local.get $p0))
                    (local.get $p1)
                    (i32.load offset=12
                      (i32.load offset=44
                        (local.get $l3))))))
              (i32.store offset=28
                (local.get $l3)
                (i32.load
                  (i32.add
                    (local.tee $p1
                      (i32.add
                        (local.get $l5)
                        (local.get $l7)))
                    (i32.const 16))))
              (i32.store8 offset=36
                (local.get $l3)
                (i32.load8_u
                  (i32.add
                    (local.get $p1)
                    (i32.const 28))))
              (i32.store offset=32
                (local.get $l3)
                (i32.load
                  (i32.add
                    (local.get $p1)
                    (i32.const 24))))
              (local.set $l6
                (i32.load
                  (i32.add
                    (local.get $p1)
                    (i32.const 12))))
              (local.set $l10
                (i32.const 0))
              (local.set $l11
                (i32.const 0))
              (block $B9
                (block $B10
                  (block $B11
                    (br_table $B10 $B11 $B9 $B10
                      (i32.load
                        (i32.add
                          (local.get $p1)
                          (i32.const 8)))))
                  (local.set $l12
                    (i32.shl
                      (local.get $l6)
                      (i32.const 3)))
                  (local.set $l11
                    (i32.const 0))
                  (br_if $B9
                    (i32.load
                      (local.tee $l12
                        (i32.add
                          (local.get $l9)
                          (local.get $l12)))))
                  (local.set $l6
                    (i32.load offset=4
                      (local.get $l12))))
                (local.set $l11
                  (i32.const 1)))
              (i32.store offset=16
                (local.get $l3)
                (local.get $l6))
              (i32.store offset=12
                (local.get $l3)
                (local.get $l11))
              (local.set $l6
                (i32.load
                  (i32.add
                    (local.get $p1)
                    (i32.const 4))))
              (block $B12
                (block $B13
                  (block $B14
                    (br_table $B13 $B14 $B12 $B13
                      (i32.load
                        (local.get $p1))))
                  (local.set $l11
                    (i32.shl
                      (local.get $l6)
                      (i32.const 3)))
                  (br_if $B12
                    (i32.load
                      (local.tee $l11
                        (i32.add
                          (local.get $l9)
                          (local.get $l11)))))
                  (local.set $l6
                    (i32.load offset=4
                      (local.get $l11))))
                (local.set $l10
                  (i32.const 1)))
              (i32.store offset=24
                (local.get $l3)
                (local.get $l6))
              (i32.store offset=20
                (local.get $l3)
                (local.get $l10))
              (br_if $B2
                (call_indirect $T0 (type $t1)
                  (i32.load
                    (local.tee $p1
                      (i32.add
                        (local.get $l9)
                        (i32.shl
                          (i32.load
                            (i32.add
                              (local.get $p1)
                              (i32.const 20)))
                          (i32.const 3)))))
                  (i32.add
                    (local.get $l3)
                    (i32.const 12))
                  (i32.load
                    (i32.add
                      (local.get $p1)
                      (i32.const 4)))))
              (local.set $p0
                (i32.add
                  (local.get $p0)
                  (i32.const 8)))
              (br_if $L7
                (i32.ne
                  (local.get $l8)
                  (local.tee $l7
                    (i32.add
                      (local.get $l7)
                      (i32.const 32)))))))
          (br_if $B1
            (i32.ge_u
              (local.get $l4)
              (i32.load offset=4
                (local.get $p2))))
          (br_if $B1
            (i32.eqz
              (call_indirect $T0 (type $t0)
                (i32.load offset=40
                  (local.get $l3))
                (i32.load
                  (local.tee $p1
                    (i32.add
                      (i32.load
                        (local.get $p2))
                      (i32.shl
                        (local.get $l4)
                        (i32.const 3)))))
                (i32.load offset=4
                  (local.get $p1))
                (i32.load offset=12
                  (i32.load offset=44
                    (local.get $l3)))))))
        (local.set $p1
          (i32.const 1))
        (br $B0))
      (local.set $p1
        (i32.const 0)))
    (global.set $g0
      (i32.add
        (local.get $l3)
        (i32.const 48)))
    (local.get $p1))
  (func $f6 (type $t3) (param $p0 i32)
    (call $f7
      (i32.load
        (local.get $p0))
      (i32.load offset=4
        (local.get $p0))))
  (func $f7 (type $t2) (param $p0 i32) (param $p1 i32)
    (block $B0
      (br_if $B0
        (i32.eqz
          (local.get $p0)))
      (call $f8
        (local.get $p1)
        (local.get $p0))))
  (func $f8 (type $t2) (param $p0 i32) (param $p1 i32)
    (block $B0
      (br_if $B0
        (i32.eqz
          (local.get $p1)))
      (call $f22
        (local.get $p0)
        (local.get $p1))))
  (func $f9 (type $t2) (param $p0 i32) (param $p1 i32)
    (block $B0
      (br_if $B0
        (i32.eqz
          (local.get $p1)))
      (call $f8
        (local.get $p0)
        (local.get $p1))))
  (func $f10 (type $t1) (param $p0 i32) (param $p1 i32) (result i32)
    (call_indirect $T0 (type $t0)
      (i32.load offset=28
        (local.get $p1))
      (i32.const 1048884)
      (i32.const 5)
      (i32.load offset=12
        (i32.load offset=32
          (local.get $p1)))))
  (func $f11 (type $t1) (param $p0 i32) (param $p1 i32) (result i32)
    (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32)
    (global.set $g0
      (local.tee $l2
        (i32.sub
          (global.get $g0)
          (i32.const 16))))
    (block $B0
      (block $B1
        (br_if $B1
          (i32.lt_u
            (local.get $p1)
            (i32.const 128)))
        (local.set $l3
          (i32.or
            (i32.add
              (local.get $l2)
              (i32.const 12))
            (i32.const 2)))
        (i32.store offset=12
          (local.get $l2)
          (i32.const 0))
        (block $B2
          (block $B3
            (br_if $B3
              (i32.lt_u
                (local.get $p1)
                (i32.const 2048)))
            (local.set $l4
              (i32.or
                (i32.add
                  (local.get $l2)
                  (i32.const 12))
                (i32.const 3)))
            (block $B4
              (br_if $B4
                (i32.lt_u
                  (local.get $p1)
                  (i32.const 65536)))
              (local.set $l3
                (i32.add
                  (local.get $l2)
                  (i32.const 16)))
              (i32.store8 offset=12
                (local.get $l2)
                (i32.or
                  (i32.shr_u
                    (local.get $p1)
                    (i32.const 18))
                  (i32.const 240)))
              (i32.store8 offset=14
                (local.get $l2)
                (i32.or
                  (i32.and
                    (i32.shr_u
                      (local.get $p1)
                      (i32.const 6))
                    (i32.const 63))
                  (i32.const 128)))
              (i32.store8 offset=13
                (local.get $l2)
                (i32.or
                  (i32.and
                    (i32.shr_u
                      (local.get $p1)
                      (i32.const 12))
                    (i32.const 63))
                  (i32.const 128)))
              (local.set $l5
                (local.get $l4))
              (br $B2))
            (i32.store8 offset=12
              (local.get $l2)
              (i32.or
                (i32.shr_u
                  (local.get $p1)
                  (i32.const 12))
                (i32.const 224)))
            (i32.store8 offset=13
              (local.get $l2)
              (i32.or
                (i32.and
                  (i32.shr_u
                    (local.get $p1)
                    (i32.const 6))
                  (i32.const 63))
                (i32.const 128)))
            (local.set $l5
              (local.get $l3))
            (local.set $l3
              (local.get $l4))
            (br $B2))
          (local.set $l5
            (i32.or
              (i32.add
                (local.get $l2)
                (i32.const 12))
              (i32.const 1)))
          (i32.store8 offset=12
            (local.get $l2)
            (i32.or
              (i32.shr_u
                (local.get $p1)
                (i32.const 6))
              (i32.const 192))))
        (i32.store8
          (local.get $l5)
          (i32.or
            (i32.and
              (local.get $p1)
              (i32.const 63))
            (i32.const 128)))
        (call $f2
          (local.get $p0)
          (i32.add
            (local.get $l2)
            (i32.const 12))
          (local.get $l3))
        (br $B0))
      (block $B5
        (br_if $B5
          (i32.ne
            (local.tee $l3
              (i32.load offset=8
                (local.get $p0)))
            (i32.load
              (local.get $p0))))
        (call $f12
          (local.get $p0)
          (i32.const 1049616)))
      (i32.store offset=8
        (local.get $p0)
        (i32.add
          (local.get $l3)
          (i32.const 1)))
      (i32.store8
        (i32.add
          (i32.load offset=4
            (local.get $p0))
          (local.get $l3))
        (local.get $p1)))
    (global.set $g0
      (i32.add
        (local.get $l2)
        (i32.const 16)))
    (i32.const 0))
  (func $f12 (type $t2) (param $p0 i32) (param $p1 i32)
    (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32)
    (global.set $g0
      (local.tee $l2
        (i32.sub
          (global.get $g0)
          (i32.const 32))))
    (block $B0
      (br_if $B0
        (i32.ge_s
          (local.tee $l4
            (select
              (local.tee $l4
                (select
                  (local.tee $l4
                    (i32.add
                      (local.tee $l3
                        (i32.load
                          (local.get $p0)))
                      (i32.const 1)))
                  (local.tee $l5
                    (i32.shl
                      (local.get $l3)
                      (i32.const 1)))
                  (i32.gt_u
                    (local.get $l4)
                    (local.get $l5))))
              (i32.const 8)
              (i32.gt_u
                (local.get $l4)
                (i32.const 8))))
          (i32.const 0)))
      (call $f17
        (i32.const 0)
        (i32.const 0)
        (local.get $p1))
      (unreachable))
    (local.set $l5
      (i32.const 0))
    (block $B1
      (br_if $B1
        (i32.eqz
          (local.get $l3)))
      (i32.store offset=28
        (local.get $l2)
        (local.get $l3))
      (i32.store offset=20
        (local.get $l2)
        (i32.load offset=4
          (local.get $p0)))
      (local.set $l5
        (i32.const 1)))
    (i32.store offset=24
      (local.get $l2)
      (local.get $l5))
    (call $f31
      (i32.add
        (local.get $l2)
        (i32.const 8))
      (local.get $l4)
      (i32.add
        (local.get $l2)
        (i32.const 20)))
    (block $B2
      (br_if $B2
        (i32.ne
          (i32.load offset=8
            (local.get $l2))
          (i32.const 1)))
      (call $f17
        (i32.load offset=12
          (local.get $l2))
        (i32.load offset=16
          (local.get $l2))
        (local.get $p1))
      (unreachable))
    (local.set $l3
      (i32.load offset=12
        (local.get $l2)))
    (i32.store
      (local.get $p0)
      (local.get $l4))
    (i32.store offset=4
      (local.get $p0)
      (local.get $l3))
    (global.set $g0
      (i32.add
        (local.get $l2)
        (i32.const 32))))
  (func $f13 (type $t0) (param $p0 i32) (param $p1 i32) (param $p2 i32) (result i32)
    (call $f2
      (local.get $p0)
      (local.get $p1)
      (i32.add
        (local.get $p1)
        (local.get $p2)))
    (i32.const 0))
  (func $f14 (type $t2) (param $p0 i32) (param $p1 i32)
    (local $l2 i32) (local $l3 i32) (local $l4 i32)
    (local.set $l2
      (i32.load offset=4
        (local.get $p1)))
    (block $B0
      (block $B1
        (br_if $B1
          (i32.le_u
            (local.tee $l3
              (i32.load
                (local.get $p1)))
            (local.tee $l4
              (i32.load offset=8
                (local.get $p1)))))
        (block $B2
          (block $B3
            (br_if $B3
              (local.get $l4))
            (call $f8
              (local.get $l2)
              (local.get $l3))
            (local.set $l2
              (i32.const 1))
            (br $B2))
          (br_if $B0
            (i32.eqz
              (local.tee $l2
                (call $f15
                  (local.get $l2)
                  (local.get $l3)
                  (local.get $l4))))))
        (i32.store
          (local.get $p1)
          (local.get $l4))
        (i32.store offset=4
          (local.get $p1)
          (local.get $l2)))
      (i32.store offset=4
        (local.get $p0)
        (local.get $l4))
      (i32.store
        (local.get $p0)
        (local.get $l2))
      (return))
    (unreachable))
  (func $f15 (type $t0) (param $p0 i32) (param $p1 i32) (param $p2 i32) (result i32)
    (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32)
    (block $B0
      (block $B1
        (block $B2
          (br_if $B2
            (i32.lt_u
              (local.tee $l5
                (i32.and
                  (local.tee $l4
                    (i32.load
                      (local.tee $l3
                        (i32.add
                          (local.get $p0)
                          (i32.const -4)))))
                  (i32.const -8)))
              (i32.add
                (select
                  (i32.const 4)
                  (i32.const 8)
                  (local.tee $l6
                    (i32.and
                      (local.get $l4)
                      (i32.const 3))))
                (local.get $p1))))
          (block $B3
            (br_if $B3
              (i32.eqz
                (local.get $l6)))
            (br_if $B1
              (i32.gt_u
                (local.get $l5)
                (i32.add
                  (local.get $p1)
                  (i32.const 39)))))
          (local.set $p1
            (select
              (i32.const 16)
              (i32.and
                (i32.add
                  (local.get $p2)
                  (i32.const 11))
                (i32.const -8))
              (i32.lt_u
                (local.get $p2)
                (i32.const 11))))
          (block $B4
            (block $B5
              (block $B6
                (br_if $B6
                  (local.get $l6))
                (br_if $B5
                  (i32.lt_u
                    (local.get $p1)
                    (i32.const 256)))
                (br_if $B5
                  (i32.lt_u
                    (local.get $l5)
                    (i32.or
                      (local.get $p1)
                      (i32.const 4))))
                (br_if $B5
                  (i32.ge_u
                    (i32.sub
                      (local.get $l5)
                      (local.get $p1))
                    (i32.const 131073)))
                (br $B4))
              (local.set $l6
                (i32.add
                  (local.tee $l7
                    (i32.add
                      (local.get $p0)
                      (i32.const -8)))
                  (local.get $l5)))
              (block $B7
                (block $B8
                  (block $B9
                    (block $B10
                      (br_if $B10
                        (i32.ge_u
                          (local.get $l5)
                          (local.get $p1)))
                      (br_if $B7
                        (i32.eq
                          (local.get $l6)
                          (i32.load offset=1050332
                            (i32.const 0))))
                      (br_if $B8
                        (i32.eq
                          (local.get $l6)
                          (i32.load offset=1050328
                            (i32.const 0))))
                      (br_if $B5
                        (i32.and
                          (local.tee $l4
                            (i32.load offset=4
                              (local.get $l6)))
                          (i32.const 2)))
                      (br_if $B5
                        (i32.lt_u
                          (local.tee $l5
                            (i32.add
                              (local.tee $l4
                                (i32.and
                                  (local.get $l4)
                                  (i32.const -8)))
                              (local.get $l5)))
                          (local.get $p1)))
                      (call $f29
                        (local.get $l6)
                        (local.get $l4))
                      (br_if $B9
                        (i32.lt_u
                          (local.tee $p2
                            (i32.sub
                              (local.get $l5)
                              (local.get $p1)))
                          (i32.const 16)))
                      (i32.store
                        (local.get $l3)
                        (i32.or
                          (i32.or
                            (local.get $p1)
                            (i32.and
                              (i32.load
                                (local.get $l3))
                              (i32.const 1)))
                          (i32.const 2)))
                      (i32.store offset=4
                        (local.tee $p1
                          (i32.add
                            (local.get $l7)
                            (local.get $p1)))
                        (i32.or
                          (local.get $p2)
                          (i32.const 3)))
                      (i32.store offset=4
                        (local.tee $l5
                          (i32.add
                            (local.get $l7)
                            (local.get $l5)))
                        (i32.or
                          (i32.load offset=4
                            (local.get $l5))
                          (i32.const 1)))
                      (call $f30
                        (local.get $p1)
                        (local.get $p2))
                      (return
                        (local.get $p0)))
                    (br_if $B4
                      (i32.le_u
                        (local.tee $p2
                          (i32.sub
                            (local.get $l5)
                            (local.get $p1)))
                        (i32.const 15)))
                    (i32.store
                      (local.get $l3)
                      (i32.or
                        (i32.or
                          (local.get $p1)
                          (i32.and
                            (local.get $l4)
                            (i32.const 1)))
                        (i32.const 2)))
                    (i32.store offset=4
                      (local.tee $l5
                        (i32.add
                          (local.get $l7)
                          (local.get $p1)))
                      (i32.or
                        (local.get $p2)
                        (i32.const 3)))
                    (i32.store offset=4
                      (local.get $l6)
                      (i32.or
                        (i32.load offset=4
                          (local.get $l6))
                        (i32.const 1)))
                    (call $f30
                      (local.get $l5)
                      (local.get $p2))
                    (return
                      (local.get $p0)))
                  (i32.store
                    (local.get $l3)
                    (i32.or
                      (i32.or
                        (local.get $l5)
                        (i32.and
                          (i32.load
                            (local.get $l3))
                          (i32.const 1)))
                      (i32.const 2)))
                  (i32.store offset=4
                    (local.tee $p2
                      (i32.add
                        (local.get $l7)
                        (local.get $l5)))
                    (i32.or
                      (i32.load offset=4
                        (local.get $p2))
                      (i32.const 1)))
                  (return
                    (local.get $p0)))
                (br_if $B5
                  (i32.lt_u
                    (local.tee $l5
                      (i32.add
                        (i32.load offset=1050320
                          (i32.const 0))
                        (local.get $l5)))
                    (local.get $p1)))
                (block $B11
                  (block $B12
                    (br_if $B12
                      (i32.gt_u
                        (local.tee $p2
                          (i32.sub
                            (local.get $l5)
                            (local.get $p1)))
                        (i32.const 15)))
                    (i32.store
                      (local.get $l3)
                      (i32.or
                        (i32.or
                          (i32.and
                            (local.get $l4)
                            (i32.const 1))
                          (local.get $l5))
                        (i32.const 2)))
                    (i32.store offset=4
                      (local.tee $p2
                        (i32.add
                          (local.get $l7)
                          (local.get $l5)))
                      (i32.or
                        (i32.load offset=4
                          (local.get $p2))
                        (i32.const 1)))
                    (local.set $p2
                      (i32.const 0))
                    (local.set $p1
                      (i32.const 0))
                    (br $B11))
                  (i32.store
                    (local.get $l3)
                    (i32.or
                      (i32.or
                        (local.get $p1)
                        (i32.and
                          (local.get $l4)
                          (i32.const 1)))
                      (i32.const 2)))
                  (i32.store offset=4
                    (local.tee $p1
                      (i32.add
                        (local.get $l7)
                        (local.get $p1)))
                    (i32.or
                      (local.get $p2)
                      (i32.const 1)))
                  (i32.store
                    (local.tee $l5
                      (i32.add
                        (local.get $l7)
                        (local.get $l5)))
                    (local.get $p2))
                  (i32.store offset=4
                    (local.get $l5)
                    (i32.and
                      (i32.load offset=4
                        (local.get $l5))
                      (i32.const -2))))
                (i32.store offset=1050328
                  (i32.const 0)
                  (local.get $p1))
                (i32.store offset=1050320
                  (i32.const 0)
                  (local.get $p2))
                (return
                  (local.get $p0)))
              (br_if $B0
                (i32.gt_u
                  (local.tee $l5
                    (i32.add
                      (i32.load offset=1050324
                        (i32.const 0))
                      (local.get $l5)))
                  (local.get $p1))))
            (block $B13
              (br_if $B13
                (local.tee $l5
                  (call $f19
                    (local.get $p2))))
              (return
                (i32.const 0)))
            (local.set $p2
              (call $f44
                (local.get $l5)
                (local.get $p0)
                (select
                  (local.tee $p1
                    (i32.add
                      (select
                        (i32.const -4)
                        (i32.const -8)
                        (i32.and
                          (local.tee $p1
                            (i32.load
                              (local.get $l3)))
                          (i32.const 3)))
                      (i32.and
                        (local.get $p1)
                        (i32.const -8))))
                  (local.get $p2)
                  (i32.lt_u
                    (local.get $p1)
                    (local.get $p2)))))
            (call $f27
              (local.get $p0))
            (local.set $p0
              (local.get $p2)))
          (return
            (local.get $p0)))
        (call $f28
          (i32.const 1049765)
          (i32.const 1049812))
        (unreachable))
      (call $f28
        (i32.const 1049828)
        (i32.const 1049876))
      (unreachable))
    (i32.store
      (local.get $l3)
      (i32.or
        (i32.or
          (local.get $p1)
          (i32.and
            (local.get $l4)
            (i32.const 1)))
        (i32.const 2)))
    (i32.store offset=4
      (local.tee $p2
        (i32.add
          (local.get $l7)
          (local.get $p1)))
      (i32.or
        (local.tee $l5
          (i32.sub
            (local.get $l5)
            (local.get $p1)))
        (i32.const 1)))
    (i32.store offset=1050324
      (i32.const 0)
      (local.get $l5))
    (i32.store offset=1050332
      (i32.const 0)
      (local.get $p2))
    (local.get $p0))
  (func $f16 (type $t2) (param $p0 i32) (param $p1 i32)
    (local $l2 i32)
    (global.set $g0
      (local.tee $l2
        (i32.sub
          (global.get $g0)
          (i32.const 16))))
    (call $f18
      (i32.add
        (local.get $l2)
        (i32.const 8))
      (local.get $p1)
      (i32.const 0))
    (local.set $p1
      (i32.load offset=12
        (local.get $l2)))
    (i32.store
      (local.get $p0)
      (i32.load offset=8
        (local.get $l2)))
    (i32.store offset=4
      (local.get $p0)
      (local.get $p1))
    (global.set $g0
      (i32.add
        (local.get $l2)
        (i32.const 16))))
  (func $f17 (type $t4) (param $p0 i32) (param $p1 i32) (param $p2 i32)
    (block $B0
      (br_if $B0
        (local.get $p0))
      (call $f32
        (local.get $p2)))
    (unreachable))
  (func $f18 (type $t4) (param $p0 i32) (param $p1 i32) (param $p2 i32)
    (local $l3 i32)
    (local.set $l3
      (i32.const 0))
    (drop
      (i32.load8_u offset=1049892
        (i32.const 0)))
    (block $B0
      (block $B1
        (br_if $B1
          (local.get $p2))
        (local.set $l3
          (call $f19
            (local.get $p1)))
        (br $B0))
      (br_if $B0
        (i32.eqz
          (local.tee $p2
            (call $f19
              (local.get $p1)))))
      (block $B2
        (br_if $B2
          (i32.eqz
            (i32.and
              (i32.load8_u
                (i32.add
                  (local.get $p2)
                  (i32.const -4)))
              (i32.const 3))))
        (drop
          (call $f46
            (local.get $p2)
            (i32.const 0)
            (local.get $p1))))
      (local.set $l3
        (local.get $p2)))
    (i32.store offset=4
      (local.get $p0)
      (local.get $p1))
    (i32.store
      (local.get $p0)
      (local.get $l3)))
  (func $f19 (type $t5) (param $p0 i32) (result i32)
    (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i64)
    (block $B0
      (block $B1
        (block $B2
          (block $B3
            (block $B4
              (block $B5
                (block $B6
                  (block $B7
                    (br_if $B7
                      (i32.gt_u
                        (local.get $p0)
                        (i32.const 244)))
                    (br_if $B6
                      (i32.and
                        (local.tee $p0
                          (i32.shr_u
                            (local.tee $l1
                              (i32.load offset=1050312
                                (i32.const 0)))
                            (local.tee $l3
                              (i32.shr_u
                                (local.tee $l2
                                  (select
                                    (i32.const 16)
                                    (i32.and
                                      (i32.add
                                        (local.get $p0)
                                        (i32.const 11))
                                      (i32.const 504))
                                    (i32.lt_u
                                      (local.get $p0)
                                      (i32.const 11))))
                                (i32.const 3)))))
                        (i32.const 3)))
                    (br_if $B0
                      (i32.le_u
                        (local.get $l2)
                        (i32.load offset=1050320
                          (i32.const 0))))
                    (br_if $B5
                      (local.get $p0))
                    (br_if $B4
                      (local.tee $p0
                        (i32.load offset=1050316
                          (i32.const 0))))
                    (br $B0))
                  (local.set $l2
                    (i32.and
                      (local.tee $l3
                        (i32.add
                          (local.get $p0)
                          (i32.const 11)))
                      (i32.const -8)))
                  (br_if $B0
                    (i32.eqz
                      (local.tee $l4
                        (i32.load offset=1050316
                          (i32.const 0)))))
                  (local.set $l5
                    (i32.const 31))
                  (block $B8
                    (br_if $B8
                      (i32.gt_u
                        (local.get $p0)
                        (i32.const 16777204)))
                    (local.set $l5
                      (i32.add
                        (i32.sub
                          (i32.and
                            (i32.shr_u
                              (local.get $l2)
                              (i32.sub
                                (i32.const 6)
                                (local.tee $p0
                                  (i32.clz
                                    (i32.shr_u
                                      (local.get $l3)
                                      (i32.const 8))))))
                            (i32.const 1))
                          (i32.shl
                            (local.get $p0)
                            (i32.const 1)))
                        (i32.const 62))))
                  (local.set $l3
                    (i32.sub
                      (i32.const 0)
                      (local.get $l2)))
                  (block $B9
                    (br_if $B9
                      (local.tee $l1
                        (i32.load
                          (i32.add
                            (i32.shl
                              (local.get $l5)
                              (i32.const 2))
                            (i32.const 1049904)))))
                    (local.set $p0
                      (i32.const 0))
                    (local.set $l6
                      (i32.const 0))
                    (br $B3))
                  (local.set $p0
                    (i32.const 0))
                  (local.set $l7
                    (i32.shl
                      (local.get $l2)
                      (select
                        (i32.const 0)
                        (i32.sub
                          (i32.const 25)
                          (i32.shr_u
                            (local.get $l5)
                            (i32.const 1)))
                        (i32.eq
                          (local.get $l5)
                          (i32.const 31)))))
                  (local.set $l6
                    (i32.const 0))
                  (loop $L10
                    (block $B11
                      (br_if $B11
                        (i32.lt_u
                          (local.tee $l8
                            (i32.and
                              (i32.load offset=4
                                (local.tee $l1
                                  (local.get $l1)))
                              (i32.const -8)))
                          (local.get $l2)))
                      (br_if $B11
                        (i32.ge_u
                          (local.tee $l8
                            (i32.sub
                              (local.get $l8)
                              (local.get $l2)))
                          (local.get $l3)))
                      (local.set $l3
                        (local.get $l8))
                      (local.set $l6
                        (local.get $l1))
                      (br_if $B11
                        (local.get $l8))
                      (local.set $l3
                        (i32.const 0))
                      (local.set $l6
                        (local.get $l1))
                      (local.set $p0
                        (local.get $l1))
                      (br $B2))
                    (local.set $p0
                      (select
                        (select
                          (local.tee $l8
                            (i32.load offset=20
                              (local.get $l1)))
                          (local.get $p0)
                          (i32.ne
                            (local.get $l8)
                            (local.tee $l1
                              (i32.load
                                (i32.add
                                  (i32.add
                                    (local.get $l1)
                                    (i32.and
                                      (i32.shr_u
                                        (local.get $l7)
                                        (i32.const 29))
                                      (i32.const 4)))
                                  (i32.const 16))))))
                        (local.get $p0)
                        (local.get $l8)))
                    (local.set $l7
                      (i32.shl
                        (local.get $l7)
                        (i32.const 1)))
                    (br_if $B3
                      (i32.eqz
                        (local.get $l1)))
                    (br $L10)))
                (block $B12
                  (block $B13
                    (br_if $B13
                      (i32.eq
                        (local.tee $l2
                          (i32.add
                            (local.tee $p0
                              (i32.shl
                                (local.tee $l7
                                  (i32.add
                                    (i32.and
                                      (i32.xor
                                        (local.get $p0)
                                        (i32.const -1))
                                      (i32.const 1))
                                    (local.get $l3)))
                                (i32.const 3)))
                            (i32.const 1050048)))
                        (local.tee $l6
                          (i32.load offset=8
                            (local.tee $l3
                              (i32.load
                                (i32.add
                                  (local.get $p0)
                                  (i32.const 1050056))))))))
                    (i32.store offset=12
                      (local.get $l6)
                      (local.get $l2))
                    (i32.store offset=8
                      (local.get $l2)
                      (local.get $l6))
                    (br $B12))
                  (i32.store offset=1050312
                    (i32.const 0)
                    (i32.and
                      (local.get $l1)
                      (i32.rotl
                        (i32.const -2)
                        (local.get $l7)))))
                (i32.store offset=4
                  (local.get $l3)
                  (i32.or
                    (local.get $p0)
                    (i32.const 3)))
                (i32.store offset=4
                  (local.tee $p0
                    (i32.add
                      (local.get $l3)
                      (local.get $p0)))
                  (i32.or
                    (i32.load offset=4
                      (local.get $p0))
                    (i32.const 1)))
                (return
                  (i32.add
                    (local.get $l3)
                    (i32.const 8))))
              (block $B14
                (block $B15
                  (br_if $B15
                    (i32.eq
                      (local.tee $l6
                        (i32.add
                          (local.tee $l3
                            (i32.shl
                              (local.tee $l8
                                (i32.ctz
                                  (i32.and
                                    (i32.shl
                                      (local.get $p0)
                                      (local.get $l3))
                                    (i32.or
                                      (local.tee $p0
                                        (i32.shl
                                          (i32.const 2)
                                          (local.get $l3)))
                                      (i32.sub
                                        (i32.const 0)
                                        (local.get $p0))))))
                              (i32.const 3)))
                          (i32.const 1050048)))
                      (local.tee $l7
                        (i32.load offset=8
                          (local.tee $p0
                            (i32.load
                              (i32.add
                                (local.get $l3)
                                (i32.const 1050056))))))))
                  (i32.store offset=12
                    (local.get $l7)
                    (local.get $l6))
                  (i32.store offset=8
                    (local.get $l6)
                    (local.get $l7))
                  (br $B14))
                (i32.store offset=1050312
                  (i32.const 0)
                  (i32.and
                    (local.get $l1)
                    (i32.rotl
                      (i32.const -2)
                      (local.get $l8)))))
              (i32.store offset=4
                (local.get $p0)
                (i32.or
                  (local.get $l2)
                  (i32.const 3)))
              (i32.store offset=4
                (local.tee $l7
                  (i32.add
                    (local.get $p0)
                    (local.get $l2)))
                (i32.or
                  (local.tee $l2
                    (i32.sub
                      (local.get $l3)
                      (local.get $l2)))
                  (i32.const 1)))
              (i32.store
                (i32.add
                  (local.get $p0)
                  (local.get $l3))
                (local.get $l2))
              (block $B16
                (br_if $B16
                  (i32.eqz
                    (local.tee $l1
                      (i32.load offset=1050320
                        (i32.const 0)))))
                (local.set $l6
                  (i32.add
                    (i32.and
                      (local.get $l1)
                      (i32.const -8))
                    (i32.const 1050048)))
                (local.set $l3
                  (i32.load offset=1050328
                    (i32.const 0)))
                (block $B17
                  (block $B18
                    (br_if $B18
                      (i32.and
                        (local.tee $l8
                          (i32.load offset=1050312
                            (i32.const 0)))
                        (local.tee $l1
                          (i32.shl
                            (i32.const 1)
                            (i32.shr_u
                              (local.get $l1)
                              (i32.const 3))))))
                    (i32.store offset=1050312
                      (i32.const 0)
                      (i32.or
                        (local.get $l8)
                        (local.get $l1)))
                    (local.set $l1
                      (local.get $l6))
                    (br $B17))
                  (local.set $l1
                    (i32.load offset=8
                      (local.get $l6))))
                (i32.store offset=8
                  (local.get $l6)
                  (local.get $l3))
                (i32.store offset=12
                  (local.get $l1)
                  (local.get $l3))
                (i32.store offset=12
                  (local.get $l3)
                  (local.get $l6))
                (i32.store offset=8
                  (local.get $l3)
                  (local.get $l1)))
              (i32.store offset=1050328
                (i32.const 0)
                (local.get $l7))
              (i32.store offset=1050320
                (i32.const 0)
                (local.get $l2))
              (return
                (i32.add
                  (local.get $p0)
                  (i32.const 8))))
            (local.set $l3
              (i32.sub
                (i32.and
                  (i32.load offset=4
                    (local.tee $l6
                      (i32.load
                        (i32.add
                          (i32.shl
                            (i32.ctz
                              (local.get $p0))
                            (i32.const 2))
                          (i32.const 1049904)))))
                  (i32.const -8))
                (local.get $l2)))
            (local.set $l1
              (local.get $l6))
            (block $B19
              (block $B20
                (loop $L21
                  (block $B22
                    (br_if $B22
                      (local.tee $p0
                        (i32.load offset=16
                          (local.get $l6))))
                    (br_if $B22
                      (local.tee $p0
                        (i32.load offset=20
                          (local.get $l6))))
                    (local.set $l5
                      (i32.load offset=24
                        (local.get $l1)))
                    (block $B23
                      (block $B24
                        (block $B25
                          (br_if $B25
                            (i32.ne
                              (local.tee $p0
                                (i32.load offset=12
                                  (local.get $l1)))
                              (local.get $l1)))
                          (br_if $B24
                            (local.tee $l6
                              (i32.load
                                (i32.add
                                  (local.get $l1)
                                  (select
                                    (i32.const 20)
                                    (i32.const 16)
                                    (local.tee $p0
                                      (i32.load offset=20
                                        (local.get $l1))))))))
                          (local.set $p0
                            (i32.const 0))
                          (br $B23))
                        (i32.store offset=12
                          (local.tee $l6
                            (i32.load offset=8
                              (local.get $l1)))
                          (local.get $p0))
                        (i32.store offset=8
                          (local.get $p0)
                          (local.get $l6))
                        (br $B23))
                      (local.set $l7
                        (select
                          (i32.add
                            (local.get $l1)
                            (i32.const 20))
                          (i32.add
                            (local.get $l1)
                            (i32.const 16))
                          (local.get $p0)))
                      (loop $L26
                        (local.set $l8
                          (local.get $l7))
                        (local.set $l7
                          (select
                            (i32.add
                              (local.tee $p0
                                (local.get $l6))
                              (i32.const 20))
                            (i32.add
                              (local.get $p0)
                              (i32.const 16))
                            (local.tee $l6
                              (i32.load offset=20
                                (local.get $p0)))))
                        (br_if $L26
                          (local.tee $l6
                            (i32.load
                              (i32.add
                                (local.get $p0)
                                (select
                                  (i32.const 20)
                                  (i32.const 16)
                                  (local.get $l6)))))))
                      (i32.store
                        (local.get $l8)
                        (i32.const 0)))
                    (br_if $B19
                      (i32.eqz
                        (local.get $l5)))
                    (block $B27
                      (br_if $B27
                        (i32.eq
                          (i32.load
                            (local.tee $l6
                              (i32.add
                                (i32.shl
                                  (i32.load offset=28
                                    (local.get $l1))
                                  (i32.const 2))
                                (i32.const 1049904))))
                          (local.get $l1)))
                      (i32.store
                        (i32.add
                          (local.get $l5)
                          (select
                            (i32.const 16)
                            (i32.const 20)
                            (i32.eq
                              (i32.load offset=16
                                (local.get $l5))
                              (local.get $l1))))
                        (local.get $p0))
                      (br_if $B19
                        (i32.eqz
                          (local.get $p0)))
                      (br $B20))
                    (i32.store
                      (local.get $l6)
                      (local.get $p0))
                    (br_if $B20
                      (local.get $p0))
                    (i32.store offset=1050316
                      (i32.const 0)
                      (i32.and
                        (i32.load offset=1050316
                          (i32.const 0))
                        (i32.rotl
                          (i32.const -2)
                          (i32.load offset=28
                            (local.get $l1)))))
                    (br $B19))
                  (local.set $l3
                    (select
                      (local.tee $l6
                        (i32.sub
                          (i32.and
                            (i32.load offset=4
                              (local.get $p0))
                            (i32.const -8))
                          (local.get $l2)))
                      (local.get $l3)
                      (local.tee $l6
                        (i32.lt_u
                          (local.get $l6)
                          (local.get $l3)))))
                  (local.set $l1
                    (select
                      (local.get $p0)
                      (local.get $l1)
                      (local.get $l6)))
                  (local.set $l6
                    (local.get $p0))
                  (br $L21)))
              (i32.store offset=24
                (local.get $p0)
                (local.get $l5))
              (block $B28
                (br_if $B28
                  (i32.eqz
                    (local.tee $l6
                      (i32.load offset=16
                        (local.get $l1)))))
                (i32.store offset=16
                  (local.get $p0)
                  (local.get $l6))
                (i32.store offset=24
                  (local.get $l6)
                  (local.get $p0)))
              (br_if $B19
                (i32.eqz
                  (local.tee $l6
                    (i32.load offset=20
                      (local.get $l1)))))
              (i32.store offset=20
                (local.get $p0)
                (local.get $l6))
              (i32.store offset=24
                (local.get $l6)
                (local.get $p0)))
            (block $B29
              (block $B30
                (block $B31
                  (br_if $B31
                    (i32.lt_u
                      (local.get $l3)
                      (i32.const 16)))
                  (i32.store offset=4
                    (local.get $l1)
                    (i32.or
                      (local.get $l2)
                      (i32.const 3)))
                  (i32.store offset=4
                    (local.tee $l2
                      (i32.add
                        (local.get $l1)
                        (local.get $l2)))
                    (i32.or
                      (local.get $l3)
                      (i32.const 1)))
                  (i32.store
                    (i32.add
                      (local.get $l2)
                      (local.get $l3))
                    (local.get $l3))
                  (br_if $B30
                    (i32.eqz
                      (local.tee $l7
                        (i32.load offset=1050320
                          (i32.const 0)))))
                  (local.set $l6
                    (i32.add
                      (i32.and
                        (local.get $l7)
                        (i32.const -8))
                      (i32.const 1050048)))
                  (local.set $p0
                    (i32.load offset=1050328
                      (i32.const 0)))
                  (block $B32
                    (block $B33
                      (br_if $B33
                        (i32.and
                          (local.tee $l8
                            (i32.load offset=1050312
                              (i32.const 0)))
                          (local.tee $l7
                            (i32.shl
                              (i32.const 1)
                              (i32.shr_u
                                (local.get $l7)
                                (i32.const 3))))))
                      (i32.store offset=1050312
                        (i32.const 0)
                        (i32.or
                          (local.get $l8)
                          (local.get $l7)))
                      (local.set $l7
                        (local.get $l6))
                      (br $B32))
                    (local.set $l7
                      (i32.load offset=8
                        (local.get $l6))))
                  (i32.store offset=8
                    (local.get $l6)
                    (local.get $p0))
                  (i32.store offset=12
                    (local.get $l7)
                    (local.get $p0))
                  (i32.store offset=12
                    (local.get $p0)
                    (local.get $l6))
                  (i32.store offset=8
                    (local.get $p0)
                    (local.get $l7))
                  (br $B30))
                (i32.store offset=4
                  (local.get $l1)
                  (i32.or
                    (local.tee $p0
                      (i32.add
                        (local.get $l3)
                        (local.get $l2)))
                    (i32.const 3)))
                (i32.store offset=4
                  (local.tee $p0
                    (i32.add
                      (local.get $l1)
                      (local.get $p0)))
                  (i32.or
                    (i32.load offset=4
                      (local.get $p0))
                    (i32.const 1)))
                (br $B29))
              (i32.store offset=1050328
                (i32.const 0)
                (local.get $l2))
              (i32.store offset=1050320
                (i32.const 0)
                (local.get $l3)))
            (return
              (i32.add
                (local.get $l1)
                (i32.const 8))))
          (block $B34
            (br_if $B34
              (i32.or
                (local.get $p0)
                (local.get $l6)))
            (local.set $l6
              (i32.const 0))
            (br_if $B0
              (i32.eqz
                (local.tee $p0
                  (i32.and
                    (i32.or
                      (local.tee $p0
                        (i32.shl
                          (i32.const 2)
                          (local.get $l5)))
                      (i32.sub
                        (i32.const 0)
                        (local.get $p0)))
                    (local.get $l4)))))
            (local.set $p0
              (i32.load
                (i32.add
                  (i32.shl
                    (i32.ctz
                      (local.get $p0))
                    (i32.const 2))
                  (i32.const 1049904)))))
          (br_if $B1
            (i32.eqz
              (local.get $p0))))
        (loop $L35
          (local.set $l4
            (select
              (local.get $p0)
              (local.get $l6)
              (local.tee $l5
                (i32.lt_u
                  (local.tee $l8
                    (i32.sub
                      (local.tee $l1
                        (i32.and
                          (i32.load offset=4
                            (local.get $p0))
                          (i32.const -8)))
                      (local.get $l2)))
                  (local.get $l3)))))
          (local.set $l7
            (i32.lt_u
              (local.get $l1)
              (local.get $l2)))
          (local.set $l8
            (select
              (local.get $l8)
              (local.get $l3)
              (local.get $l5)))
          (block $B36
            (br_if $B36
              (local.tee $l1
                (i32.load offset=16
                  (local.get $p0))))
            (local.set $l1
              (i32.load offset=20
                (local.get $p0))))
          (local.set $l6
            (select
              (local.get $l6)
              (local.get $l4)
              (local.get $l7)))
          (local.set $l3
            (select
              (local.get $l3)
              (local.get $l8)
              (local.get $l7)))
          (local.set $p0
            (local.get $l1))
          (br_if $L35
            (local.get $l1))))
      (br_if $B0
        (i32.eqz
          (local.get $l6)))
      (block $B37
        (br_if $B37
          (i32.lt_u
            (local.tee $p0
              (i32.load offset=1050320
                (i32.const 0)))
            (local.get $l2)))
        (br_if $B0
          (i32.ge_u
            (local.get $l3)
            (i32.sub
              (local.get $p0)
              (local.get $l2)))))
      (local.set $l5
        (i32.load offset=24
          (local.get $l6)))
      (block $B38
        (block $B39
          (block $B40
            (br_if $B40
              (i32.ne
                (local.tee $p0
                  (i32.load offset=12
                    (local.get $l6)))
                (local.get $l6)))
            (br_if $B39
              (local.tee $l1
                (i32.load
                  (i32.add
                    (local.get $l6)
                    (select
                      (i32.const 20)
                      (i32.const 16)
                      (local.tee $p0
                        (i32.load offset=20
                          (local.get $l6))))))))
            (local.set $p0
              (i32.const 0))
            (br $B38))
          (i32.store offset=12
            (local.tee $l1
              (i32.load offset=8
                (local.get $l6)))
            (local.get $p0))
          (i32.store offset=8
            (local.get $p0)
            (local.get $l1))
          (br $B38))
        (local.set $l7
          (select
            (i32.add
              (local.get $l6)
              (i32.const 20))
            (i32.add
              (local.get $l6)
              (i32.const 16))
            (local.get $p0)))
        (loop $L41
          (local.set $l8
            (local.get $l7))
          (local.set $l7
            (select
              (i32.add
                (local.tee $p0
                  (local.get $l1))
                (i32.const 20))
              (i32.add
                (local.get $p0)
                (i32.const 16))
              (local.tee $l1
                (i32.load offset=20
                  (local.get $p0)))))
          (br_if $L41
            (local.tee $l1
              (i32.load
                (i32.add
                  (local.get $p0)
                  (select
                    (i32.const 20)
                    (i32.const 16)
                    (local.get $l1)))))))
        (i32.store
          (local.get $l8)
          (i32.const 0)))
      (block $B42
        (br_if $B42
          (i32.eqz
            (local.get $l5)))
        (block $B43
          (block $B44
            (br_if $B44
              (i32.eq
                (i32.load
                  (local.tee $l1
                    (i32.add
                      (i32.shl
                        (i32.load offset=28
                          (local.get $l6))
                        (i32.const 2))
                      (i32.const 1049904))))
                (local.get $l6)))
            (i32.store
              (i32.add
                (local.get $l5)
                (select
                  (i32.const 16)
                  (i32.const 20)
                  (i32.eq
                    (i32.load offset=16
                      (local.get $l5))
                    (local.get $l6))))
              (local.get $p0))
            (br_if $B42
              (i32.eqz
                (local.get $p0)))
            (br $B43))
          (i32.store
            (local.get $l1)
            (local.get $p0))
          (br_if $B43
            (local.get $p0))
          (i32.store offset=1050316
            (i32.const 0)
            (i32.and
              (i32.load offset=1050316
                (i32.const 0))
              (i32.rotl
                (i32.const -2)
                (i32.load offset=28
                  (local.get $l6)))))
          (br $B42))
        (i32.store offset=24
          (local.get $p0)
          (local.get $l5))
        (block $B45
          (br_if $B45
            (i32.eqz
              (local.tee $l1
                (i32.load offset=16
                  (local.get $l6)))))
          (i32.store offset=16
            (local.get $p0)
            (local.get $l1))
          (i32.store offset=24
            (local.get $l1)
            (local.get $p0)))
        (br_if $B42
          (i32.eqz
            (local.tee $l1
              (i32.load offset=20
                (local.get $l6)))))
        (i32.store offset=20
          (local.get $p0)
          (local.get $l1))
        (i32.store offset=24
          (local.get $l1)
          (local.get $p0)))
      (block $B46
        (block $B47
          (br_if $B47
            (i32.lt_u
              (local.get $l3)
              (i32.const 16)))
          (i32.store offset=4
            (local.get $l6)
            (i32.or
              (local.get $l2)
              (i32.const 3)))
          (i32.store offset=4
            (local.tee $p0
              (i32.add
                (local.get $l6)
                (local.get $l2)))
            (i32.or
              (local.get $l3)
              (i32.const 1)))
          (i32.store
            (i32.add
              (local.get $p0)
              (local.get $l3))
            (local.get $l3))
          (block $B48
            (br_if $B48
              (i32.lt_u
                (local.get $l3)
                (i32.const 256)))
            (call $f43
              (local.get $p0)
              (local.get $l3))
            (br $B46))
          (local.set $l2
            (i32.add
              (i32.and
                (local.get $l3)
                (i32.const 248))
              (i32.const 1050048)))
          (block $B49
            (block $B50
              (br_if $B50
                (i32.and
                  (local.tee $l1
                    (i32.load offset=1050312
                      (i32.const 0)))
                  (local.tee $l3
                    (i32.shl
                      (i32.const 1)
                      (i32.shr_u
                        (local.get $l3)
                        (i32.const 3))))))
              (i32.store offset=1050312
                (i32.const 0)
                (i32.or
                  (local.get $l1)
                  (local.get $l3)))
              (local.set $l3
                (local.get $l2))
              (br $B49))
            (local.set $l3
              (i32.load offset=8
                (local.get $l2))))
          (i32.store offset=8
            (local.get $l2)
            (local.get $p0))
          (i32.store offset=12
            (local.get $l3)
            (local.get $p0))
          (i32.store offset=12
            (local.get $p0)
            (local.get $l2))
          (i32.store offset=8
            (local.get $p0)
            (local.get $l3))
          (br $B46))
        (i32.store offset=4
          (local.get $l6)
          (i32.or
            (local.tee $p0
              (i32.add
                (local.get $l3)
                (local.get $l2)))
            (i32.const 3)))
        (i32.store offset=4
          (local.tee $p0
            (i32.add
              (local.get $l6)
              (local.get $p0)))
          (i32.or
            (i32.load offset=4
              (local.get $p0))
            (i32.const 1))))
      (return
        (i32.add
          (local.get $l6)
          (i32.const 8))))
    (block $B51
      (block $B52
        (block $B53
          (block $B54
            (block $B55
              (block $B56
                (block $B57
                  (br_if $B57
                    (i32.ge_u
                      (local.tee $p0
                        (i32.load offset=1050320
                          (i32.const 0)))
                      (local.get $l2)))
                  (block $B58
                    (br_if $B58
                      (i32.gt_u
                        (local.tee $p0
                          (i32.load offset=1050324
                            (i32.const 0)))
                        (local.get $l2)))
                    (local.set $p0
                      (i32.const 0))
                    (br_if $B51
                      (local.tee $l7
                        (i32.eq
                          (local.tee $l3
                            (memory.grow
                              (i32.shr_u
                                (local.tee $l6
                                  (i32.add
                                    (local.get $l2)
                                    (i32.const 65583)))
                                (i32.const 16))))
                          (i32.const -1))))
                    (br_if $B51
                      (i32.eqz
                        (local.tee $l1
                          (i32.shl
                            (local.get $l3)
                            (i32.const 16)))))
                    (i32.store offset=1050336
                      (i32.const 0)
                      (local.tee $p0
                        (i32.add
                          (i32.load offset=1050336
                            (i32.const 0))
                          (local.tee $l8
                            (select
                              (i32.const 0)
                              (i32.and
                                (local.get $l6)
                                (i32.const -65536))
                              (local.get $l7))))))
                    (i32.store offset=1050340
                      (i32.const 0)
                      (select
                        (local.get $p0)
                        (local.tee $l3
                          (i32.load offset=1050340
                            (i32.const 0)))
                        (i32.gt_u
                          (local.get $p0)
                          (local.get $l3))))
                    (block $B59
                      (block $B60
                        (block $B61
                          (br_if $B61
                            (i32.eqz
                              (local.tee $l3
                                (i32.load offset=1050332
                                  (i32.const 0)))))
                          (local.set $p0
                            (i32.const 1050032))
                          (loop $L62
                            (br_if $B60
                              (i32.eq
                                (i32.add
                                  (local.tee $l6
                                    (i32.load
                                      (local.get $p0)))
                                  (local.tee $l7
                                    (i32.load offset=4
                                      (local.get $p0))))
                                (local.get $l1)))
                            (br_if $L62
                              (local.tee $p0
                                (i32.load offset=8
                                  (local.get $p0))))
                            (br $B59)))
                        (block $B63
                          (block $B64
                            (br_if $B64
                              (i32.eqz
                                (local.tee $p0
                                  (i32.load offset=1050348
                                    (i32.const 0)))))
                            (br_if $B63
                              (i32.le_u
                                (local.get $p0)
                                (local.get $l1))))
                          (i32.store offset=1050348
                            (i32.const 0)
                            (local.get $l1)))
                        (i32.store offset=1050352
                          (i32.const 0)
                          (i32.const 4095))
                        (i32.store offset=1050036
                          (i32.const 0)
                          (local.get $l8))
                        (i32.store offset=1050032
                          (i32.const 0)
                          (local.get $l1))
                        (i32.store offset=1050060
                          (i32.const 0)
                          (i32.const 1050048))
                        (i32.store offset=1050068
                          (i32.const 0)
                          (i32.const 1050056))
                        (i32.store offset=1050056
                          (i32.const 0)
                          (i32.const 1050048))
                        (i32.store offset=1050076
                          (i32.const 0)
                          (i32.const 1050064))
                        (i32.store offset=1050064
                          (i32.const 0)
                          (i32.const 1050056))
                        (i32.store offset=1050084
                          (i32.const 0)
                          (i32.const 1050072))
                        (i32.store offset=1050072
                          (i32.const 0)
                          (i32.const 1050064))
                        (i32.store offset=1050092
                          (i32.const 0)
                          (i32.const 1050080))
                        (i32.store offset=1050080
                          (i32.const 0)
                          (i32.const 1050072))
                        (i32.store offset=1050100
                          (i32.const 0)
                          (i32.const 1050088))
                        (i32.store offset=1050088
                          (i32.const 0)
                          (i32.const 1050080))
                        (i32.store offset=1050108
                          (i32.const 0)
                          (i32.const 1050096))
                        (i32.store offset=1050096
                          (i32.const 0)
                          (i32.const 1050088))
                        (i32.store offset=1050116
                          (i32.const 0)
                          (i32.const 1050104))
                        (i32.store offset=1050104
                          (i32.const 0)
                          (i32.const 1050096))
                        (i32.store offset=1050044
                          (i32.const 0)
                          (i32.const 0))
                        (i32.store offset=1050124
                          (i32.const 0)
                          (i32.const 1050112))
                        (i32.store offset=1050112
                          (i32.const 0)
                          (i32.const 1050104))
                        (i32.store offset=1050120
                          (i32.const 0)
                          (i32.const 1050112))
                        (i32.store offset=1050132
                          (i32.const 0)
                          (i32.const 1050120))
                        (i32.store offset=1050128
                          (i32.const 0)
                          (i32.const 1050120))
                        (i32.store offset=1050140
                          (i32.const 0)
                          (i32.const 1050128))
                        (i32.store offset=1050136
                          (i32.const 0)
                          (i32.const 1050128))
                        (i32.store offset=1050148
                          (i32.const 0)
                          (i32.const 1050136))
                        (i32.store offset=1050144
                          (i32.const 0)
                          (i32.const 1050136))
                        (i32.store offset=1050156
                          (i32.const 0)
                          (i32.const 1050144))
                        (i32.store offset=1050152
                          (i32.const 0)
                          (i32.const 1050144))
                        (i32.store offset=1050164
                          (i32.const 0)
                          (i32.const 1050152))
                        (i32.store offset=1050160
                          (i32.const 0)
                          (i32.const 1050152))
                        (i32.store offset=1050172
                          (i32.const 0)
                          (i32.const 1050160))
                        (i32.store offset=1050168
                          (i32.const 0)
                          (i32.const 1050160))
                        (i32.store offset=1050180
                          (i32.const 0)
                          (i32.const 1050168))
                        (i32.store offset=1050176
                          (i32.const 0)
                          (i32.const 1050168))
                        (i32.store offset=1050188
                          (i32.const 0)
                          (i32.const 1050176))
                        (i32.store offset=1050196
                          (i32.const 0)
                          (i32.const 1050184))
                        (i32.store offset=1050184
                          (i32.const 0)
                          (i32.const 1050176))
                        (i32.store offset=1050204
                          (i32.const 0)
                          (i32.const 1050192))
                        (i32.store offset=1050192
                          (i32.const 0)
                          (i32.const 1050184))
                        (i32.store offset=1050212
                          (i32.const 0)
                          (i32.const 1050200))
                        (i32.store offset=1050200
                          (i32.const 0)
                          (i32.const 1050192))
                        (i32.store offset=1050220
                          (i32.const 0)
                          (i32.const 1050208))
                        (i32.store offset=1050208
                          (i32.const 0)
                          (i32.const 1050200))
                        (i32.store offset=1050228
                          (i32.const 0)
                          (i32.const 1050216))
                        (i32.store offset=1050216
                          (i32.const 0)
                          (i32.const 1050208))
                        (i32.store offset=1050236
                          (i32.const 0)
                          (i32.const 1050224))
                        (i32.store offset=1050224
                          (i32.const 0)
                          (i32.const 1050216))
                        (i32.store offset=1050244
                          (i32.const 0)
                          (i32.const 1050232))
                        (i32.store offset=1050232
                          (i32.const 0)
                          (i32.const 1050224))
                        (i32.store offset=1050252
                          (i32.const 0)
                          (i32.const 1050240))
                        (i32.store offset=1050240
                          (i32.const 0)
                          (i32.const 1050232))
                        (i32.store offset=1050260
                          (i32.const 0)
                          (i32.const 1050248))
                        (i32.store offset=1050248
                          (i32.const 0)
                          (i32.const 1050240))
                        (i32.store offset=1050268
                          (i32.const 0)
                          (i32.const 1050256))
                        (i32.store offset=1050256
                          (i32.const 0)
                          (i32.const 1050248))
                        (i32.store offset=1050276
                          (i32.const 0)
                          (i32.const 1050264))
                        (i32.store offset=1050264
                          (i32.const 0)
                          (i32.const 1050256))
                        (i32.store offset=1050284
                          (i32.const 0)
                          (i32.const 1050272))
                        (i32.store offset=1050272
                          (i32.const 0)
                          (i32.const 1050264))
                        (i32.store offset=1050292
                          (i32.const 0)
                          (i32.const 1050280))
                        (i32.store offset=1050280
                          (i32.const 0)
                          (i32.const 1050272))
                        (i32.store offset=1050300
                          (i32.const 0)
                          (i32.const 1050288))
                        (i32.store offset=1050288
                          (i32.const 0)
                          (i32.const 1050280))
                        (i32.store offset=1050308
                          (i32.const 0)
                          (i32.const 1050296))
                        (i32.store offset=1050296
                          (i32.const 0)
                          (i32.const 1050288))
                        (i32.store offset=1050332
                          (i32.const 0)
                          (local.get $l1))
                        (i32.store offset=1050304
                          (i32.const 0)
                          (i32.const 1050296))
                        (i32.store offset=1050324
                          (i32.const 0)
                          (local.tee $p0
                            (i32.add
                              (local.get $l8)
                              (i32.const -40))))
                        (i32.store offset=4
                          (local.get $l1)
                          (i32.or
                            (local.get $p0)
                            (i32.const 1)))
                        (i32.store offset=4
                          (i32.add
                            (local.get $l1)
                            (local.get $p0))
                          (i32.const 40))
                        (i32.store offset=1050344
                          (i32.const 0)
                          (i32.const 2097152))
                        (br $B52))
                      (br_if $B59
                        (i32.ge_u
                          (local.get $l3)
                          (local.get $l1)))
                      (br_if $B59
                        (i32.gt_u
                          (local.get $l6)
                          (local.get $l3)))
                      (br_if $B56
                        (i32.eqz
                          (i32.load offset=12
                            (local.get $p0)))))
                    (i32.store offset=1050348
                      (i32.const 0)
                      (select
                        (local.tee $p0
                          (i32.load offset=1050348
                            (i32.const 0)))
                        (local.get $l1)
                        (i32.lt_u
                          (local.get $p0)
                          (local.get $l1))))
                    (local.set $l6
                      (i32.add
                        (local.get $l1)
                        (local.get $l8)))
                    (local.set $p0
                      (i32.const 1050032))
                    (block $B65
                      (block $B66
                        (block $B67
                          (loop $L68
                            (br_if $B67
                              (i32.eq
                                (local.tee $l7
                                  (i32.load
                                    (local.get $p0)))
                                (local.get $l6)))
                            (br_if $L68
                              (local.tee $p0
                                (i32.load offset=8
                                  (local.get $p0))))
                            (br $B66)))
                        (br_if $B65
                          (i32.eqz
                            (i32.load offset=12
                              (local.get $p0)))))
                      (local.set $p0
                        (i32.const 1050032))
                      (block $B69
                        (loop $L70
                          (block $B71
                            (br_if $B71
                              (i32.gt_u
                                (local.tee $l6
                                  (i32.load
                                    (local.get $p0)))
                                (local.get $l3)))
                            (br_if $B69
                              (i32.lt_u
                                (local.get $l3)
                                (local.tee $l6
                                  (i32.add
                                    (local.get $l6)
                                    (i32.load offset=4
                                      (local.get $p0)))))))
                          (local.set $p0
                            (i32.load offset=8
                              (local.get $p0)))
                          (br $L70)))
                      (i32.store offset=1050332
                        (i32.const 0)
                        (local.get $l1))
                      (i32.store offset=1050324
                        (i32.const 0)
                        (local.tee $p0
                          (i32.add
                            (local.get $l8)
                            (i32.const -40))))
                      (i32.store offset=4
                        (local.get $l1)
                        (i32.or
                          (local.get $p0)
                          (i32.const 1)))
                      (i32.store offset=4
                        (i32.add
                          (local.get $l1)
                          (local.get $p0))
                        (i32.const 40))
                      (i32.store offset=1050344
                        (i32.const 0)
                        (i32.const 2097152))
                      (i32.store offset=4
                        (local.tee $l7
                          (select
                            (local.get $l3)
                            (local.tee $p0
                              (i32.add
                                (i32.and
                                  (i32.add
                                    (local.get $l6)
                                    (i32.const -32))
                                  (i32.const -8))
                                (i32.const -8)))
                            (i32.lt_u
                              (local.get $p0)
                              (i32.add
                                (local.get $l3)
                                (i32.const 16)))))
                        (i32.const 27))
                      (local.set $l9
                        (i64.load offset=1050032 align=4
                          (i32.const 0)))
                      (i64.store align=4
                        (i32.add
                          (local.get $l7)
                          (i32.const 16))
                        (i64.load offset=1050040 align=4
                          (i32.const 0)))
                      (i64.store offset=8 align=4
                        (local.get $l7)
                        (local.get $l9))
                      (i32.store offset=1050036
                        (i32.const 0)
                        (local.get $l8))
                      (i32.store offset=1050032
                        (i32.const 0)
                        (local.get $l1))
                      (i32.store offset=1050040
                        (i32.const 0)
                        (i32.add
                          (local.get $l7)
                          (i32.const 8)))
                      (i32.store offset=1050044
                        (i32.const 0)
                        (i32.const 0))
                      (local.set $p0
                        (i32.add
                          (local.get $l7)
                          (i32.const 28)))
                      (loop $L72
                        (i32.store
                          (local.get $p0)
                          (i32.const 7))
                        (br_if $L72
                          (i32.lt_u
                            (local.tee $p0
                              (i32.add
                                (local.get $p0)
                                (i32.const 4)))
                            (local.get $l6))))
                      (br_if $B52
                        (i32.eq
                          (local.get $l7)
                          (local.get $l3)))
                      (i32.store offset=4
                        (local.get $l7)
                        (i32.and
                          (i32.load offset=4
                            (local.get $l7))
                          (i32.const -2)))
                      (i32.store offset=4
                        (local.get $l3)
                        (i32.or
                          (local.tee $p0
                            (i32.sub
                              (local.get $l7)
                              (local.get $l3)))
                          (i32.const 1)))
                      (i32.store
                        (local.get $l7)
                        (local.get $p0))
                      (block $B73
                        (br_if $B73
                          (i32.lt_u
                            (local.get $p0)
                            (i32.const 256)))
                        (call $f43
                          (local.get $l3)
                          (local.get $p0))
                        (br $B52))
                      (local.set $l6
                        (i32.add
                          (i32.and
                            (local.get $p0)
                            (i32.const 248))
                          (i32.const 1050048)))
                      (block $B74
                        (block $B75
                          (br_if $B75
                            (i32.and
                              (local.tee $l1
                                (i32.load offset=1050312
                                  (i32.const 0)))
                              (local.tee $p0
                                (i32.shl
                                  (i32.const 1)
                                  (i32.shr_u
                                    (local.get $p0)
                                    (i32.const 3))))))
                          (i32.store offset=1050312
                            (i32.const 0)
                            (i32.or
                              (local.get $l1)
                              (local.get $p0)))
                          (local.set $p0
                            (local.get $l6))
                          (br $B74))
                        (local.set $p0
                          (i32.load offset=8
                            (local.get $l6))))
                      (i32.store offset=8
                        (local.get $l6)
                        (local.get $l3))
                      (i32.store offset=12
                        (local.get $p0)
                        (local.get $l3))
                      (i32.store offset=12
                        (local.get $l3)
                        (local.get $l6))
                      (i32.store offset=8
                        (local.get $l3)
                        (local.get $p0))
                      (br $B52))
                    (i32.store
                      (local.get $p0)
                      (local.get $l1))
                    (i32.store offset=4
                      (local.get $p0)
                      (i32.add
                        (i32.load offset=4
                          (local.get $p0))
                        (local.get $l8)))
                    (i32.store offset=4
                      (local.get $l1)
                      (i32.or
                        (local.get $l2)
                        (i32.const 3)))
                    (local.set $l3
                      (i32.sub
                        (local.tee $l6
                          (i32.add
                            (i32.and
                              (i32.add
                                (local.get $l7)
                                (i32.const 15))
                              (i32.const -8))
                            (i32.const -8)))
                        (local.tee $p0
                          (i32.add
                            (local.get $l1)
                            (local.get $l2)))))
                    (br_if $B55
                      (i32.eq
                        (local.get $l6)
                        (i32.load offset=1050332
                          (i32.const 0))))
                    (br_if $B54
                      (i32.eq
                        (local.get $l6)
                        (i32.load offset=1050328
                          (i32.const 0))))
                    (block $B76
                      (br_if $B76
                        (i32.ne
                          (i32.and
                            (local.tee $l2
                              (i32.load offset=4
                                (local.get $l6)))
                            (i32.const 3))
                          (i32.const 1)))
                      (call $f29
                        (local.get $l6)
                        (local.tee $l2
                          (i32.and
                            (local.get $l2)
                            (i32.const -8))))
                      (local.set $l3
                        (i32.add
                          (local.get $l2)
                          (local.get $l3)))
                      (local.set $l2
                        (i32.load offset=4
                          (local.tee $l6
                            (i32.add
                              (local.get $l6)
                              (local.get $l2))))))
                    (i32.store offset=4
                      (local.get $l6)
                      (i32.and
                        (local.get $l2)
                        (i32.const -2)))
                    (i32.store offset=4
                      (local.get $p0)
                      (i32.or
                        (local.get $l3)
                        (i32.const 1)))
                    (i32.store
                      (i32.add
                        (local.get $p0)
                        (local.get $l3))
                      (local.get $l3))
                    (block $B77
                      (br_if $B77
                        (i32.lt_u
                          (local.get $l3)
                          (i32.const 256)))
                      (call $f43
                        (local.get $p0)
                        (local.get $l3))
                      (br $B53))
                    (local.set $l2
                      (i32.add
                        (i32.and
                          (local.get $l3)
                          (i32.const 248))
                        (i32.const 1050048)))
                    (block $B78
                      (block $B79
                        (br_if $B79
                          (i32.and
                            (local.tee $l6
                              (i32.load offset=1050312
                                (i32.const 0)))
                            (local.tee $l3
                              (i32.shl
                                (i32.const 1)
                                (i32.shr_u
                                  (local.get $l3)
                                  (i32.const 3))))))
                        (i32.store offset=1050312
                          (i32.const 0)
                          (i32.or
                            (local.get $l6)
                            (local.get $l3)))
                        (local.set $l3
                          (local.get $l2))
                        (br $B78))
                      (local.set $l3
                        (i32.load offset=8
                          (local.get $l2))))
                    (i32.store offset=8
                      (local.get $l2)
                      (local.get $p0))
                    (i32.store offset=12
                      (local.get $l3)
                      (local.get $p0))
                    (i32.store offset=12
                      (local.get $p0)
                      (local.get $l2))
                    (i32.store offset=8
                      (local.get $p0)
                      (local.get $l3))
                    (br $B53))
                  (i32.store offset=1050324
                    (i32.const 0)
                    (local.tee $l3
                      (i32.sub
                        (local.get $p0)
                        (local.get $l2))))
                  (i32.store offset=1050332
                    (i32.const 0)
                    (local.tee $l6
                      (i32.add
                        (local.tee $p0
                          (i32.load offset=1050332
                            (i32.const 0)))
                        (local.get $l2))))
                  (i32.store offset=4
                    (local.get $l6)
                    (i32.or
                      (local.get $l3)
                      (i32.const 1)))
                  (i32.store offset=4
                    (local.get $p0)
                    (i32.or
                      (local.get $l2)
                      (i32.const 3)))
                  (local.set $p0
                    (i32.add
                      (local.get $p0)
                      (i32.const 8)))
                  (br $B51))
                (local.set $l3
                  (i32.load offset=1050328
                    (i32.const 0)))
                (block $B80
                  (block $B81
                    (br_if $B81
                      (i32.gt_u
                        (local.tee $l6
                          (i32.sub
                            (local.get $p0)
                            (local.get $l2)))
                        (i32.const 15)))
                    (i32.store offset=1050328
                      (i32.const 0)
                      (i32.const 0))
                    (i32.store offset=1050320
                      (i32.const 0)
                      (i32.const 0))
                    (i32.store offset=4
                      (local.get $l3)
                      (i32.or
                        (local.get $p0)
                        (i32.const 3)))
                    (i32.store offset=4
                      (local.tee $p0
                        (i32.add
                          (local.get $l3)
                          (local.get $p0)))
                      (i32.or
                        (i32.load offset=4
                          (local.get $p0))
                        (i32.const 1)))
                    (br $B80))
                  (i32.store offset=1050320
                    (i32.const 0)
                    (local.get $l6))
                  (i32.store offset=1050328
                    (i32.const 0)
                    (local.tee $l1
                      (i32.add
                        (local.get $l3)
                        (local.get $l2))))
                  (i32.store offset=4
                    (local.get $l1)
                    (i32.or
                      (local.get $l6)
                      (i32.const 1)))
                  (i32.store
                    (i32.add
                      (local.get $l3)
                      (local.get $p0))
                    (local.get $l6))
                  (i32.store offset=4
                    (local.get $l3)
                    (i32.or
                      (local.get $l2)
                      (i32.const 3))))
                (return
                  (i32.add
                    (local.get $l3)
                    (i32.const 8))))
              (i32.store offset=4
                (local.get $p0)
                (i32.add
                  (local.get $l7)
                  (local.get $l8)))
              (i32.store offset=1050332
                (i32.const 0)
                (local.tee $l6
                  (i32.add
                    (local.tee $l3
                      (i32.and
                        (i32.add
                          (local.tee $p0
                            (i32.load offset=1050332
                              (i32.const 0)))
                          (i32.const 15))
                        (i32.const -8)))
                    (i32.const -8))))
              (i32.store offset=1050324
                (i32.const 0)
                (local.tee $l1
                  (i32.add
                    (i32.add
                      (i32.sub
                        (local.get $p0)
                        (local.get $l3))
                      (local.tee $l3
                        (i32.add
                          (i32.load offset=1050324
                            (i32.const 0))
                          (local.get $l8))))
                    (i32.const 8))))
              (i32.store offset=4
                (local.get $l6)
                (i32.or
                  (local.get $l1)
                  (i32.const 1)))
              (i32.store offset=4
                (i32.add
                  (local.get $p0)
                  (local.get $l3))
                (i32.const 40))
              (i32.store offset=1050344
                (i32.const 0)
                (i32.const 2097152))
              (br $B52))
            (i32.store offset=1050332
              (i32.const 0)
              (local.get $p0))
            (i32.store offset=1050324
              (i32.const 0)
              (local.tee $l3
                (i32.add
                  (i32.load offset=1050324
                    (i32.const 0))
                  (local.get $l3))))
            (i32.store offset=4
              (local.get $p0)
              (i32.or
                (local.get $l3)
                (i32.const 1)))
            (br $B53))
          (i32.store offset=1050328
            (i32.const 0)
            (local.get $p0))
          (i32.store offset=1050320
            (i32.const 0)
            (local.tee $l3
              (i32.add
                (i32.load offset=1050320
                  (i32.const 0))
                (local.get $l3))))
          (i32.store offset=4
            (local.get $p0)
            (i32.or
              (local.get $l3)
              (i32.const 1)))
          (i32.store
            (i32.add
              (local.get $p0)
              (local.get $l3))
            (local.get $l3)))
        (return
          (i32.add
            (local.get $l1)
            (i32.const 8))))
      (local.set $p0
        (i32.const 0))
      (br_if $B51
        (i32.le_u
          (local.tee $l3
            (i32.load offset=1050324
              (i32.const 0)))
          (local.get $l2)))
      (i32.store offset=1050324
        (i32.const 0)
        (local.tee $l3
          (i32.sub
            (local.get $l3)
            (local.get $l2))))
      (i32.store offset=1050332
        (i32.const 0)
        (local.tee $l6
          (i32.add
            (local.tee $p0
              (i32.load offset=1050332
                (i32.const 0)))
            (local.get $l2))))
      (i32.store offset=4
        (local.get $l6)
        (i32.or
          (local.get $l3)
          (i32.const 1)))
      (i32.store offset=4
        (local.get $p0)
        (i32.or
          (local.get $l2)
          (i32.const 3)))
      (return
        (i32.add
          (local.get $p0)
          (i32.const 8))))
    (local.get $p0))
  (func $f20 (type $t4) (param $p0 i32) (param $p1 i32) (param $p2 i32)
    (local $l3 i32)
    (global.set $g0
      (local.tee $l3
        (i32.sub
          (global.get $g0)
          (i32.const 16))))
    (block $B0
      (block $B1
        (block $B2
          (br_if $B2
            (i32.lt_s
              (local.get $p1)
              (i32.const 0)))
          (block $B3
            (br_if $B3
              (local.get $p1))
            (i64.store offset=4 align=4
              (local.get $p0)
              (i64.const 4294967296))
            (br $B1))
          (block $B4
            (block $B5
              (br_if $B5
                (local.get $p2))
              (call $f16
                (i32.add
                  (local.get $l3)
                  (i32.const 8))
                (local.get $p1))
              (local.set $p2
                (i32.load offset=8
                  (local.get $l3)))
              (br $B4))
            (call $f18
              (local.get $l3)
              (local.get $p1)
              (i32.const 1))
            (local.set $p2
              (i32.load
                (local.get $l3))))
          (block $B6
            (br_if $B6
              (i32.eqz
                (local.get $p2)))
            (i32.store offset=8
              (local.get $p0)
              (local.get $p2))
            (i32.store offset=4
              (local.get $p0)
              (local.get $p1))
            (br $B1))
          (i32.store offset=8
            (local.get $p0)
            (local.get $p1))
          (local.set $p1
            (i32.const 1))
          (i32.store offset=4
            (local.get $p0)
            (i32.const 1))
          (br $B0))
        (i32.store offset=4
          (local.get $p0)
          (i32.const 0))
        (local.set $p1
          (i32.const 1))
        (br $B0))
      (local.set $p1
        (i32.const 0)))
    (i32.store
      (local.get $p0)
      (local.get $p1))
    (global.set $g0
      (i32.add
        (local.get $l3)
        (i32.const 16))))
  (func $f21 (type $t4) (param $p0 i32) (param $p1 i32) (param $p2 i32)
    (local $l3 i32)
    (global.set $g0
      (local.tee $l3
        (i32.sub
          (global.get $g0)
          (i32.const 16))))
    (call $f20
      (i32.add
        (local.get $l3)
        (i32.const 4))
      (local.get $p1)
      (i32.const 0))
    (local.set $p1
      (i32.load offset=8
        (local.get $l3)))
    (block $B0
      (br_if $B0
        (i32.load offset=4
          (local.get $l3)))
      (i32.store offset=4
        (local.get $p0)
        (i32.load offset=12
          (local.get $l3)))
      (i32.store
        (local.get $p0)
        (local.get $p1))
      (global.set $g0
        (i32.add
          (local.get $l3)
          (i32.const 16)))
      (return))
    (call $f17
      (local.get $p1)
      (i32.load offset=12
        (local.get $l3))
      (local.get $p2))
    (unreachable))
  (func $f22 (type $t2) (param $p0 i32) (param $p1 i32)
    (local $l2 i32) (local $l3 i32)
    (block $B0
      (block $B1
        (br_if $B1
          (i32.lt_u
            (local.tee $l3
              (i32.and
                (local.tee $l2
                  (i32.load
                    (i32.add
                      (local.get $p0)
                      (i32.const -4))))
                (i32.const -8)))
            (i32.add
              (select
                (i32.const 4)
                (i32.const 8)
                (local.tee $l2
                  (i32.and
                    (local.get $l2)
                    (i32.const 3))))
              (local.get $p1))))
        (block $B2
          (br_if $B2
            (i32.eqz
              (local.get $l2)))
          (br_if $B0
            (i32.gt_u
              (local.get $l3)
              (i32.add
                (local.get $p1)
                (i32.const 39)))))
        (call $f27
          (local.get $p0))
        (return))
      (call $f28
        (i32.const 1049765)
        (i32.const 1049812))
      (unreachable))
    (call $f28
      (i32.const 1049828)
      (i32.const 1049876))
    (unreachable))
  (func $get_flag (export "get_flag") (type $t6) (result i32)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32)
    (global.set $g0
      (local.tee $l0
        (i32.sub
          (global.get $g0)
          (i32.const 64))))
    (call $f21
      (i32.add
        (local.get $l0)
        (i32.const 16))
      (i32.const 64)
      (i32.const 1048868))
    (local.set $l1
      (i32.load offset=16
        (local.get $l0)))
    (local.set $l2
      (call $f44
        (i32.load offset=20
          (local.get $l0))
        (i32.const 1048889)
        (i32.const 64)))
    (block $B0
      (block $B1
        (block $B2
          (br_if $B2
            (i32.eq
              (local.get $l1)
              (i32.const -2147483648)))
          (i32.store offset=36
            (local.get $l0)
            (i32.const 64))
          (i32.store offset=32
            (local.get $l0)
            (local.get $l2))
          (i32.store offset=28
            (local.get $l0)
            (local.get $l1))
          (call $f14
            (i32.add
              (local.get $l0)
              (i32.const 8))
            (i32.add
              (local.get $l0)
              (i32.const 28)))
          (local.set $l3
            (i32.const 0))
          (local.set $l1
            (i32.load offset=12
              (local.get $l0)))
          (local.set $l4
            (i32.load offset=8
              (local.get $l0)))
          (br $B1))
        (i32.store offset=60
          (local.get $l0)
          (i32.const 0))
        (i64.store offset=52 align=4
          (local.get $l0)
          (i64.const 4294967296))
        (local.set $l3
          (i32.const 10))
        (block $B3
          (block $B4
            (br_if $B4
              (i32.ge_u
                (local.tee $l1
                  (i32.sub
                    (i32.xor
                      (local.get $l2)
                      (local.tee $l1
                        (i32.shr_s
                          (local.get $l2)
                          (i32.const 31))))
                    (local.get $l1)))
                (i32.const 1000)))
            (local.set $l5
              (local.get $l1))
            (br $B3))
          (local.set $l3
            (i32.const 10))
          (loop $L5
            (i32.store8
              (i32.add
                (local.tee $l4
                  (i32.add
                    (i32.add
                      (local.get $l0)
                      (i32.const 40))
                    (local.get $l3)))
                (i32.const -3))
              (i32.load8_u
                (i32.add
                  (local.tee $l8
                    (i32.shl
                      (local.tee $l7
                        (i32.div_u
                          (i32.and
                            (local.tee $l6
                              (i32.add
                                (i32.mul
                                  (local.tee $l5
                                    (i32.div_u
                                      (local.get $l1)
                                      (i32.const 10000)))
                                  (i32.const 55536))
                                (local.get $l1)))
                            (i32.const 65535))
                          (i32.const 100)))
                      (i32.const 1)))
                  (i32.const 1049341))))
            (i32.store8
              (i32.add
                (local.get $l4)
                (i32.const -4))
              (i32.load8_u
                (i32.add
                  (local.get $l8)
                  (i32.const 1049340))))
            (i32.store8
              (i32.add
                (local.get $l4)
                (i32.const -1))
              (i32.load8_u
                (i32.add
                  (local.tee $l6
                    (i32.shl
                      (i32.and
                        (i32.add
                          (i32.mul
                            (local.get $l7)
                            (i32.const -100))
                          (local.get $l6))
                        (i32.const 65535))
                      (i32.const 1)))
                  (i32.const 1049341))))
            (i32.store8
              (i32.add
                (local.get $l4)
                (i32.const -2))
              (i32.load8_u
                (i32.add
                  (local.get $l6)
                  (i32.const 1049340))))
            (local.set $l3
              (i32.add
                (local.get $l3)
                (i32.const -4)))
            (local.set $l4
              (i32.gt_u
                (local.get $l1)
                (i32.const 9999999)))
            (local.set $l1
              (local.get $l5))
            (br_if $L5
              (local.get $l4))))
        (block $B6
          (block $B7
            (br_if $B7
              (i32.gt_u
                (local.get $l5)
                (i32.const 9)))
            (local.set $l1
              (local.get $l5))
            (br $B6))
          (i32.store8
            (i32.add
              (i32.add
                (i32.add
                  (local.get $l0)
                  (i32.const 40))
                (local.get $l3))
              (i32.const -1))
            (i32.load8_u
              (i32.add
                (local.tee $l4
                  (i32.shl
                    (i32.and
                      (i32.add
                        (i32.mul
                          (local.tee $l1
                            (i32.div_u
                              (i32.and
                                (local.get $l5)
                                (i32.const 65535))
                              (i32.const 100)))
                          (i32.const -100))
                        (local.get $l5))
                      (i32.const 65535))
                    (i32.const 1)))
                (i32.const 1049341))))
          (i32.store8
            (i32.add
              (i32.add
                (local.get $l0)
                (i32.const 40))
              (local.tee $l3
                (i32.add
                  (local.get $l3)
                  (i32.const -2))))
            (i32.load8_u
              (i32.add
                (local.get $l4)
                (i32.const 1049340)))))
        (block $B8
          (block $B9
            (br_if $B9
              (i32.eqz
                (local.get $l2)))
            (br_if $B8
              (i32.eqz
                (local.get $l1))))
          (i32.store8
            (i32.add
              (i32.add
                (local.get $l0)
                (i32.const 40))
              (local.tee $l3
                (i32.add
                  (local.get $l3)
                  (i32.const -1))))
            (i32.load8_u
              (i32.add
                (i32.and
                  (i32.shl
                    (local.get $l1)
                    (i32.const 1))
                  (i32.const 30))
                (i32.const 1049341)))))
        (br_if $B0
          (call $f24
            (i32.add
              (local.get $l0)
              (i32.const 52))
            (i32.const 1048576)
            (select
              (i32.const 1114112)
              (i32.const 45)
              (i32.gt_s
                (local.get $l2)
                (i32.const -1)))
            (i32.const 0)))
        (br_if $B0
          (call $f13
            (i32.add
              (local.get $l0)
              (i32.const 52))
            (i32.add
              (i32.add
                (local.get $l0)
                (i32.const 40))
              (local.get $l3))
            (i32.sub
              (i32.const 10)
              (local.get $l3))))
        (i32.store
          (i32.add
            (i32.add
              (local.get $l0)
              (i32.const 40))
            (i32.const 8))
          (i32.load
            (i32.add
              (i32.add
                (local.get $l0)
                (i32.const 52))
              (i32.const 8))))
        (i64.store offset=40
          (local.get $l0)
          (i64.load offset=52 align=4
            (local.get $l0)))
        (call $f14
          (local.get $l0)
          (i32.add
            (local.get $l0)
            (i32.const 40)))
        (local.set $l1
          (i32.load offset=4
            (local.get $l0)))
        (local.set $l4
          (i32.load
            (local.get $l0)))
        (local.set $l3
          (i32.const 1)))
      (call $typst_env.wasm_minimal_protocol_send_result_to_host
        (local.get $l4)
        (local.get $l1))
      (call $f9
        (local.get $l4)
        (local.get $l1))
      (global.set $g0
        (i32.add
          (local.get $l0)
          (i32.const 64)))
      (return
        (local.get $l3)))
    (call $f25
      (i32.add
        (local.get $l0)
        (i32.const 40)))
    (unreachable))
  (func $f24 (type $t7) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32) (result i32)
    (block $B0
      (br_if $B0
        (i32.eq
          (local.get $p2)
          (i32.const 1114112)))
      (br_if $B0
        (i32.eqz
          (call_indirect $T0 (type $t1)
            (local.get $p0)
            (local.get $p2)
            (i32.load offset=16
              (local.get $p1)))))
      (return
        (i32.const 1)))
    (block $B1
      (br_if $B1
        (local.get $p3))
      (return
        (i32.const 0)))
    (call_indirect $T0 (type $t0)
      (local.get $p0)
      (local.get $p3)
      (i32.const 0)
      (i32.load offset=12
        (local.get $p1))))
  (func $f25 (type $t3) (param $p0 i32)
    (local $l1 i32)
    (global.set $g0
      (local.tee $l1
        (i32.sub
          (global.get $g0)
          (i32.const 64))))
    (i32.store offset=12
      (local.get $l1)
      (i32.const 55))
    (i32.store offset=8
      (local.get $l1)
      (i32.const 1048616))
    (i32.store offset=20
      (local.get $l1)
      (i32.const 1048600))
    (i32.store offset=16
      (local.get $l1)
      (local.get $p0))
    (i32.store offset=28
      (local.get $l1)
      (i32.const 2))
    (i32.store offset=24
      (local.get $l1)
      (i32.const 1049324))
    (i64.store offset=36 align=4
      (local.get $l1)
      (i64.const 2))
    (i64.store offset=56
      (local.get $l1)
      (i64.or
        (i64.shl
          (i64.extend_i32_u
            (i32.const 1))
          (i64.const 32))
        (i64.extend_i32_u
          (i32.add
            (local.get $l1)
            (i32.const 16)))))
    (i64.store offset=48
      (local.get $l1)
      (i64.or
        (i64.shl
          (i64.extend_i32_u
            (i32.const 2))
          (i64.const 32))
        (i64.extend_i32_u
          (i32.add
            (local.get $l1)
            (i32.const 8)))))
    (i32.store offset=32
      (local.get $l1)
      (i32.add
        (local.get $l1)
        (i32.const 48)))
    (call $f33
      (i32.add
        (local.get $l1)
        (i32.const 24))
      (i32.const 1048672))
    (unreachable))
  (func $check (export "check") (type $t5) (param $p0 i32) (result i32)
    (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32)
    (global.set $g0
      (local.tee $l1
        (i32.sub
          (global.get $g0)
          (i32.const 64))))
    (call $f20
      (i32.add
        (local.get $l1)
        (i32.const 52))
      (local.get $p0)
      (i32.const 1))
    (local.set $l2
      (i32.load offset=56
        (local.get $l1)))
    (block $B0
      (block $B1
        (br_if $B1
          (i32.eq
            (i32.load offset=52
              (local.get $l1))
            (i32.const 1)))
        (call $typst_env.wasm_minimal_protocol_write_args_to_buffer
          (local.tee $l3
            (i32.load offset=60
              (local.get $l1))))
        (call $f21
          (i32.add
            (local.get $l1)
            (i32.const 32))
          (local.get $p0)
          (i32.const 1048776))
        (local.set $l4
          (i32.const 0))
        (i32.store offset=60
          (local.get $l1)
          (i32.const 0))
        (i64.store offset=52 align=4
          (local.get $l1)
          (i64.load offset=32
            (local.get $l1)))
        (call $f3
          (i32.add
            (local.get $l1)
            (i32.const 52))
          (local.get $p0))
        (local.set $l5
          (i32.load offset=60
            (local.get $l1)))
        (local.set $l6
          (i32.load offset=56
            (local.get $l1)))
        (block $B2
          (br_if $B2
            (i32.eqz
              (local.get $p0)))
          (local.set $l7
            (local.get $l3))
          (loop $L3
            (i32.store8
              (i32.add
                (local.get $l6)
                (local.get $l5))
              (i32.load8_u
                (i32.add
                  (i32.load8_u
                    (local.get $l7))
                  (i32.const 1049018))))
            (local.set $l7
              (i32.add
                (local.get $l7)
                (i32.const 1)))
            (local.set $l5
              (i32.add
                (local.get $l5)
                (i32.const 1)))
            (br_if $L3
              (local.tee $p0
                (i32.add
                  (local.get $p0)
                  (i32.const -1))))))
        (block $B4
          (br_if $B4
            (i32.ne
              (local.get $l5)
              (i32.const 55)))
          (call $f21
            (i32.add
              (local.get $l1)
              (i32.const 24))
            (i32.const 55)
            (i32.const 1048868))
          (local.set $l5
            (i32.load offset=24
              (local.get $l1)))
          (local.set $p0
            (call $f45
              (local.tee $l7
                (call $f44
                  (i32.load offset=28
                    (local.get $l1))
                  (i32.const 1048963)
                  (i32.const 55)))
              (local.get $l6)
              (i32.const 55)))
          (call $f7
            (local.get $l5)
            (local.get $l7))
          (local.set $l4
            (i32.eqz
              (local.get $p0))))
        (call $f18
          (i32.add
            (local.get $l1)
            (i32.const 16))
          (i32.const 1)
          (i32.const 0))
        (br_if $B0
          (i32.eqz
            (local.tee $l5
              (i32.load offset=16
                (local.get $l1)))))
        (i32.store8
          (local.get $l5)
          (local.get $l4))
        (call $f7
          (i32.load offset=52
            (local.get $l1))
          (i32.load offset=56
            (local.get $l1)))
        (i32.store offset=48
          (local.get $l1)
          (i32.const 1))
        (i32.store offset=44
          (local.get $l1)
          (local.get $l5))
        (i32.store offset=40
          (local.get $l1)
          (i32.const 1))
        (call $f14
          (i32.add
            (local.get $l1)
            (i32.const 8))
          (i32.add
            (local.get $l1)
            (i32.const 40)))
        (call $typst_env.wasm_minimal_protocol_send_result_to_host
          (local.tee $l5
            (i32.load offset=8
              (local.get $l1)))
          (local.tee $l7
            (i32.load offset=12
              (local.get $l1))))
        (call $f9
          (local.get $l5)
          (local.get $l7))
        (call $f7
          (local.get $l2)
          (local.get $l3))
        (global.set $g0
          (i32.add
            (local.get $l1)
            (i32.const 64)))
        (return
          (i32.const 0)))
      (call $f17
        (local.get $l2)
        (i32.load offset=60
          (local.get $l1))
        (i32.const 1049276)))
    (unreachable))
  (func $f27 (type $t3) (param $p0 i32)
    (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32)
    (local.set $l3
      (i32.add
        (local.tee $l1
          (i32.add
            (local.get $p0)
            (i32.const -8)))
        (local.tee $p0
          (i32.and
            (local.tee $l2
              (i32.load
                (i32.add
                  (local.get $p0)
                  (i32.const -4))))
            (i32.const -8)))))
    (block $B0
      (block $B1
        (br_if $B1
          (i32.and
            (local.get $l2)
            (i32.const 1)))
        (br_if $B0
          (i32.eqz
            (i32.and
              (local.get $l2)
              (i32.const 2))))
        (local.set $p0
          (i32.add
            (local.tee $l2
              (i32.load
                (local.get $l1)))
            (local.get $p0)))
        (block $B2
          (br_if $B2
            (i32.ne
              (local.tee $l1
                (i32.sub
                  (local.get $l1)
                  (local.get $l2)))
              (i32.load offset=1050328
                (i32.const 0))))
          (br_if $B1
            (i32.ne
              (i32.and
                (i32.load offset=4
                  (local.get $l3))
                (i32.const 3))
              (i32.const 3)))
          (i32.store offset=1050320
            (i32.const 0)
            (local.get $p0))
          (i32.store offset=4
            (local.get $l3)
            (i32.and
              (i32.load offset=4
                (local.get $l3))
              (i32.const -2)))
          (i32.store offset=4
            (local.get $l1)
            (i32.or
              (local.get $p0)
              (i32.const 1)))
          (i32.store
            (local.get $l3)
            (local.get $p0))
          (return))
        (call $f29
          (local.get $l1)
          (local.get $l2)))
      (block $B3
        (block $B4
          (block $B5
            (block $B6
              (block $B7
                (block $B8
                  (br_if $B8
                    (i32.and
                      (local.tee $l2
                        (i32.load offset=4
                          (local.get $l3)))
                      (i32.const 2)))
                  (br_if $B6
                    (i32.eq
                      (local.get $l3)
                      (i32.load offset=1050332
                        (i32.const 0))))
                  (br_if $B5
                    (i32.eq
                      (local.get $l3)
                      (i32.load offset=1050328
                        (i32.const 0))))
                  (call $f29
                    (local.get $l3)
                    (local.tee $l2
                      (i32.and
                        (local.get $l2)
                        (i32.const -8))))
                  (i32.store offset=4
                    (local.get $l1)
                    (i32.or
                      (local.tee $p0
                        (i32.add
                          (local.get $l2)
                          (local.get $p0)))
                      (i32.const 1)))
                  (i32.store
                    (i32.add
                      (local.get $l1)
                      (local.get $p0))
                    (local.get $p0))
                  (br_if $B7
                    (i32.ne
                      (local.get $l1)
                      (i32.load offset=1050328
                        (i32.const 0))))
                  (i32.store offset=1050320
                    (i32.const 0)
                    (local.get $p0))
                  (return))
                (i32.store offset=4
                  (local.get $l3)
                  (i32.and
                    (local.get $l2)
                    (i32.const -2)))
                (i32.store offset=4
                  (local.get $l1)
                  (i32.or
                    (local.get $p0)
                    (i32.const 1)))
                (i32.store
                  (i32.add
                    (local.get $l1)
                    (local.get $p0))
                  (local.get $p0)))
              (br_if $B4
                (i32.lt_u
                  (local.get $p0)
                  (i32.const 256)))
              (call $f43
                (local.get $l1)
                (local.get $p0))
              (local.set $l1
                (i32.const 0))
              (i32.store offset=1050352
                (i32.const 0)
                (local.tee $p0
                  (i32.add
                    (i32.load offset=1050352
                      (i32.const 0))
                    (i32.const -1))))
              (br_if $B0
                (local.get $p0))
              (block $B9
                (br_if $B9
                  (i32.eqz
                    (local.tee $p0
                      (i32.load offset=1050040
                        (i32.const 0)))))
                (local.set $l1
                  (i32.const 0))
                (loop $L10
                  (local.set $l1
                    (i32.add
                      (local.get $l1)
                      (i32.const 1)))
                  (br_if $L10
                    (local.tee $p0
                      (i32.load offset=8
                        (local.get $p0))))))
              (i32.store offset=1050352
                (i32.const 0)
                (select
                  (local.get $l1)
                  (i32.const 4095)
                  (i32.gt_u
                    (local.get $l1)
                    (i32.const 4095))))
              (return))
            (i32.store offset=1050332
              (i32.const 0)
              (local.get $l1))
            (i32.store offset=1050324
              (i32.const 0)
              (local.tee $p0
                (i32.add
                  (i32.load offset=1050324
                    (i32.const 0))
                  (local.get $p0))))
            (i32.store offset=4
              (local.get $l1)
              (i32.or
                (local.get $p0)
                (i32.const 1)))
            (block $B11
              (br_if $B11
                (i32.ne
                  (local.get $l1)
                  (i32.load offset=1050328
                    (i32.const 0))))
              (i32.store offset=1050320
                (i32.const 0)
                (i32.const 0))
              (i32.store offset=1050328
                (i32.const 0)
                (i32.const 0)))
            (br_if $B0
              (i32.le_u
                (local.get $p0)
                (local.tee $l4
                  (i32.load offset=1050344
                    (i32.const 0)))))
            (br_if $B0
              (i32.eqz
                (local.tee $p0
                  (i32.load offset=1050332
                    (i32.const 0)))))
            (local.set $l2
              (i32.const 0))
            (br_if $B3
              (i32.lt_u
                (local.tee $l5
                  (i32.load offset=1050324
                    (i32.const 0)))
                (i32.const 41)))
            (local.set $l1
              (i32.const 1050032))
            (loop $L12
              (block $B13
                (br_if $B13
                  (i32.gt_u
                    (local.tee $l3
                      (i32.load
                        (local.get $l1)))
                    (local.get $p0)))
                (br_if $B3
                  (i32.lt_u
                    (local.get $p0)
                    (i32.add
                      (local.get $l3)
                      (i32.load offset=4
                        (local.get $l1))))))
              (local.set $l1
                (i32.load offset=8
                  (local.get $l1)))
              (br $L12)))
          (i32.store offset=1050328
            (i32.const 0)
            (local.get $l1))
          (i32.store offset=1050320
            (i32.const 0)
            (local.tee $p0
              (i32.add
                (i32.load offset=1050320
                  (i32.const 0))
                (local.get $p0))))
          (i32.store offset=4
            (local.get $l1)
            (i32.or
              (local.get $p0)
              (i32.const 1)))
          (i32.store
            (i32.add
              (local.get $l1)
              (local.get $p0))
            (local.get $p0))
          (return))
        (local.set $l3
          (i32.add
            (i32.and
              (local.get $p0)
              (i32.const 248))
            (i32.const 1050048)))
        (block $B14
          (block $B15
            (br_if $B15
              (i32.and
                (local.tee $l2
                  (i32.load offset=1050312
                    (i32.const 0)))
                (local.tee $p0
                  (i32.shl
                    (i32.const 1)
                    (i32.shr_u
                      (local.get $p0)
                      (i32.const 3))))))
            (i32.store offset=1050312
              (i32.const 0)
              (i32.or
                (local.get $l2)
                (local.get $p0)))
            (local.set $p0
              (local.get $l3))
            (br $B14))
          (local.set $p0
            (i32.load offset=8
              (local.get $l3))))
        (i32.store offset=8
          (local.get $l3)
          (local.get $l1))
        (i32.store offset=12
          (local.get $p0)
          (local.get $l1))
        (i32.store offset=12
          (local.get $l1)
          (local.get $l3))
        (i32.store offset=8
          (local.get $l1)
          (local.get $p0))
        (return))
      (block $B16
        (br_if $B16
          (i32.eqz
            (local.tee $l1
              (i32.load offset=1050040
                (i32.const 0)))))
        (local.set $l2
          (i32.const 0))
        (loop $L17
          (local.set $l2
            (i32.add
              (local.get $l2)
              (i32.const 1)))
          (br_if $L17
            (local.tee $l1
              (i32.load offset=8
                (local.get $l1))))))
      (i32.store offset=1050352
        (i32.const 0)
        (select
          (local.get $l2)
          (i32.const 4095)
          (i32.gt_u
            (local.get $l2)
            (i32.const 4095))))
      (br_if $B0
        (i32.le_u
          (local.get $l5)
          (local.get $l4)))
      (i32.store offset=1050344
        (i32.const 0)
        (i32.const -1))))
  (func $f28 (type $t2) (param $p0 i32) (param $p1 i32)
    (local $l2 i32)
    (global.set $g0
      (local.tee $l2
        (i32.sub
          (global.get $g0)
          (i32.const 32))))
    (i32.store offset=16
      (local.get $l2)
      (i32.const 0))
    (i32.store offset=4
      (local.get $l2)
      (i32.const 1))
    (i64.store offset=8 align=4
      (local.get $l2)
      (i64.const 4))
    (i32.store offset=28
      (local.get $l2)
      (i32.const 46))
    (i32.store offset=24
      (local.get $l2)
      (local.get $p0))
    (i32.store
      (local.get $l2)
      (i32.add
        (local.get $l2)
        (i32.const 24)))
    (call $f33
      (local.get $l2)
      (local.get $p1))
    (unreachable))
  (func $f29 (type $t2) (param $p0 i32) (param $p1 i32)
    (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32)
    (local.set $l2
      (i32.load offset=12
        (local.get $p0)))
    (block $B0
      (block $B1
        (block $B2
          (br_if $B2
            (i32.lt_u
              (local.get $p1)
              (i32.const 256)))
          (local.set $l3
            (i32.load offset=24
              (local.get $p0)))
          (block $B3
            (block $B4
              (block $B5
                (br_if $B5
                  (i32.ne
                    (local.get $l2)
                    (local.get $p0)))
                (br_if $B4
                  (local.tee $p1
                    (i32.load
                      (i32.add
                        (local.get $p0)
                        (select
                          (i32.const 20)
                          (i32.const 16)
                          (local.tee $l2
                            (i32.load offset=20
                              (local.get $p0))))))))
                (local.set $l2
                  (i32.const 0))
                (br $B3))
              (i32.store offset=12
                (local.tee $p1
                  (i32.load offset=8
                    (local.get $p0)))
                (local.get $l2))
              (i32.store offset=8
                (local.get $l2)
                (local.get $p1))
              (br $B3))
            (local.set $l4
              (select
                (i32.add
                  (local.get $p0)
                  (i32.const 20))
                (i32.add
                  (local.get $p0)
                  (i32.const 16))
                (local.get $l2)))
            (loop $L6
              (local.set $l5
                (local.get $l4))
              (local.set $l4
                (select
                  (i32.add
                    (local.tee $l2
                      (local.get $p1))
                    (i32.const 20))
                  (i32.add
                    (local.get $l2)
                    (i32.const 16))
                  (local.tee $p1
                    (i32.load offset=20
                      (local.get $l2)))))
              (br_if $L6
                (local.tee $p1
                  (i32.load
                    (i32.add
                      (local.get $l2)
                      (select
                        (i32.const 20)
                        (i32.const 16)
                        (local.get $p1)))))))
            (i32.store
              (local.get $l5)
              (i32.const 0)))
          (br_if $B0
            (i32.eqz
              (local.get $l3)))
          (block $B7
            (br_if $B7
              (i32.eq
                (i32.load
                  (local.tee $p1
                    (i32.add
                      (i32.shl
                        (i32.load offset=28
                          (local.get $p0))
                        (i32.const 2))
                      (i32.const 1049904))))
                (local.get $p0)))
            (i32.store
              (i32.add
                (local.get $l3)
                (select
                  (i32.const 16)
                  (i32.const 20)
                  (i32.eq
                    (i32.load offset=16
                      (local.get $l3))
                    (local.get $p0))))
              (local.get $l2))
            (br_if $B0
              (i32.eqz
                (local.get $l2)))
            (br $B1))
          (i32.store
            (local.get $p1)
            (local.get $l2))
          (br_if $B1
            (local.get $l2))
          (i32.store offset=1050316
            (i32.const 0)
            (i32.and
              (i32.load offset=1050316
                (i32.const 0))
              (i32.rotl
                (i32.const -2)
                (i32.load offset=28
                  (local.get $p0)))))
          (br $B0))
        (block $B8
          (br_if $B8
            (i32.eq
              (local.get $l2)
              (local.tee $l4
                (i32.load offset=8
                  (local.get $p0)))))
          (i32.store offset=12
            (local.get $l4)
            (local.get $l2))
          (i32.store offset=8
            (local.get $l2)
            (local.get $l4))
          (return))
        (i32.store offset=1050312
          (i32.const 0)
          (i32.and
            (i32.load offset=1050312
              (i32.const 0))
            (i32.rotl
              (i32.const -2)
              (i32.shr_u
                (local.get $p1)
                (i32.const 3)))))
        (return))
      (i32.store offset=24
        (local.get $l2)
        (local.get $l3))
      (block $B9
        (br_if $B9
          (i32.eqz
            (local.tee $p1
              (i32.load offset=16
                (local.get $p0)))))
        (i32.store offset=16
          (local.get $l2)
          (local.get $p1))
        (i32.store offset=24
          (local.get $p1)
          (local.get $l2)))
      (br_if $B0
        (i32.eqz
          (local.tee $p1
            (i32.load offset=20
              (local.get $p0)))))
      (i32.store offset=20
        (local.get $l2)
        (local.get $p1))
      (i32.store offset=24
        (local.get $p1)
        (local.get $l2))
      (return)))
  (func $f30 (type $t2) (param $p0 i32) (param $p1 i32)
    (local $l2 i32) (local $l3 i32)
    (local.set $l2
      (i32.add
        (local.get $p0)
        (local.get $p1)))
    (block $B0
      (block $B1
        (br_if $B1
          (i32.and
            (local.tee $l3
              (i32.load offset=4
                (local.get $p0)))
            (i32.const 1)))
        (br_if $B0
          (i32.eqz
            (i32.and
              (local.get $l3)
              (i32.const 2))))
        (local.set $p1
          (i32.add
            (local.tee $l3
              (i32.load
                (local.get $p0)))
            (local.get $p1)))
        (block $B2
          (br_if $B2
            (i32.ne
              (local.tee $p0
                (i32.sub
                  (local.get $p0)
                  (local.get $l3)))
              (i32.load offset=1050328
                (i32.const 0))))
          (br_if $B1
            (i32.ne
              (i32.and
                (i32.load offset=4
                  (local.get $l2))
                (i32.const 3))
              (i32.const 3)))
          (i32.store offset=1050320
            (i32.const 0)
            (local.get $p1))
          (i32.store offset=4
            (local.get $l2)
            (i32.and
              (i32.load offset=4
                (local.get $l2))
              (i32.const -2)))
          (i32.store offset=4
            (local.get $p0)
            (i32.or
              (local.get $p1)
              (i32.const 1)))
          (i32.store
            (local.get $l2)
            (local.get $p1))
          (br $B0))
        (call $f29
          (local.get $p0)
          (local.get $l3)))
      (block $B3
        (block $B4
          (block $B5
            (block $B6
              (br_if $B6
                (i32.and
                  (local.tee $l3
                    (i32.load offset=4
                      (local.get $l2)))
                  (i32.const 2)))
              (br_if $B4
                (i32.eq
                  (local.get $l2)
                  (i32.load offset=1050332
                    (i32.const 0))))
              (br_if $B3
                (i32.eq
                  (local.get $l2)
                  (i32.load offset=1050328
                    (i32.const 0))))
              (call $f29
                (local.get $l2)
                (local.tee $l3
                  (i32.and
                    (local.get $l3)
                    (i32.const -8))))
              (i32.store offset=4
                (local.get $p0)
                (i32.or
                  (local.tee $p1
                    (i32.add
                      (local.get $l3)
                      (local.get $p1)))
                  (i32.const 1)))
              (i32.store
                (i32.add
                  (local.get $p0)
                  (local.get $p1))
                (local.get $p1))
              (br_if $B5
                (i32.ne
                  (local.get $p0)
                  (i32.load offset=1050328
                    (i32.const 0))))
              (i32.store offset=1050320
                (i32.const 0)
                (local.get $p1))
              (return))
            (i32.store offset=4
              (local.get $l2)
              (i32.and
                (local.get $l3)
                (i32.const -2)))
            (i32.store offset=4
              (local.get $p0)
              (i32.or
                (local.get $p1)
                (i32.const 1)))
            (i32.store
              (i32.add
                (local.get $p0)
                (local.get $p1))
              (local.get $p1)))
          (block $B7
            (br_if $B7
              (i32.lt_u
                (local.get $p1)
                (i32.const 256)))
            (call $f43
              (local.get $p0)
              (local.get $p1))
            (return))
          (local.set $l2
            (i32.add
              (i32.and
                (local.get $p1)
                (i32.const 248))
              (i32.const 1050048)))
          (block $B8
            (block $B9
              (br_if $B9
                (i32.and
                  (local.tee $l3
                    (i32.load offset=1050312
                      (i32.const 0)))
                  (local.tee $p1
                    (i32.shl
                      (i32.const 1)
                      (i32.shr_u
                        (local.get $p1)
                        (i32.const 3))))))
              (i32.store offset=1050312
                (i32.const 0)
                (i32.or
                  (local.get $l3)
                  (local.get $p1)))
              (local.set $p1
                (local.get $l2))
              (br $B8))
            (local.set $p1
              (i32.load offset=8
                (local.get $l2))))
          (i32.store offset=8
            (local.get $l2)
            (local.get $p0))
          (i32.store offset=12
            (local.get $p1)
            (local.get $p0))
          (i32.store offset=12
            (local.get $p0)
            (local.get $l2))
          (i32.store offset=8
            (local.get $p0)
            (local.get $p1))
          (return))
        (i32.store offset=1050332
          (i32.const 0)
          (local.get $p0))
        (i32.store offset=1050324
          (i32.const 0)
          (local.tee $p1
            (i32.add
              (i32.load offset=1050324
                (i32.const 0))
              (local.get $p1))))
        (i32.store offset=4
          (local.get $p0)
          (i32.or
            (local.get $p1)
            (i32.const 1)))
        (br_if $B0
          (i32.ne
            (local.get $p0)
            (i32.load offset=1050328
              (i32.const 0))))
        (i32.store offset=1050320
          (i32.const 0)
          (i32.const 0))
        (i32.store offset=1050328
          (i32.const 0)
          (i32.const 0))
        (return))
      (i32.store offset=1050328
        (i32.const 0)
        (local.get $p0))
      (i32.store offset=1050320
        (i32.const 0)
        (local.tee $p1
          (i32.add
            (i32.load offset=1050320
              (i32.const 0))
            (local.get $p1))))
      (i32.store offset=4
        (local.get $p0)
        (i32.or
          (local.get $p1)
          (i32.const 1)))
      (i32.store
        (i32.add
          (local.get $p0)
          (local.get $p1))
        (local.get $p1))
      (return)))
  (func $f31 (type $t4) (param $p0 i32) (param $p1 i32) (param $p2 i32)
    (local $l3 i32)
    (block $B0
      (block $B1
        (block $B2
          (br_if $B2
            (i32.eqz
              (i32.load offset=4
                (local.get $p2))))
          (block $B3
            (br_if $B3
              (local.tee $l3
                (i32.load offset=8
                  (local.get $p2))))
            (drop
              (i32.load8_u offset=1049892
                (i32.const 0)))
            (br $B1))
          (local.set $p2
            (call $f15
              (i32.load
                (local.get $p2))
              (local.get $l3)
              (local.get $p1)))
          (br $B0))
        (drop
          (i32.load8_u offset=1049892
            (i32.const 0))))
      (local.set $p2
        (call $f19
          (local.get $p1))))
    (i32.store offset=8
      (local.get $p0)
      (local.get $p1))
    (i32.store offset=4
      (local.get $p0)
      (select
        (local.get $p2)
        (i32.const 1)
        (local.get $p2)))
    (i32.store
      (local.get $p0)
      (i32.eqz
        (local.get $p2))))
  (func $f32 (type $t3) (param $p0 i32)
    (local $l1 i32)
    (global.set $g0
      (local.tee $l1
        (i32.sub
          (global.get $g0)
          (i32.const 32))))
    (i32.store offset=24
      (local.get $l1)
      (i32.const 0))
    (i32.store offset=12
      (local.get $l1)
      (i32.const 1))
    (i32.store offset=8
      (local.get $l1)
      (i32.const 1049312))
    (i64.store offset=16 align=4
      (local.get $l1)
      (i64.const 4))
    (call $f33
      (i32.add
        (local.get $l1)
        (i32.const 8))
      (local.get $p0))
    (unreachable))
  (func $f33 (type $t2) (param $p0 i32) (param $p1 i32)
    (local $l2 i32)
    (global.set $g0
      (local.tee $l2
        (i32.sub
          (global.get $g0)
          (i32.const 16))))
    (i32.store16 offset=12
      (local.get $l2)
      (i32.const 1))
    (i32.store offset=8
      (local.get $l2)
      (local.get $p1))
    (i32.store offset=4
      (local.get $l2)
      (local.get $p0))
    (call $f34
      (i32.add
        (local.get $l2)
        (i32.const 4)))
    (unreachable))
  (func $f34 (type $t3) (param $p0 i32)
    (local $l1 i32) (local $l2 i64)
    (global.set $g0
      (local.tee $l1
        (i32.sub
          (global.get $g0)
          (i32.const 16))))
    (local.set $l2
      (i64.load align=4
        (local.get $p0)))
    (i32.store offset=12
      (local.get $l1)
      (local.get $p0))
    (i64.store offset=4 align=4
      (local.get $l1)
      (local.get $l2))
    (call $f40
      (i32.add
        (local.get $l1)
        (i32.const 4)))
    (unreachable))
  (func $f35 (type $t1) (param $p0 i32) (param $p1 i32) (result i32)
    (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i32) (local $l10 i32) (local $l11 i32) (local $l12 i32) (local $l13 i32)
    (local.set $l2
      (i32.load offset=4
        (local.get $p0)))
    (local.set $l3
      (i32.load
        (local.get $p0)))
    (block $B0
      (block $B1
        (block $B2
          (br_if $B2
            (i32.eqz
              (i32.or
                (local.tee $l4
                  (i32.load
                    (local.get $p1)))
                (local.tee $p0
                  (i32.load offset=8
                    (local.get $p1))))))
          (block $B3
            (br_if $B3
              (i32.eqz
                (i32.and
                  (local.get $p0)
                  (i32.const 1))))
            (local.set $l5
              (i32.add
                (local.get $l3)
                (local.get $l2)))
            (block $B4
              (block $B5
                (br_if $B5
                  (local.tee $l6
                    (i32.load offset=12
                      (local.get $p1))))
                (local.set $l7
                  (i32.const 0))
                (local.set $l8
                  (local.get $l3))
                (br $B4))
              (local.set $l7
                (i32.const 0))
              (local.set $l9
                (i32.const 0))
              (local.set $l8
                (local.get $l3))
              (loop $L6
                (br_if $B3
                  (i32.eq
                    (local.tee $p0
                      (local.get $l8))
                    (local.get $l5)))
                (block $B7
                  (block $B8
                    (br_if $B8
                      (i32.le_s
                        (local.tee $l8
                          (i32.load8_s
                            (local.get $p0)))
                        (i32.const -1)))
                    (local.set $l8
                      (i32.add
                        (local.get $p0)
                        (i32.const 1)))
                    (br $B7))
                  (block $B9
                    (br_if $B9
                      (i32.ge_u
                        (local.get $l8)
                        (i32.const -32)))
                    (local.set $l8
                      (i32.add
                        (local.get $p0)
                        (i32.const 2)))
                    (br $B7))
                  (block $B10
                    (br_if $B10
                      (i32.ge_u
                        (local.get $l8)
                        (i32.const -16)))
                    (local.set $l8
                      (i32.add
                        (local.get $p0)
                        (i32.const 3)))
                    (br $B7))
                  (local.set $l8
                    (i32.add
                      (local.get $p0)
                      (i32.const 4))))
                (local.set $l7
                  (i32.add
                    (i32.sub
                      (local.get $l8)
                      (local.get $p0))
                    (local.get $l7)))
                (br_if $L6
                  (i32.ne
                    (local.get $l6)
                    (local.tee $l9
                      (i32.add
                        (local.get $l9)
                        (i32.const 1)))))))
            (br_if $B3
              (i32.eq
                (local.get $l8)
                (local.get $l5)))
            (block $B11
              (br_if $B11
                (i32.gt_s
                  (local.tee $p0
                    (i32.load8_s
                      (local.get $l8)))
                  (i32.const -1)))
              (drop
                (i32.lt_u
                  (local.get $p0)
                  (i32.const -32))))
            (block $B12
              (block $B13
                (br_if $B13
                  (i32.eqz
                    (local.get $l7)))
                (block $B14
                  (br_if $B14
                    (i32.lt_u
                      (local.get $l7)
                      (local.get $l2)))
                  (br_if $B13
                    (i32.eq
                      (local.get $l7)
                      (local.get $l2)))
                  (local.set $p0
                    (i32.const 0))
                  (br $B12))
                (br_if $B13
                  (i32.ge_s
                    (i32.load8_s
                      (i32.add
                        (local.get $l3)
                        (local.get $l7)))
                    (i32.const -64)))
                (local.set $p0
                  (i32.const 0))
                (br $B12))
              (local.set $p0
                (local.get $l3)))
            (local.set $l2
              (select
                (local.get $l7)
                (local.get $l2)
                (local.get $p0)))
            (local.set $l3
              (select
                (local.get $p0)
                (local.get $l3)
                (local.get $p0))))
          (block $B15
            (br_if $B15
              (local.get $l4))
            (return
              (call_indirect $T0 (type $t0)
                (i32.load offset=28
                  (local.get $p1))
                (local.get $l3)
                (local.get $l2)
                (i32.load offset=12
                  (i32.load offset=32
                    (local.get $p1))))))
          (local.set $l10
            (i32.load offset=4
              (local.get $p1)))
          (block $B16
            (br_if $B16
              (i32.lt_u
                (local.get $l2)
                (i32.const 16)))
            (local.set $l4
              (i32.and
                (local.tee $l11
                  (i32.add
                    (local.get $l2)
                    (local.tee $l9
                      (i32.sub
                        (local.get $l3)
                        (local.tee $l7
                          (i32.and
                            (i32.add
                              (local.get $l3)
                              (i32.const 3))
                            (i32.const -4)))))))
                (i32.const 3)))
            (local.set $l6
              (i32.const 0))
            (local.set $p0
              (i32.const 0))
            (block $B17
              (br_if $B17
                (i32.eq
                  (local.get $l3)
                  (local.get $l7)))
              (local.set $p0
                (i32.const 0))
              (block $B18
                (br_if $B18
                  (i32.gt_u
                    (local.get $l9)
                    (i32.const -4)))
                (local.set $p0
                  (i32.const 0))
                (local.set $l5
                  (i32.const 0))
                (loop $L19
                  (local.set $p0
                    (i32.add
                      (i32.add
                        (i32.add
                          (i32.add
                            (local.get $p0)
                            (i32.gt_s
                              (i32.load8_s
                                (local.tee $l8
                                  (i32.add
                                    (local.get $l3)
                                    (local.get $l5))))
                              (i32.const -65)))
                          (i32.gt_s
                            (i32.load8_s
                              (i32.add
                                (local.get $l8)
                                (i32.const 1)))
                            (i32.const -65)))
                        (i32.gt_s
                          (i32.load8_s
                            (i32.add
                              (local.get $l8)
                              (i32.const 2)))
                          (i32.const -65)))
                      (i32.gt_s
                        (i32.load8_s
                          (i32.add
                            (local.get $l8)
                            (i32.const 3)))
                        (i32.const -65))))
                  (br_if $L19
                    (local.tee $l5
                      (i32.add
                        (local.get $l5)
                        (i32.const 4))))))
              (local.set $l8
                (local.get $l3))
              (loop $L20
                (local.set $p0
                  (i32.add
                    (local.get $p0)
                    (i32.gt_s
                      (i32.load8_s
                        (local.get $l8))
                      (i32.const -65))))
                (local.set $l8
                  (i32.add
                    (local.get $l8)
                    (i32.const 1)))
                (br_if $L20
                  (local.tee $l9
                    (i32.add
                      (local.get $l9)
                      (i32.const 1))))))
            (block $B21
              (br_if $B21
                (i32.eqz
                  (local.get $l4)))
              (local.set $l6
                (i32.gt_s
                  (i32.load8_s
                    (local.tee $l8
                      (i32.add
                        (local.get $l7)
                        (i32.and
                          (local.get $l11)
                          (i32.const -4)))))
                  (i32.const -65)))
              (br_if $B21
                (i32.eq
                  (local.get $l4)
                  (i32.const 1)))
              (local.set $l6
                (i32.add
                  (local.get $l6)
                  (i32.gt_s
                    (i32.load8_s offset=1
                      (local.get $l8))
                    (i32.const -65))))
              (br_if $B21
                (i32.eq
                  (local.get $l4)
                  (i32.const 2)))
              (local.set $l6
                (i32.add
                  (local.get $l6)
                  (i32.gt_s
                    (i32.load8_s offset=2
                      (local.get $l8))
                    (i32.const -65)))))
            (local.set $l5
              (i32.shr_u
                (local.get $l11)
                (i32.const 2)))
            (local.set $l6
              (i32.add
                (local.get $l6)
                (local.get $p0)))
            (loop $L22
              (local.set $l4
                (local.get $l7))
              (br_if $B0
                (i32.eqz
                  (local.get $l5)))
              (local.set $l12
                (i32.and
                  (local.tee $l11
                    (select
                      (local.get $l5)
                      (i32.const 192)
                      (i32.lt_u
                        (local.get $l5)
                        (i32.const 192))))
                  (i32.const 3)))
              (local.set $l13
                (i32.shl
                  (local.get $l11)
                  (i32.const 2)))
              (local.set $l8
                (i32.const 0))
              (block $B23
                (br_if $B23
                  (i32.lt_u
                    (local.get $l5)
                    (i32.const 4)))
                (local.set $l9
                  (i32.add
                    (local.get $l4)
                    (i32.and
                      (local.get $l13)
                      (i32.const 1008))))
                (local.set $l8
                  (i32.const 0))
                (local.set $p0
                  (local.get $l4))
                (loop $L24
                  (local.set $l8
                    (i32.add
                      (i32.and
                        (i32.or
                          (i32.shr_u
                            (i32.xor
                              (local.tee $l7
                                (i32.load offset=12
                                  (local.get $p0)))
                              (i32.const -1))
                            (i32.const 7))
                          (i32.shr_u
                            (local.get $l7)
                            (i32.const 6)))
                        (i32.const 16843009))
                      (i32.add
                        (i32.and
                          (i32.or
                            (i32.shr_u
                              (i32.xor
                                (local.tee $l7
                                  (i32.load offset=8
                                    (local.get $p0)))
                                (i32.const -1))
                              (i32.const 7))
                            (i32.shr_u
                              (local.get $l7)
                              (i32.const 6)))
                          (i32.const 16843009))
                        (i32.add
                          (i32.and
                            (i32.or
                              (i32.shr_u
                                (i32.xor
                                  (local.tee $l7
                                    (i32.load offset=4
                                      (local.get $p0)))
                                  (i32.const -1))
                                (i32.const 7))
                              (i32.shr_u
                                (local.get $l7)
                                (i32.const 6)))
                            (i32.const 16843009))
                          (i32.add
                            (i32.and
                              (i32.or
                                (i32.shr_u
                                  (i32.xor
                                    (local.tee $l7
                                      (i32.load
                                        (local.get $p0)))
                                    (i32.const -1))
                                  (i32.const 7))
                                (i32.shr_u
                                  (local.get $l7)
                                  (i32.const 6)))
                              (i32.const 16843009))
                            (local.get $l8))))))
                  (br_if $L24
                    (i32.ne
                      (local.tee $p0
                        (i32.add
                          (local.get $p0)
                          (i32.const 16)))
                      (local.get $l9)))))
              (local.set $l5
                (i32.sub
                  (local.get $l5)
                  (local.get $l11)))
              (local.set $l7
                (i32.add
                  (local.get $l4)
                  (local.get $l13)))
              (local.set $l6
                (i32.add
                  (i32.shr_u
                    (i32.mul
                      (i32.add
                        (i32.and
                          (i32.shr_u
                            (local.get $l8)
                            (i32.const 8))
                          (i32.const 16711935))
                        (i32.and
                          (local.get $l8)
                          (i32.const 16711935)))
                      (i32.const 65537))
                    (i32.const 16))
                  (local.get $l6)))
              (br_if $L22
                (i32.eqz
                  (local.get $l12))))
            (local.set $p0
              (i32.and
                (i32.or
                  (i32.shr_u
                    (i32.xor
                      (local.tee $p0
                        (i32.load
                          (local.tee $l8
                            (i32.add
                              (local.get $l4)
                              (i32.shl
                                (i32.and
                                  (local.get $l11)
                                  (i32.const 252))
                                (i32.const 2))))))
                      (i32.const -1))
                    (i32.const 7))
                  (i32.shr_u
                    (local.get $p0)
                    (i32.const 6)))
                (i32.const 16843009)))
            (br_if $B1
              (i32.eq
                (local.get $l12)
                (i32.const 1)))
            (local.set $p0
              (i32.add
                (i32.and
                  (i32.or
                    (i32.shr_u
                      (i32.xor
                        (local.tee $l7
                          (i32.load offset=4
                            (local.get $l8)))
                        (i32.const -1))
                      (i32.const 7))
                    (i32.shr_u
                      (local.get $l7)
                      (i32.const 6)))
                  (i32.const 16843009))
                (local.get $p0)))
            (br_if $B1
              (i32.eq
                (local.get $l12)
                (i32.const 2)))
            (local.set $p0
              (i32.add
                (i32.and
                  (i32.or
                    (i32.shr_u
                      (i32.xor
                        (local.tee $l8
                          (i32.load offset=8
                            (local.get $l8)))
                        (i32.const -1))
                      (i32.const 7))
                    (i32.shr_u
                      (local.get $l8)
                      (i32.const 6)))
                  (i32.const 16843009))
                (local.get $p0)))
            (br $B1))
          (block $B25
            (br_if $B25
              (local.get $l2))
            (local.set $l6
              (i32.const 0))
            (br $B0))
          (local.set $l8
            (i32.and
              (local.get $l2)
              (i32.const 3)))
          (block $B26
            (block $B27
              (br_if $B27
                (i32.ge_u
                  (local.get $l2)
                  (i32.const 4)))
              (local.set $l6
                (i32.const 0))
              (local.set $l9
                (i32.const 0))
              (br $B26))
            (local.set $l6
              (i32.const 0))
            (local.set $p0
              (local.get $l3))
            (local.set $l7
              (local.tee $l9
                (i32.and
                  (local.get $l2)
                  (i32.const 12))))
            (loop $L28
              (local.set $l6
                (i32.add
                  (i32.add
                    (i32.add
                      (i32.add
                        (local.get $l6)
                        (i32.gt_s
                          (i32.load8_s
                            (local.get $p0))
                          (i32.const -65)))
                      (i32.gt_s
                        (i32.load8_s
                          (i32.add
                            (local.get $p0)
                            (i32.const 1)))
                        (i32.const -65)))
                    (i32.gt_s
                      (i32.load8_s
                        (i32.add
                          (local.get $p0)
                          (i32.const 2)))
                      (i32.const -65)))
                  (i32.gt_s
                    (i32.load8_s
                      (i32.add
                        (local.get $p0)
                        (i32.const 3)))
                    (i32.const -65))))
              (local.set $p0
                (i32.add
                  (local.get $p0)
                  (i32.const 4)))
              (br_if $L28
                (local.tee $l7
                  (i32.add
                    (local.get $l7)
                    (i32.const -4))))))
          (br_if $B0
            (i32.eqz
              (local.get $l8)))
          (local.set $p0
            (i32.add
              (local.get $l3)
              (local.get $l9)))
          (loop $L29
            (local.set $l6
              (i32.add
                (local.get $l6)
                (i32.gt_s
                  (i32.load8_s
                    (local.get $p0))
                  (i32.const -65))))
            (local.set $p0
              (i32.add
                (local.get $p0)
                (i32.const 1)))
            (br_if $L29
              (local.tee $l8
                (i32.add
                  (local.get $l8)
                  (i32.const -1))))
            (br $B0)))
        (return
          (call_indirect $T0 (type $t0)
            (i32.load offset=28
              (local.get $p1))
            (local.get $l3)
            (local.get $l2)
            (i32.load offset=12
              (i32.load offset=32
                (local.get $p1))))))
      (local.set $l6
        (i32.add
          (i32.shr_u
            (i32.mul
              (i32.add
                (i32.and
                  (i32.shr_u
                    (local.get $p0)
                    (i32.const 8))
                  (i32.const 459007))
                (i32.and
                  (local.get $p0)
                  (i32.const 16711935)))
              (i32.const 65537))
            (i32.const 16))
          (local.get $l6))))
    (block $B30
      (block $B31
        (br_if $B31
          (i32.le_u
            (local.get $l10)
            (local.get $l6)))
        (local.set $l5
          (i32.sub
            (local.get $l10)
            (local.get $l6)))
        (block $B32
          (block $B33
            (block $B34
              (br_table $B32 $B34 $B33 $B32
                (local.tee $p0
                  (select
                    (i32.const 0)
                    (local.tee $p0
                      (i32.load8_u offset=24
                        (local.get $p1)))
                    (i32.eq
                      (local.get $p0)
                      (i32.const 3))))))
            (local.set $p0
              (local.get $l5))
            (local.set $l5
              (i32.const 0))
            (br $B32))
          (local.set $p0
            (i32.shr_u
              (local.get $l5)
              (i32.const 1)))
          (local.set $l5
            (i32.shr_u
              (i32.add
                (local.get $l5)
                (i32.const 1))
              (i32.const 1))))
        (local.set $p0
          (i32.add
            (local.get $p0)
            (i32.const 1)))
        (local.set $l9
          (i32.load offset=16
            (local.get $p1)))
        (local.set $l8
          (i32.load offset=32
            (local.get $p1)))
        (local.set $l7
          (i32.load offset=28
            (local.get $p1)))
        (loop $L35
          (br_if $B30
            (i32.eqz
              (local.tee $p0
                (i32.add
                  (local.get $p0)
                  (i32.const -1)))))
          (br_if $L35
            (i32.eqz
              (call_indirect $T0 (type $t1)
                (local.get $l7)
                (local.get $l9)
                (i32.load offset=16
                  (local.get $l8))))))
        (return
          (i32.const 1)))
      (return
        (call_indirect $T0 (type $t0)
          (i32.load offset=28
            (local.get $p1))
          (local.get $l3)
          (local.get $l2)
          (i32.load offset=12
            (i32.load offset=32
              (local.get $p1))))))
    (block $B36
      (br_if $B36
        (i32.eqz
          (call_indirect $T0 (type $t0)
            (local.get $l7)
            (local.get $l3)
            (local.get $l2)
            (i32.load offset=12
              (local.get $l8)))))
      (return
        (i32.const 1)))
    (local.set $p0
      (i32.const 0))
    (loop $L37
      (block $B38
        (br_if $B38
          (i32.ne
            (local.get $l5)
            (local.get $p0)))
        (return
          (i32.lt_u
            (local.get $l5)
            (local.get $l5))))
      (local.set $p0
        (i32.add
          (local.get $p0)
          (i32.const 1)))
      (br_if $L37
        (i32.eqz
          (call_indirect $T0 (type $t1)
            (local.get $l7)
            (local.get $l9)
            (i32.load offset=16
              (local.get $l8))))))
    (i32.lt_u
      (i32.add
        (local.get $p0)
        (i32.const -1))
      (local.get $l5)))
  (func $f36 (type $t1) (param $p0 i32) (param $p1 i32) (result i32)
    (call_indirect $T0 (type $t1)
      (i32.load
        (local.get $p0))
      (local.get $p1)
      (i32.load offset=12
        (i32.load offset=4
          (local.get $p0)))))
  (func $f37 (type $t2) (param $p0 i32) (param $p1 i32)
    (i32.store
      (local.get $p0)
      (i32.const 0)))
  (func $f38 (type $t8) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32)
    (local $l4 i32) (local $l5 i32)
    (global.set $g0
      (local.tee $l4
        (i32.sub
          (global.get $g0)
          (i32.const 16))))
    (i32.store offset=1049900
      (i32.const 0)
      (i32.add
        (local.tee $l5
          (i32.load offset=1049900
            (i32.const 0)))
        (i32.const 1)))
    (block $B0
      (br_if $B0
        (i32.lt_s
          (local.get $l5)
          (i32.const 0)))
      (block $B1
        (block $B2
          (br_if $B2
            (i32.load8_u offset=1050360
              (i32.const 0)))
          (i32.store offset=1050356
            (i32.const 0)
            (i32.add
              (i32.load offset=1050356
                (i32.const 0))
              (i32.const 1)))
          (br_if $B1
            (i32.gt_s
              (i32.load offset=1049896
                (i32.const 0))
              (i32.const -1)))
          (br $B0))
        (call_indirect $T0 (type $t2)
          (i32.add
            (local.get $l4)
            (i32.const 8))
          (local.get $p0)
          (local.get $p1))
        (unreachable))
      (i32.store8 offset=1050360
        (i32.const 0)
        (i32.const 0))
      (br_if $B0
        (i32.eqz
          (local.get $p2)))
      (call $f39)
      (unreachable))
    (unreachable))
  (func $f39 (type $t9)
    (unreachable))
  (func $f40 (type $t3) (param $p0 i32)
    (call $f41
      (local.get $p0))
    (unreachable))
  (func $f41 (type $t3) (param $p0 i32)
    (local $l1 i32) (local $l2 i32) (local $l3 i32)
    (global.set $g0
      (local.tee $l1
        (i32.sub
          (global.get $g0)
          (i32.const 16))))
    (local.set $l3
      (i32.load offset=12
        (local.tee $l2
          (i32.load
            (local.get $p0)))))
    (block $B0
      (block $B1
        (block $B2
          (block $B3
            (br_table $B3 $B2 $B1
              (i32.load offset=4
                (local.get $l2))))
          (br_if $B1
            (local.get $l3))
          (local.set $l2
            (i32.const 1))
          (local.set $l3
            (i32.const 0))
          (br $B0))
        (br_if $B1
          (local.get $l3))
        (local.set $l3
          (i32.load offset=4
            (local.tee $l2
              (i32.load
                (local.get $l2)))))
        (local.set $l2
          (i32.load
            (local.get $l2)))
        (br $B0))
      (i32.store
        (local.get $l1)
        (i32.const -2147483648))
      (i32.store offset=12
        (local.get $l1)
        (local.get $p0))
      (call $f38
        (local.get $l1)
        (i32.const 3)
        (i32.load8_u offset=8
          (local.tee $p0
            (i32.load offset=8
              (local.get $p0))))
        (i32.load8_u offset=9
          (local.get $p0)))
      (unreachable))
    (i32.store offset=4
      (local.get $l1)
      (local.get $l3))
    (i32.store
      (local.get $l1)
      (local.get $l2))
    (call $f38
      (local.get $l1)
      (i32.const 4)
      (i32.load8_u offset=8
        (local.tee $p0
          (i32.load offset=8
            (local.get $p0))))
      (i32.load8_u offset=9
        (local.get $p0)))
    (unreachable))
  (func $f42 (type $t2) (param $p0 i32) (param $p1 i32)
    (i64.store
      (local.get $p0)
      (i64.load align=4
        (local.get $p1))))
  (func $f43 (type $t2) (param $p0 i32) (param $p1 i32)
    (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32)
    (local.set $l2
      (i32.const 31))
    (block $B0
      (br_if $B0
        (i32.gt_u
          (local.get $p1)
          (i32.const 16777215)))
      (local.set $l2
        (i32.add
          (i32.sub
            (i32.and
              (i32.shr_u
                (local.get $p1)
                (i32.sub
                  (i32.const 6)
                  (local.tee $l2
                    (i32.clz
                      (i32.shr_u
                        (local.get $p1)
                        (i32.const 8))))))
              (i32.const 1))
            (i32.shl
              (local.get $l2)
              (i32.const 1)))
          (i32.const 62))))
    (i64.store offset=16 align=4
      (local.get $p0)
      (i64.const 0))
    (i32.store offset=28
      (local.get $p0)
      (local.get $l2))
    (local.set $l3
      (i32.add
        (i32.shl
          (local.get $l2)
          (i32.const 2))
        (i32.const 1049904)))
    (block $B1
      (br_if $B1
        (i32.and
          (i32.load offset=1050316
            (i32.const 0))
          (local.tee $l4
            (i32.shl
              (i32.const 1)
              (local.get $l2)))))
      (i32.store
        (local.get $l3)
        (local.get $p0))
      (i32.store offset=24
        (local.get $p0)
        (local.get $l3))
      (i32.store offset=12
        (local.get $p0)
        (local.get $p0))
      (i32.store offset=8
        (local.get $p0)
        (local.get $p0))
      (i32.store offset=1050316
        (i32.const 0)
        (i32.or
          (i32.load offset=1050316
            (i32.const 0))
          (local.get $l4)))
      (return))
    (block $B2
      (block $B3
        (block $B4
          (br_if $B4
            (i32.ne
              (i32.and
                (i32.load offset=4
                  (local.tee $l4
                    (i32.load
                      (local.get $l3))))
                (i32.const -8))
              (local.get $p1)))
          (local.set $l2
            (local.get $l4))
          (br $B3))
        (local.set $l3
          (i32.shl
            (local.get $p1)
            (select
              (i32.const 0)
              (i32.sub
                (i32.const 25)
                (i32.shr_u
                  (local.get $l2)
                  (i32.const 1)))
              (i32.eq
                (local.get $l2)
                (i32.const 31)))))
        (loop $L5
          (br_if $B2
            (i32.eqz
              (local.tee $l2
                (i32.load
                  (local.tee $l5
                    (i32.add
                      (i32.add
                        (local.get $l4)
                        (i32.and
                          (i32.shr_u
                            (local.get $l3)
                            (i32.const 29))
                          (i32.const 4)))
                      (i32.const 16)))))))
          (local.set $l3
            (i32.shl
              (local.get $l3)
              (i32.const 1)))
          (local.set $l4
            (local.get $l2))
          (br_if $L5
            (i32.ne
              (i32.and
                (i32.load offset=4
                  (local.get $l2))
                (i32.const -8))
              (local.get $p1)))))
      (i32.store offset=12
        (local.tee $l3
          (i32.load offset=8
            (local.get $l2)))
        (local.get $p0))
      (i32.store offset=8
        (local.get $l2)
        (local.get $p0))
      (i32.store offset=24
        (local.get $p0)
        (i32.const 0))
      (i32.store offset=12
        (local.get $p0)
        (local.get $l2))
      (i32.store offset=8
        (local.get $p0)
        (local.get $l3))
      (return))
    (i32.store
      (local.get $l5)
      (local.get $p0))
    (i32.store offset=24
      (local.get $p0)
      (local.get $l4))
    (i32.store offset=12
      (local.get $p0)
      (local.get $p0))
    (i32.store offset=8
      (local.get $p0)
      (local.get $p0)))
  (func $f44 (type $t0) (param $p0 i32) (param $p1 i32) (param $p2 i32) (result i32)
    (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i32) (local $l10 i32)
    (block $B0
      (block $B1
        (br_if $B1
          (i32.ge_u
            (local.get $p2)
            (i32.const 16)))
        (local.set $l3
          (local.get $p0))
        (br $B0))
      (block $B2
        (br_if $B2
          (i32.le_u
            (local.tee $l5
              (i32.add
                (local.get $p0)
                (local.tee $l4
                  (i32.and
                    (i32.sub
                      (i32.const 0)
                      (local.get $p0))
                    (i32.const 3)))))
            (local.get $p0)))
        (local.set $l6
          (i32.add
            (local.get $l4)
            (i32.const -1)))
        (local.set $l3
          (local.get $p0))
        (local.set $l7
          (local.get $p1))
        (block $B3
          (br_if $B3
            (i32.eqz
              (local.get $l4)))
          (local.set $l8
            (local.get $l4))
          (local.set $l3
            (local.get $p0))
          (local.set $l7
            (local.get $p1))
          (loop $L4
            (i32.store8
              (local.get $l3)
              (i32.load8_u
                (local.get $l7)))
            (local.set $l7
              (i32.add
                (local.get $l7)
                (i32.const 1)))
            (local.set $l3
              (i32.add
                (local.get $l3)
                (i32.const 1)))
            (br_if $L4
              (local.tee $l8
                (i32.add
                  (local.get $l8)
                  (i32.const -1))))))
        (br_if $B2
          (i32.lt_u
            (local.get $l6)
            (i32.const 7)))
        (loop $L5
          (i32.store8
            (local.get $l3)
            (i32.load8_u
              (local.get $l7)))
          (i32.store8
            (i32.add
              (local.get $l3)
              (i32.const 1))
            (i32.load8_u
              (i32.add
                (local.get $l7)
                (i32.const 1))))
          (i32.store8
            (i32.add
              (local.get $l3)
              (i32.const 2))
            (i32.load8_u
              (i32.add
                (local.get $l7)
                (i32.const 2))))
          (i32.store8
            (i32.add
              (local.get $l3)
              (i32.const 3))
            (i32.load8_u
              (i32.add
                (local.get $l7)
                (i32.const 3))))
          (i32.store8
            (i32.add
              (local.get $l3)
              (i32.const 4))
            (i32.load8_u
              (i32.add
                (local.get $l7)
                (i32.const 4))))
          (i32.store8
            (i32.add
              (local.get $l3)
              (i32.const 5))
            (i32.load8_u
              (i32.add
                (local.get $l7)
                (i32.const 5))))
          (i32.store8
            (i32.add
              (local.get $l3)
              (i32.const 6))
            (i32.load8_u
              (i32.add
                (local.get $l7)
                (i32.const 6))))
          (i32.store8
            (i32.add
              (local.get $l3)
              (i32.const 7))
            (i32.load8_u
              (i32.add
                (local.get $l7)
                (i32.const 7))))
          (local.set $l7
            (i32.add
              (local.get $l7)
              (i32.const 8)))
          (br_if $L5
            (i32.ne
              (local.tee $l3
                (i32.add
                  (local.get $l3)
                  (i32.const 8)))
              (local.get $l5)))))
      (local.set $l3
        (i32.add
          (local.get $l5)
          (local.tee $l6
            (i32.and
              (local.tee $l8
                (i32.sub
                  (local.get $p2)
                  (local.get $l4)))
              (i32.const -4)))))
      (block $B6
        (block $B7
          (br_if $B7
            (i32.and
              (local.tee $l7
                (i32.add
                  (local.get $p1)
                  (local.get $l4)))
              (i32.const 3)))
          (br_if $B6
            (i32.ge_u
              (local.get $l5)
              (local.get $l3)))
          (local.set $p1
            (local.get $l7))
          (loop $L8
            (i32.store
              (local.get $l5)
              (i32.load
                (local.get $p1)))
            (local.set $p1
              (i32.add
                (local.get $p1)
                (i32.const 4)))
            (br_if $L8
              (i32.lt_u
                (local.tee $l5
                  (i32.add
                    (local.get $l5)
                    (i32.const 4)))
                (local.get $l3)))
            (br $B6)))
        (br_if $B6
          (i32.ge_u
            (local.get $l5)
            (local.get $l3)))
        (local.set $l4
          (i32.and
            (local.tee $p2
              (i32.shl
                (local.get $l7)
                (i32.const 3)))
            (i32.const 24)))
        (local.set $p1
          (i32.add
            (local.tee $l9
              (i32.and
                (local.get $l7)
                (i32.const -4)))
            (i32.const 4)))
        (local.set $l10
          (i32.and
            (i32.sub
              (i32.const 0)
              (local.get $p2))
            (i32.const 24)))
        (local.set $p2
          (i32.load
            (local.get $l9)))
        (loop $L9
          (i32.store
            (local.get $l5)
            (i32.or
              (i32.shr_u
                (local.get $p2)
                (local.get $l4))
              (i32.shl
                (local.tee $p2
                  (i32.load
                    (local.get $p1)))
                (local.get $l10))))
          (local.set $p1
            (i32.add
              (local.get $p1)
              (i32.const 4)))
          (br_if $L9
            (i32.lt_u
              (local.tee $l5
                (i32.add
                  (local.get $l5)
                  (i32.const 4)))
              (local.get $l3)))))
      (local.set $p2
        (i32.and
          (local.get $l8)
          (i32.const 3)))
      (local.set $p1
        (i32.add
          (local.get $l7)
          (local.get $l6))))
    (block $B10
      (br_if $B10
        (i32.ge_u
          (local.get $l3)
          (local.tee $l5
            (i32.add
              (local.get $l3)
              (local.get $p2)))))
      (local.set $l8
        (i32.add
          (local.get $p2)
          (i32.const -1)))
      (block $B11
        (br_if $B11
          (i32.eqz
            (local.tee $l7
              (i32.and
                (local.get $p2)
                (i32.const 7)))))
        (loop $L12
          (i32.store8
            (local.get $l3)
            (i32.load8_u
              (local.get $p1)))
          (local.set $p1
            (i32.add
              (local.get $p1)
              (i32.const 1)))
          (local.set $l3
            (i32.add
              (local.get $l3)
              (i32.const 1)))
          (br_if $L12
            (local.tee $l7
              (i32.add
                (local.get $l7)
                (i32.const -1))))))
      (br_if $B10
        (i32.lt_u
          (local.get $l8)
          (i32.const 7)))
      (loop $L13
        (i32.store8
          (local.get $l3)
          (i32.load8_u
            (local.get $p1)))
        (i32.store8
          (i32.add
            (local.get $l3)
            (i32.const 1))
          (i32.load8_u
            (i32.add
              (local.get $p1)
              (i32.const 1))))
        (i32.store8
          (i32.add
            (local.get $l3)
            (i32.const 2))
          (i32.load8_u
            (i32.add
              (local.get $p1)
              (i32.const 2))))
        (i32.store8
          (i32.add
            (local.get $l3)
            (i32.const 3))
          (i32.load8_u
            (i32.add
              (local.get $p1)
              (i32.const 3))))
        (i32.store8
          (i32.add
            (local.get $l3)
            (i32.const 4))
          (i32.load8_u
            (i32.add
              (local.get $p1)
              (i32.const 4))))
        (i32.store8
          (i32.add
            (local.get $l3)
            (i32.const 5))
          (i32.load8_u
            (i32.add
              (local.get $p1)
              (i32.const 5))))
        (i32.store8
          (i32.add
            (local.get $l3)
            (i32.const 6))
          (i32.load8_u
            (i32.add
              (local.get $p1)
              (i32.const 6))))
        (i32.store8
          (i32.add
            (local.get $l3)
            (i32.const 7))
          (i32.load8_u
            (i32.add
              (local.get $p1)
              (i32.const 7))))
        (local.set $p1
          (i32.add
            (local.get $p1)
            (i32.const 8)))
        (br_if $L13
          (i32.ne
            (local.tee $l3
              (i32.add
                (local.get $l3)
                (i32.const 8)))
            (local.get $l5)))))
    (local.get $p0))
  (func $f45 (type $t0) (param $p0 i32) (param $p1 i32) (param $p2 i32) (result i32)
    (local $l3 i32) (local $l4 i32) (local $l5 i32)
    (local.set $l3
      (i32.const 0))
    (block $B0
      (br_if $B0
        (i32.eqz
          (local.get $p2)))
      (block $B1
        (loop $L2
          (br_if $B1
            (i32.ne
              (local.tee $l4
                (i32.load8_u
                  (local.get $p0)))
              (local.tee $l5
                (i32.load8_u
                  (local.get $p1)))))
          (local.set $p0
            (i32.add
              (local.get $p0)
              (i32.const 1)))
          (local.set $p1
            (i32.add
              (local.get $p1)
              (i32.const 1)))
          (br_if $B0
            (i32.eqz
              (local.tee $p2
                (i32.add
                  (local.get $p2)
                  (i32.const -1)))))
          (br $L2)))
      (local.set $l3
        (i32.sub
          (local.get $l4)
          (local.get $l5))))
    (local.get $l3))
  (func $f46 (type $t0) (param $p0 i32) (param $p1 i32) (param $p2 i32) (result i32)
    (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32)
    (block $B0
      (block $B1
        (br_if $B1
          (i32.ge_u
            (local.get $p2)
            (i32.const 16)))
        (local.set $l3
          (local.get $p0))
        (br $B0))
      (block $B2
        (br_if $B2
          (i32.le_u
            (local.tee $l5
              (i32.add
                (local.get $p0)
                (local.tee $l4
                  (i32.and
                    (i32.sub
                      (i32.const 0)
                      (local.get $p0))
                    (i32.const 3)))))
            (local.get $p0)))
        (local.set $l6
          (i32.add
            (local.get $l4)
            (i32.const -1)))
        (local.set $l3
          (local.get $p0))
        (block $B3
          (br_if $B3
            (i32.eqz
              (local.get $l4)))
          (local.set $l7
            (local.get $l4))
          (local.set $l3
            (local.get $p0))
          (loop $L4
            (i32.store8
              (local.get $l3)
              (local.get $p1))
            (local.set $l3
              (i32.add
                (local.get $l3)
                (i32.const 1)))
            (br_if $L4
              (local.tee $l7
                (i32.add
                  (local.get $l7)
                  (i32.const -1))))))
        (br_if $B2
          (i32.lt_u
            (local.get $l6)
            (i32.const 7)))
        (loop $L5
          (i32.store8
            (local.get $l3)
            (local.get $p1))
          (i32.store8
            (i32.add
              (local.get $l3)
              (i32.const 7))
            (local.get $p1))
          (i32.store8
            (i32.add
              (local.get $l3)
              (i32.const 6))
            (local.get $p1))
          (i32.store8
            (i32.add
              (local.get $l3)
              (i32.const 5))
            (local.get $p1))
          (i32.store8
            (i32.add
              (local.get $l3)
              (i32.const 4))
            (local.get $p1))
          (i32.store8
            (i32.add
              (local.get $l3)
              (i32.const 3))
            (local.get $p1))
          (i32.store8
            (i32.add
              (local.get $l3)
              (i32.const 2))
            (local.get $p1))
          (i32.store8
            (i32.add
              (local.get $l3)
              (i32.const 1))
            (local.get $p1))
          (br_if $L5
            (i32.ne
              (local.tee $l3
                (i32.add
                  (local.get $l3)
                  (i32.const 8)))
              (local.get $l5)))))
      (block $B6
        (br_if $B6
          (i32.ge_u
            (local.get $l5)
            (local.tee $l3
              (i32.add
                (local.get $l5)
                (i32.and
                  (local.tee $p2
                    (i32.sub
                      (local.get $p2)
                      (local.get $l4)))
                  (i32.const -4))))))
        (local.set $l7
          (i32.mul
            (i32.and
              (local.get $p1)
              (i32.const 255))
            (i32.const 16843009)))
        (loop $L7
          (i32.store
            (local.get $l5)
            (local.get $l7))
          (br_if $L7
            (i32.lt_u
              (local.tee $l5
                (i32.add
                  (local.get $l5)
                  (i32.const 4)))
              (local.get $l3)))))
      (local.set $p2
        (i32.and
          (local.get $p2)
          (i32.const 3))))
    (block $B8
      (br_if $B8
        (i32.ge_u
          (local.get $l3)
          (local.tee $l7
            (i32.add
              (local.get $l3)
              (local.get $p2)))))
      (local.set $l4
        (i32.add
          (local.get $p2)
          (i32.const -1)))
      (block $B9
        (br_if $B9
          (i32.eqz
            (local.tee $l5
              (i32.and
                (local.get $p2)
                (i32.const 7)))))
        (loop $L10
          (i32.store8
            (local.get $l3)
            (local.get $p1))
          (local.set $l3
            (i32.add
              (local.get $l3)
              (i32.const 1)))
          (br_if $L10
            (local.tee $l5
              (i32.add
                (local.get $l5)
                (i32.const -1))))))
      (br_if $B8
        (i32.lt_u
          (local.get $l4)
          (i32.const 7)))
      (loop $L11
        (i32.store8
          (local.get $l3)
          (local.get $p1))
        (i32.store8
          (i32.add
            (local.get $l3)
            (i32.const 7))
          (local.get $p1))
        (i32.store8
          (i32.add
            (local.get $l3)
            (i32.const 6))
          (local.get $p1))
        (i32.store8
          (i32.add
            (local.get $l3)
            (i32.const 5))
          (local.get $p1))
        (i32.store8
          (i32.add
            (local.get $l3)
            (i32.const 4))
          (local.get $p1))
        (i32.store8
          (i32.add
            (local.get $l3)
            (i32.const 3))
          (local.get $p1))
        (i32.store8
          (i32.add
            (local.get $l3)
            (i32.const 2))
          (local.get $p1))
        (i32.store8
          (i32.add
            (local.get $l3)
            (i32.const 1))
          (local.get $p1))
        (br_if $L11
          (i32.ne
            (local.tee $l3
              (i32.add
                (local.get $l3)
                (i32.const 8)))
            (local.get $l7)))))
    (local.get $p0))
  (table $T0 10 10 funcref)
  (memory $memory (export "memory") 17)
  (global $g0 (mut i32) (i32.const 1048576))
  (global $__data_end (export "__data_end") i32 (i32.const 1050361))
  (global $__heap_base (export "__heap_base") i32 (i32.const 1050368))
  (elem $e0 (i32.const 1) func $f36 $f35 $f37 $f42 $f6 $f13 $f11 $f4 $f10)
  (data $d0 (i32.const 1048576) "\05\00\00\00\0c\00\00\00\04\00\00\00\06\00\00\00\07\00\00\00\08\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\09\00\00\00a Display implementation returned an error unexpectedly\00\c4\03\10\00K\00\00\00\df\0a\00\00\0e\00\00\00/rustc/05f9846f893b09a1be1fc8560e33fc3c815cfecb/library/core/src/iter/traits/iterator.rsp\00\10\00X\00\00\00\b3\07\00\00\09\00\00\00/rustc/05f9846f893b09a1be1fc8560e33fc3c815cfecb/library/alloc/src/slice.rs\00\00\d8\00\10\00J\00\00\00\a2\00\00\00\19\00\00\00ErroraHR0cHM6Ly93d3cueW91dHViZS5jb20vd2F0Y2hcP3ZcPXh2RlpqbzVQZ0cwCg==src/lib.rs\09,ga\18\d6H\a3g\02Xa\18\d6\af\b7X\f3gf\a3XBRna\15X\f1\e2\f3Xn\c3\e3HfXK\f2X(AX\1da\12fX\09,gT\18\d6\5c\f8i:\e5\85\b2\82\1fN\cc\83\c0$\ba\bb\db\99\e8|D\b6\b9\e6Ol!\fc\1a\05.\0d\d4\ed\f9x\ec\9d]\df\e9\04\dc\0a\9cX\bc@\e2g\a6aRH#\d0+\d3\abk`\b1r>\de\ad\1d6\b7T\09z\a3\b4\89\94B~\f1Y\e3bd\f2f{\eat\a2\c3\f4;\06\b0\fbm0G\eb\07\d6\af\8d\95qK-\93o(\18\aa\02\e7,\12n\c1s\f3\15A\1eh\a8\1b\0f\ca\0c1P<\ff\c9\cd\9eC&J\ef\01\8eM\e49\bf\d2\9awW8\a5\c7v\fa*\8b\11\d7\96\ac\d82\81\98u\d5F'\d9\bec\90\87\80\dd\a0^V\b5\9f\a9\00\c2\0b\ae\03\cb\88\92\b3p\22\fe\c5Q?%\0e\08\fd\10I\8fU}7 \ceZS\16\day\f7\91)\7f\195\f0\8a\e04\f6\97\c8\a7\86[\e1\a1E/j\14\d1\bd3\a4_\c6\13\17\84\c4\9b\f5\8c\cf\ee=\1c\b8eL\00\00y\01\10\00\0a\00\00\00\1f\00\00\00\01\00\00\00capacity overflow\00\00\00\cc\02\10\00\11\00\00\00: \00\00\01\00\00\00\00\00\00\00\e8\02\10\00\02\00\00\0000010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899/rustc/05f9846f893b09a1be1fc8560e33fc3c815cfecb/library/alloc/src/string.rs\00\c4\03\10\00K\00\00\00\8d\05\00\00\1b\00\00\00/rustc/05f9846f893b09a1be1fc8560e33fc3c815cfecb/library/alloc/src/raw_vec.rs \04\10\00L\00\00\00*\02\00\00\11\00\00\00/rust/deps/dlmalloc-0.2.7/src/dlmalloc.rsassertion failed: psize >= size + min_overhead\00|\04\10\00)\00\00\00\a8\04\00\00\09\00\00\00assertion failed: psize <= size + max_overhead\00\00|\04\10\00)\00\00\00\ae\04\00\00\0d\00\00\00"))
