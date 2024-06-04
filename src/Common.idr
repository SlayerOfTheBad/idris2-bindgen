module Parser.Common

public export
EnumVariant : Type
EnumVariant = (String, Int)

public export
data EnumSize
  = One
  | Two
  | Four
  | Eight
  | Other

export
Cast Int EnumSize where
  cast 1 = One
  cast 2 = Two
  cast 4 = Four
  cast 8 = Eight
  cast _ = Other

public export
data ASTNodeType
  = EnumType

public export
data ASTNode : Type where
  Enum : (name: String) -> (width: EnumSize) -> (values: List EnumVariant) -> ASTNode
  ||| Anonymous declarations (typedef enum { /* field */ } Name;)
  Anonymous : ASTNode -> ASTNode
  ||| Reserved
  Forward : (type: ASTNodeType) -> (name: String) -> ASTNode
%name ASTNode node, node1, node2

public export
data AST
  = Nil
  | (::) ASTNode AST
%name AST ast, ast1, ast2

export infixr 10 ??
export
(??) : ASTNode -> AST -> AST
(??) node [] = [node]
(??) node@(Enum name _ _) (fnode@(Forward EnumType fname) :: ast) =
  case name == fname of
     False => fnode :: (node ?? ast)
     True => node :: ast
(??) node (node1 :: ast) = node1 :: (node ?? ast)
