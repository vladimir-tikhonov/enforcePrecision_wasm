(module
  (memory 256 256)
  (export "memory" memory)
  (type $FUNCSIG$dii (func (param i32 i32) (result f64)))
  (type $FUNCSIG$dd (func (param f64) (result f64)))
  (import $Math_pow "global.Math" "pow" (param i32 i32) (result f64))
  (import $Math_round "global.Math" "round" (param f64) (result f64))
  (export "enforcePrecisionWasm" $enforcePrecisionWasm)
  (func $enforcePrecisionWasm (param $0 f64) (param $1 i32) (result f64)
    (f64.store
      (i32.const 8)
      (call_import $Math_pow
        (i32.const 10)
        (get_local $1)
      )
    )
    (f64.div
      (call_import $Math_round
        (f64.mul
          (get_local $0)
          (f64.load
            (i32.const 8)
          )
        )
      )
      (f64.load
        (i32.const 8)
      )
    )
  )
)
