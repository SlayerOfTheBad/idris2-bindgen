import Data.Bits

namespace ChildVisitResult
  public export
  Prim_ChildVisitResult : Type
  Prim_ChildVisitResult = Bits32

  public export
  data ChildVisitResult
    = Break
    | Continue
    | Recurse
    | Invalid
    | Other Bits32

  Cast ChildVisitResult Prim_ChildVisitResult where
    cast Break = 1
    cast Continue = 2
    cast Recurse = 3
    cast Invalid = 0
    cast (Other m) = m

  Cast Prim_ChildVisitResult ChildVisitResult where
    cast 1 = Break
    cast 2 = Continue
    cast 3 = Recurse
    cast 0 = Invalid
    cast m = Other m

  export
  toNative : ChildVisitResult -> Prim_ChildVisitResult
  toNative x = cast x

  export
  fromNative : Prim_ChildVisitResult -> ChildVisitResult
  fromNative x = cast x

  export
  Bits ChildVisitResult where
    Index = Index @{the (Bits Prim_ChildVisitResult) %search}
    (.&.) x y = fromNative $ (toNative x) .&. (toNative y)
    (.|.) x y = fromNative $ (toNative x) .|. (toNative y)
    xor x y = fromNative $ xor (toNative x) (toNative y)
    shiftL x y = fromNative $ shiftL (toNative x) y
    shiftR x y = fromNative $ shiftR (toNative x) y
    zeroBits = fromNative $ zeroBits
    testBit = testBit . toNative
    bit = fromNative . bit

  export
  Eq ChildVisitResult where
    (==) x y = (toNative x) == (toNative y)

break : ChildVisitResult
break = Break

continue : ChildVisitResult
continue = Continue

recurse : ChildVisitResult
recurse = break .|. continue
