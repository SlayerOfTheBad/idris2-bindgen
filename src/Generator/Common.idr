module Generator.Common

export
primitiveEnumName : String -> String
primitiveEnumName str = "Prim_" ++ str

export
toPrimitiveEnumFunc : String -> String
toPrimitiveEnumFunc str = "to" ++ primitiveEnumName str

export
fromPrimitiveEnumFunc : String -> String
fromPrimitiveEnumFunc str = "from" ++ primitiveEnumName str
