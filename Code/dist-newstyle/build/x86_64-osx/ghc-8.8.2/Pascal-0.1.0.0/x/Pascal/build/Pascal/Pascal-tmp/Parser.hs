{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}
#if __GLASGOW_HASKELL__ >= 710
{-# OPTIONS_GHC -XPartialTypeSignatures #-}
#endif
module Parser where

import Base
import Data
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

newtype HappyAbsSyn  = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
newtype HappyWrap4 = HappyWrap4 (Program)
happyIn4 :: (Program) -> (HappyAbsSyn )
happyIn4 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap4 x)
{-# INLINE happyIn4 #-}
happyOut4 :: (HappyAbsSyn ) -> HappyWrap4
happyOut4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut4 #-}
newtype HappyWrap5 = HappyWrap5 (VType)
happyIn5 :: (VType) -> (HappyAbsSyn )
happyIn5 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap5 x)
{-# INLINE happyIn5 #-}
happyOut5 :: (HappyAbsSyn ) -> HappyWrap5
happyOut5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut5 #-}
newtype HappyWrap6 = HappyWrap6 ([String])
happyIn6 :: ([String]) -> (HappyAbsSyn )
happyIn6 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap6 x)
{-# INLINE happyIn6 #-}
happyOut6 :: (HappyAbsSyn ) -> HappyWrap6
happyOut6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut6 #-}
newtype HappyWrap7 = HappyWrap7 (Exp)
happyIn7 :: (Exp) -> (HappyAbsSyn )
happyIn7 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap7 x)
{-# INLINE happyIn7 #-}
happyOut7 :: (HappyAbsSyn ) -> HappyWrap7
happyOut7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut7 #-}
newtype HappyWrap8 = HappyWrap8 (BoolExp)
happyIn8 :: (BoolExp) -> (HappyAbsSyn )
happyIn8 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap8 x)
{-# INLINE happyIn8 #-}
happyOut8 :: (HappyAbsSyn ) -> HappyWrap8
happyOut8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut8 #-}
newtype HappyWrap9 = HappyWrap9 ([Statement])
happyIn9 :: ([Statement]) -> (HappyAbsSyn )
happyIn9 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap9 x)
{-# INLINE happyIn9 #-}
happyOut9 :: (HappyAbsSyn ) -> HappyWrap9
happyOut9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut9 #-}
newtype HappyWrap10 = HappyWrap10 (GenExp)
happyIn10 :: (GenExp) -> (HappyAbsSyn )
happyIn10 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap10 x)
{-# INLINE happyIn10 #-}
happyOut10 :: (HappyAbsSyn ) -> HappyWrap10
happyOut10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut10 #-}
newtype HappyWrap11 = HappyWrap11 (Statement)
happyIn11 :: (Statement) -> (HappyAbsSyn )
happyIn11 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap11 x)
{-# INLINE happyIn11 #-}
happyOut11 :: (HappyAbsSyn ) -> HappyWrap11
happyOut11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut11 #-}
happyInTok :: (Token) -> (HappyAbsSyn )
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn ) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x80\x00\x20\x00\x14\x00\x33\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x08\x00\x02\x40\x01\x30\x03\x00\x00\x08\x00\x00\x10\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x06\x43\xf8\x13\x00\x00\x00\xc0\x61\x08\x7f\x02\x00\x00\x00\x18\x0c\xe1\x4f\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x0c\x86\xf0\x27\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x01\xa0\x00\x98\x01\x00\x00\x00\x00\x00\x07\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\xfe\x01\x00\x00\x00\x00\x00\x00\x00\x00\x30\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\xc1\x10\xf8\x00\x00\x00\x00\x30\x18\x02\x1f\x00\x00\x00\x00\x06\x43\xe0\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x83\x21\xf0\x01\x00\x00\x00\x60\x30\x04\x3e\x00\x00\x00\x00\x0c\x86\xc0\x07\x00\x00\x00\x80\xc1\x10\xf8\x00\x00\x00\x00\x30\x18\x02\x1f\x00\x00\x00\x00\x06\x43\xf8\x13\x00\x00\x00\x80\x00\x20\x00\x14\x00\x33\x00\x18\x0c\xe1\x4f\x00\x00\x00\x00\xf8\x07\x00\x00\x00\x00\x00\x00\x00\x08\xc0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x80\x00\x0c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x18\x0c\xe1\x4f\x00\x00\x00\x00\x83\x21\xfc\x09\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x40\x00\x00\x00\x30\x18\x02\x1f\x00\x00\x00\x00\x06\x43\xe0\x03\x00\x00\x00\xc0\x60\x08\x7c\x00\x00\x00\x00\x18\x0c\x81\x0f\x00\x00\x00\x00\x83\x21\xf0\x01\x00\x00\x00\x60\x30\x04\x3e\x00\x00\x00\x00\x0c\x86\xc0\x07\x00\x00\x00\x80\xc1\x10\xf8\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x8f\x00\x00\x00\x00\x00\x00\x80\x01\x00\x00\x00\x00\x00\x00\x30\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x06\x43\xe0\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x06\x00\x00\x00\x00\x00\x00\xc0\x00\x00\x00\x00\x00\x00\x00\x1e\x00\x00\x00\x00\x00\x00\xc0\x03\x00\x00\x00\x00\x00\x00\x78\x00\x00\x00\x00\x00\x00\x00\x0f\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x20\x00\x08\x00\x05\xc0\x0c\x00\x04\x00\x01\xa0\x00\x98\x01\x00\xe0\x01\x00\x20\x00\x00\x00\x00\x00\x00\x00\xe0\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x80\x00\x00\x80\x00\x20\x00\x14\x00\x33\x00\x00\x00\x00\x00\x08\x00\x00\x00\x02\x80\x00\x50\x00\xcc\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x20\x00\x08\x00\x05\xc0\x0c\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x10\x00\x04\x80\x02\x60\x06\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_happyParser","Program","Type","ID_list","Exp","BoolExp","Statements","GenExp","Statement","int","float","ID","Lit","'<'","'>'","'<='","'>='","'+'","'-'","'*'","'/'","'='","':='","'('","')'","'function'","'begin'","'end'","'true'","'false'","'sqrt'","'ln'","'sin'","'exp'","'cos'","'and'","'or'","'not'","'for'","'to'","'while'","'do'","'var'","':'","'boolean'","'real'","'string'","','","';'","'\"'","'ID_List'","'program'","'writeln'","'if'","'then'","'else'","'Continue'","'Break'","%eof"]
        bit_start = st * 61
        bit_end = (st + 1) * 61
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..60]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\xe2\xff\xe2\xff\xfe\xff\xd7\xff\x05\x00\x13\x00\xfe\xff\xf4\xff\x2a\x00\x58\x00\x50\x00\x60\x00\x65\x00\x39\x00\x69\x00\x00\x00\x00\x00\x36\x00\x1d\x00\x36\x00\x6a\x00\x79\x00\x4f\x00\x77\x00\x00\x00\xfe\xff\x30\x00\x7e\x00\x00\x00\x00\x00\x00\x00\x7a\x00\x00\x00\x6c\x00\xc9\x00\x52\x00\x82\x00\x00\x00\xf5\xff\xb3\x00\xb3\x00\xb3\x00\x00\x00\x00\x00\xb3\x00\xb3\x00\xb3\x00\xb3\x00\xb3\x00\x68\x00\xfe\xff\x81\x00\xc9\x00\xf7\xff\xfa\xff\x91\x00\xb0\x00\x20\x00\xaa\x00\x9a\x00\x9a\x00\x84\x00\xb1\x00\xb9\x00\xb3\x00\xb3\x00\xb3\x00\xb3\x00\xb3\x00\xb3\x00\xb3\x00\xb3\x00\xbc\x00\xcc\x00\x52\x00\xaf\x00\x00\x00\xaf\x00\xaf\x00\xaf\x00\xaf\x00\x38\x00\x32\x00\x32\x00\x00\x00\x00\x00\x00\x00\x00\x00\xba\x00\xb3\x00\x00\x00\x00\x00\x32\x00\x32\x00\xaf\x00\xaf\x00\xaf\x00\xaf\x00\xcd\x00\x00\x00\x00\x00\x6b\x00\x6b\x00\xce\x00\xfe\xff\xfe\xff\x02\x00\x30\x00\xb6\x00\xcf\x00\xd0\x00\xd1\x00\xb7\x00\xbd\x00\xfe\xff\xc5\x00\xfe\xff\xd5\x00\x00\x00\xd7\x00\xfe\xff\xc3\x00\xd8\x00\xfe\xff\x00\x00\xd9\x00\x00\x00\xda\x00\xc6\x00\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\xe2\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x55\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x9c\x00\x14\x00\xc0\x00\x00\x00\x00\x00\x43\x00\xed\x00\x00\x00\x5b\x00\xef\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xee\x00\xf0\x00\xf1\x00\x00\x00\x00\x00\xf2\x00\xf3\x00\xf4\x00\xf5\x00\xf6\x00\xc2\x00\x22\x00\xbb\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc4\x00\xd3\x00\x00\x00\x00\x00\x00\x00\xf7\x00\xf8\x00\xf9\x00\xfa\x00\xfb\x00\xfc\x00\xfd\x00\xfe\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x6e\x00\x74\x00\x00\x00\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x87\x00\x00\x00\x8d\x00\x00\x00\x00\x00\x00\x00\xa0\x00\x00\x00\x00\x00\xa6\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyAdjustOffset :: Happy_GHC_Exts.Int# -> Happy_GHC_Exts.Int#
happyAdjustOffset off = off

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\x00\x00\x00\x00\xe0\xff\x00\x00\x00\x00\x00\x00\xe0\xff\xfa\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd4\xff\xd5\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xdf\xff\xe0\xff\x00\x00\x00\x00\xfd\xff\xfc\xff\xfb\xff\x00\x00\xf9\xff\xfa\xff\xde\xff\xdd\xff\x00\x00\xeb\xff\xec\xff\x00\x00\x00\x00\x00\x00\xea\xff\xe9\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xec\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe8\xff\xf2\xff\xec\xff\xf1\xff\xf3\xff\xf4\xff\xf5\xff\x00\x00\xf6\xff\xf7\xff\xdb\xff\xfe\xff\xd3\xff\xf8\xff\x00\x00\x00\x00\xee\xff\xef\xff\xed\xff\xf0\xff\xe4\xff\xe5\xff\xe6\xff\xe7\xff\x00\x00\xd7\xff\xd6\xff\xe2\xff\xe3\xff\x00\x00\xe0\xff\xe0\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe0\xff\x00\x00\xe0\xff\x00\x00\xd9\xff\x00\x00\xe0\xff\x00\x00\x00\x00\xe0\xff\xd8\xff\x00\x00\xda\xff\x00\x00\x00\x00\xd2\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x03\x00\x0e\x00\x02\x00\x22\x00\x10\x00\x05\x00\x10\x00\x07\x00\x32\x00\x10\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x11\x00\x1b\x00\x1c\x00\x1b\x00\x1c\x00\x1f\x00\x1b\x00\x1c\x00\x03\x00\x04\x00\x1f\x00\x06\x00\x27\x00\x1e\x00\x28\x00\x20\x00\x02\x00\x03\x00\x04\x00\x28\x00\x21\x00\x02\x00\x12\x00\x09\x00\x0a\x00\x23\x00\x07\x00\x2c\x00\x2d\x00\x0f\x00\x03\x00\x30\x00\x31\x00\x10\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x02\x00\x03\x00\x1d\x00\x1b\x00\x1c\x00\x0b\x00\x0c\x00\x09\x00\x0a\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0f\x00\x03\x00\x04\x00\x10\x00\x06\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x02\x00\x03\x00\x1d\x00\x24\x00\x25\x00\x26\x00\x02\x00\x09\x00\x0a\x00\x05\x00\x03\x00\x07\x00\x02\x00\x0f\x00\x0f\x00\x05\x00\x28\x00\x07\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x02\x00\x03\x00\x1d\x00\x1b\x00\x1c\x00\x0f\x00\x02\x00\x09\x00\x0a\x00\x05\x00\x0f\x00\x07\x00\x02\x00\x0f\x00\x0e\x00\x05\x00\x03\x00\x07\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x02\x00\x03\x00\x1d\x00\x1b\x00\x1c\x00\x0f\x00\x02\x00\x09\x00\x0a\x00\x05\x00\x13\x00\x07\x00\x02\x00\x0f\x00\x28\x00\x05\x00\x27\x00\x07\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x02\x00\x03\x00\x1d\x00\x03\x00\x04\x00\x10\x00\x02\x00\x09\x00\x0a\x00\x05\x00\x28\x00\x07\x00\x02\x00\x0f\x00\x28\x00\x05\x00\x28\x00\x07\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x02\x00\x03\x00\x1d\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x09\x00\x0a\x00\x03\x00\x04\x00\x10\x00\x06\x00\x0f\x00\x03\x00\x04\x00\x03\x00\x04\x00\x03\x00\x04\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x03\x00\x04\x00\x2e\x00\x28\x00\x21\x00\x1f\x00\x10\x00\x23\x00\x28\x00\x12\x00\x12\x00\x12\x00\x00\x00\x13\x00\x13\x00\x28\x00\x2f\x00\x22\x00\x13\x00\x12\x00\x12\x00\x28\x00\x13\x00\x13\x00\x28\x00\x02\x00\x01\x00\x03\x00\xff\xff\x03\x00\x03\x00\x03\x00\x03\x00\x03\x00\x03\x00\x03\x00\x03\x00\x03\x00\x03\x00\x03\x00\x03\x00\x03\x00\x03\x00\x03\x00\x03\x00\x01\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x08\x00\x17\x00\x04\x00\x03\x00\xdc\xff\x05\x00\x40\x00\x06\x00\xff\xff\xe1\xff\x45\x00\x46\x00\x47\x00\x48\x00\x09\x00\xe1\xff\xe1\xff\x3c\x00\x3d\x00\xdc\xff\xe1\xff\xe1\xff\x22\x00\x23\x00\xe1\xff\x37\x00\x18\x00\x0a\x00\xdc\xff\x0b\x00\x26\x00\x27\x00\x39\x00\xe1\xff\x6e\x00\x04\x00\x1a\x00\x28\x00\x29\x00\x1b\x00\x49\x00\x0c\x00\x0d\x00\x2a\x00\x16\x00\x0e\x00\x0f\x00\x3b\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x31\x00\x26\x00\x37\x00\x32\x00\x3c\x00\x3d\x00\x47\x00\x48\x00\x28\x00\x29\x00\x45\x00\x46\x00\x47\x00\x48\x00\x2a\x00\x22\x00\x23\x00\x58\x00\x24\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x31\x00\x26\x00\x27\x00\x32\x00\x1d\x00\x1e\x00\x1f\x00\x04\x00\x28\x00\x29\x00\x18\x00\x15\x00\x06\x00\x04\x00\x2a\x00\x14\x00\x1f\x00\x11\x00\x06\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x31\x00\x26\x00\x37\x00\x32\x00\x3c\x00\x3d\x00\x13\x00\x04\x00\x28\x00\x29\x00\x6f\x00\x12\x00\x06\x00\x04\x00\x2a\x00\x34\x00\x6e\x00\x22\x00\x06\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x31\x00\x26\x00\x27\x00\x32\x00\x3c\x00\x3d\x00\x33\x00\x04\x00\x28\x00\x29\x00\x75\x00\x56\x00\x06\x00\x04\x00\x2a\x00\x10\x00\x7a\x00\x18\x00\x06\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x31\x00\x26\x00\x37\x00\x32\x00\x34\x00\x39\x00\x3f\x00\x04\x00\x28\x00\x29\x00\x7d\x00\x57\x00\x06\x00\x04\x00\x2a\x00\x55\x00\x7f\x00\x65\x00\x06\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x31\x00\x26\x00\x4d\x00\x32\x00\x45\x00\x46\x00\x47\x00\x48\x00\x28\x00\x29\x00\x22\x00\x23\x00\x3e\x00\x48\x00\x2a\x00\x34\x00\x35\x00\x34\x00\x4a\x00\x34\x00\x66\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x31\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\x46\x00\x47\x00\x48\x00\x34\x00\x65\x00\x68\x00\x64\x00\x63\x00\x5a\x00\x59\x00\x6c\x00\x74\x00\x6a\x00\x69\x00\x73\x00\x03\x00\x72\x00\x71\x00\x77\x00\x78\x00\x75\x00\x7a\x00\x79\x00\x7c\x00\x7d\x00\x7f\x00\x81\x00\x82\x00\x20\x00\x1b\x00\x53\x00\x00\x00\x52\x00\x51\x00\x50\x00\x4f\x00\x4e\x00\x4d\x00\x4b\x00\x61\x00\x60\x00\x5f\x00\x5e\x00\x5d\x00\x5c\x00\x5b\x00\x5a\x00\x6a\x00\x6c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (1, 45) [
	(1 , happyReduce_1),
	(2 , happyReduce_2),
	(3 , happyReduce_3),
	(4 , happyReduce_4),
	(5 , happyReduce_5),
	(6 , happyReduce_6),
	(7 , happyReduce_7),
	(8 , happyReduce_8),
	(9 , happyReduce_9),
	(10 , happyReduce_10),
	(11 , happyReduce_11),
	(12 , happyReduce_12),
	(13 , happyReduce_13),
	(14 , happyReduce_14),
	(15 , happyReduce_15),
	(16 , happyReduce_16),
	(17 , happyReduce_17),
	(18 , happyReduce_18),
	(19 , happyReduce_19),
	(20 , happyReduce_20),
	(21 , happyReduce_21),
	(22 , happyReduce_22),
	(23 , happyReduce_23),
	(24 , happyReduce_24),
	(25 , happyReduce_25),
	(26 , happyReduce_26),
	(27 , happyReduce_27),
	(28 , happyReduce_28),
	(29 , happyReduce_29),
	(30 , happyReduce_30),
	(31 , happyReduce_31),
	(32 , happyReduce_32),
	(33 , happyReduce_33),
	(34 , happyReduce_34),
	(35 , happyReduce_35),
	(36 , happyReduce_36),
	(37 , happyReduce_37),
	(38 , happyReduce_38),
	(39 , happyReduce_39),
	(40 , happyReduce_40),
	(41 , happyReduce_41),
	(42 , happyReduce_42),
	(43 , happyReduce_43),
	(44 , happyReduce_44),
	(45 , happyReduce_45)
	]

happy_n_terms = 51 :: Int
happy_n_nonterms = 8 :: Int

happyReduce_1 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_1 = happyReduce 5# 0# happyReduction_1
happyReduction_1 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut9 happy_x_2 of { (HappyWrap9 happy_var_2) -> 
	case happyOut9 happy_x_4 of { (HappyWrap9 happy_var_4) -> 
	happyIn4
		 (happy_var_2 ++ happy_var_4
	) `HappyStk` happyRest}}

happyReduce_2 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_2 = happySpecReduce_1  1# happyReduction_2
happyReduction_2 happy_x_1
	 =  happyIn5
		 (BOOL
	)

happyReduce_3 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_3 = happySpecReduce_1  1# happyReduction_3
happyReduction_3 happy_x_1
	 =  happyIn5
		 (REAL
	)

happyReduce_4 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_4 = happySpecReduce_1  1# happyReduction_4
happyReduction_4 happy_x_1
	 =  happyIn5
		 (STRING
	)

happyReduce_5 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_5 = happySpecReduce_1  2# happyReduction_5
happyReduction_5 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	happyIn6
		 ([happy_var_1]
	)}

happyReduce_6 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_6 = happySpecReduce_3  2# happyReduction_6
happyReduction_6 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOut6 happy_x_3 of { (HappyWrap6 happy_var_3) -> 
	happyIn6
		 (happy_var_1:happy_var_3
	)}}

happyReduce_7 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_7 = happySpecReduce_3  3# happyReduction_7
happyReduction_7 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_2 of { (HappyWrap7 happy_var_2) -> 
	happyIn7
		 (happy_var_2
	)}

happyReduce_8 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_8 = happySpecReduce_2  3# happyReduction_8
happyReduction_8 happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_2 of { (HappyWrap7 happy_var_2) -> 
	happyIn7
		 (happy_var_2
	)}

happyReduce_9 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_9 = happySpecReduce_2  3# happyReduction_9
happyReduction_9 happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_2 of { (HappyWrap7 happy_var_2) -> 
	happyIn7
		 (Op1 "-" happy_var_2
	)}

happyReduce_10 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_10 = happySpecReduce_2  3# happyReduction_10
happyReduction_10 happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_2 of { (HappyWrap7 happy_var_2) -> 
	happyIn7
		 (Op1 "sqrt" happy_var_2
	)}

happyReduce_11 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_11 = happySpecReduce_2  3# happyReduction_11
happyReduction_11 happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_2 of { (HappyWrap7 happy_var_2) -> 
	happyIn7
		 (Op1 "ln" happy_var_2
	)}

happyReduce_12 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_12 = happySpecReduce_2  3# happyReduction_12
happyReduction_12 happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_2 of { (HappyWrap7 happy_var_2) -> 
	happyIn7
		 (Op1 "sin" happy_var_2
	)}

happyReduce_13 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_13 = happySpecReduce_2  3# happyReduction_13
happyReduction_13 happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_2 of { (HappyWrap7 happy_var_2) -> 
	happyIn7
		 (Op1 "cos" happy_var_2
	)}

happyReduce_14 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_14 = happySpecReduce_2  3# happyReduction_14
happyReduction_14 happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_2 of { (HappyWrap7 happy_var_2) -> 
	happyIn7
		 (Op1 "exp" happy_var_2
	)}

happyReduce_15 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_15 = happySpecReduce_3  3# happyReduction_15
happyReduction_15 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_1 of { (HappyWrap7 happy_var_1) -> 
	case happyOut7 happy_x_3 of { (HappyWrap7 happy_var_3) -> 
	happyIn7
		 (Op2 "+" happy_var_1 happy_var_3
	)}}

happyReduce_16 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_16 = happySpecReduce_3  3# happyReduction_16
happyReduction_16 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_1 of { (HappyWrap7 happy_var_1) -> 
	case happyOut7 happy_x_3 of { (HappyWrap7 happy_var_3) -> 
	happyIn7
		 (Op2 "*" happy_var_1 happy_var_3
	)}}

happyReduce_17 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_17 = happySpecReduce_3  3# happyReduction_17
happyReduction_17 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_1 of { (HappyWrap7 happy_var_1) -> 
	case happyOut7 happy_x_3 of { (HappyWrap7 happy_var_3) -> 
	happyIn7
		 (Op2 "/" happy_var_1 happy_var_3
	)}}

happyReduce_18 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_18 = happySpecReduce_3  3# happyReduction_18
happyReduction_18 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_1 of { (HappyWrap7 happy_var_1) -> 
	case happyOut7 happy_x_3 of { (HappyWrap7 happy_var_3) -> 
	happyIn7
		 (Op2 "-" happy_var_1 happy_var_3
	)}}

happyReduce_19 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_19 = happySpecReduce_1  3# happyReduction_19
happyReduction_19 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	happyIn7
		 (Var happy_var_1
	)}

happyReduce_20 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_20 = happySpecReduce_1  3# happyReduction_20
happyReduction_20 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenFloat happy_var_1)) -> 
	happyIn7
		 (Real happy_var_1
	)}

happyReduce_21 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_21 = happySpecReduce_1  4# happyReduction_21
happyReduction_21 happy_x_1
	 =  happyIn8
		 (True_C
	)

happyReduce_22 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_22 = happySpecReduce_1  4# happyReduction_22
happyReduction_22 happy_x_1
	 =  happyIn8
		 (False_C
	)

happyReduce_23 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_23 = happySpecReduce_2  4# happyReduction_23
happyReduction_23 happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_2 of { (HappyWrap8 happy_var_2) -> 
	happyIn8
		 (Not happy_var_2
	)}

happyReduce_24 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_24 = happySpecReduce_3  4# happyReduction_24
happyReduction_24 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_1 of { (HappyWrap7 happy_var_1) -> 
	case happyOut7 happy_x_3 of { (HappyWrap7 happy_var_3) -> 
	happyIn8
		 (Comp "<" happy_var_1 happy_var_3
	)}}

happyReduce_25 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_25 = happySpecReduce_3  4# happyReduction_25
happyReduction_25 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_1 of { (HappyWrap7 happy_var_1) -> 
	case happyOut7 happy_x_3 of { (HappyWrap7 happy_var_3) -> 
	happyIn8
		 (Comp ">" happy_var_1 happy_var_3
	)}}

happyReduce_26 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_26 = happySpecReduce_3  4# happyReduction_26
happyReduction_26 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_1 of { (HappyWrap7 happy_var_1) -> 
	case happyOut7 happy_x_3 of { (HappyWrap7 happy_var_3) -> 
	happyIn8
		 (Comp "<=" happy_var_1 happy_var_3
	)}}

happyReduce_27 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_27 = happySpecReduce_3  4# happyReduction_27
happyReduction_27 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_1 of { (HappyWrap7 happy_var_1) -> 
	case happyOut7 happy_x_3 of { (HappyWrap7 happy_var_3) -> 
	happyIn8
		 (Comp ">=" happy_var_1 happy_var_3
	)}}

happyReduce_28 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_28 = happySpecReduce_3  4# happyReduction_28
happyReduction_28 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
	case happyOut8 happy_x_3 of { (HappyWrap8 happy_var_3) -> 
	happyIn8
		 (OpB "and" happy_var_1 happy_var_3
	)}}

happyReduce_29 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_29 = happySpecReduce_3  4# happyReduction_29
happyReduction_29 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
	case happyOut8 happy_x_3 of { (HappyWrap8 happy_var_3) -> 
	happyIn8
		 (OpB "or" happy_var_1 happy_var_3
	)}}

happyReduce_30 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_30 = happySpecReduce_1  4# happyReduction_30
happyReduction_30 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	happyIn8
		 (Var_B happy_var_1
	)}

happyReduce_31 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_31 = happySpecReduce_0  5# happyReduction_31
happyReduction_31  =  happyIn9
		 ([]
	)

happyReduce_32 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_32 = happySpecReduce_2  5# happyReduction_32
happyReduction_32 happy_x_2
	happy_x_1
	 =  case happyOut11 happy_x_1 of { (HappyWrap11 happy_var_1) -> 
	case happyOut9 happy_x_2 of { (HappyWrap9 happy_var_2) -> 
	happyIn9
		 (happy_var_1:happy_var_2
	)}}

happyReduce_33 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_33 = happySpecReduce_1  6# happyReduction_33
happyReduction_33 happy_x_1
	 =  case happyOut7 happy_x_1 of { (HappyWrap7 happy_var_1) -> 
	happyIn10
		 (FloatExp happy_var_1
	)}

happyReduce_34 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_34 = happySpecReduce_1  6# happyReduction_34
happyReduction_34 happy_x_1
	 =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
	happyIn10
		 (BExp happy_var_1
	)}

happyReduce_35 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_35 = happySpecReduce_1  6# happyReduction_35
happyReduction_35 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	happyIn10
		 (VarExp happy_var_1
	)}

happyReduce_36 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_36 = happyReduce 4# 7# happyReduction_36
happyReduction_36 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOut10 happy_x_3 of { (HappyWrap10 happy_var_3) -> 
	happyIn11
		 (Assign happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_37 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_37 = happyReduce 12# 7# happyReduction_37
happyReduction_37 (happy_x_12 `HappyStk`
	happy_x_11 `HappyStk`
	happy_x_10 `HappyStk`
	happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut8 happy_x_3 of { (HappyWrap8 happy_var_3) -> 
	case happyOut9 happy_x_7 of { (HappyWrap9 happy_var_7) -> 
	case happyOut9 happy_x_11 of { (HappyWrap9 happy_var_11) -> 
	happyIn11
		 (If happy_var_3 happy_var_7 happy_var_11
	) `HappyStk` happyRest}}}

happyReduce_38 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_38 = happyReduce 9# 7# happyReduction_38
happyReduction_38 (happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut8 happy_x_3 of { (HappyWrap8 happy_var_3) -> 
	case happyOut9 happy_x_7 of { (HappyWrap9 happy_var_7) -> 
	happyIn11
		 (While happy_var_3 happy_var_7
	) `HappyStk` happyRest}}

happyReduce_39 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_39 = happyReduce 11# 7# happyReduction_39
happyReduction_39 (happy_x_11 `HappyStk`
	happy_x_10 `HappyStk`
	happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { (Token _ (TokenID happy_var_2)) -> 
	case happyOut10 happy_x_4 of { (HappyWrap10 happy_var_4) -> 
	case happyOut7 happy_x_6 of { (HappyWrap7 happy_var_6) -> 
	case happyOut9 happy_x_9 of { (HappyWrap9 happy_var_9) -> 
	happyIn11
		 (For happy_var_2 happy_var_4 happy_var_6 happy_var_9
	) `HappyStk` happyRest}}}}

happyReduce_40 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_40 = happyReduce 5# 7# happyReduction_40
happyReduction_40 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut10 happy_x_3 of { (HappyWrap10 happy_var_3) -> 
	happyIn11
		 (Write happy_var_3
	) `HappyStk` happyRest}

happyReduce_41 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_41 = happyReduce 5# 7# happyReduction_41
happyReduction_41 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_3 of { (Token _ (TokenLit happy_var_3)) -> 
	happyIn11
		 (WriteLiteral happy_var_3
	) `HappyStk` happyRest}

happyReduce_42 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_42 = happySpecReduce_2  7# happyReduction_42
happyReduction_42 happy_x_2
	happy_x_1
	 =  happyIn11
		 (Continue_S
	)

happyReduce_43 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_43 = happySpecReduce_2  7# happyReduction_43
happyReduction_43 happy_x_2
	happy_x_1
	 =  happyIn11
		 (Break_S
	)

happyReduce_44 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_44 = happyReduce 4# 7# happyReduction_44
happyReduction_44 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut6 happy_x_1 of { (HappyWrap6 happy_var_1) -> 
	case happyOut5 happy_x_3 of { (HappyWrap5 happy_var_3) -> 
	happyIn11
		 (VarDef happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_45 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_45 = happyReduce 14# 7# happyReduction_45
happyReduction_45 (happy_x_14 `HappyStk`
	happy_x_13 `HappyStk`
	happy_x_12 `HappyStk`
	happy_x_11 `HappyStk`
	happy_x_10 `HappyStk`
	happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { (Token _ (TokenID happy_var_2)) -> 
	case happyOut11 happy_x_4 of { (HappyWrap11 happy_var_4) -> 
	case happyOut5 happy_x_7 of { (HappyWrap5 happy_var_7) -> 
	case happyOut9 happy_x_10 of { (HappyWrap9 happy_var_10) -> 
	case happyOut9 happy_x_12 of { (HappyWrap9 happy_var_12) -> 
	happyIn11
		 (Function happy_var_2 happy_var_4 happy_var_7 (happy_var_10 ++ happy_var_12)
	) `HappyStk` happyRest}}}}}

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = happyDoAction i tk action sts stk in
	case tk of {
	Token _ TokenEOF -> happyDoAction 50# tk action sts stk;
	Token _ (TokenInt happy_dollar_dollar) -> cont 1#;
	Token _ (TokenFloat happy_dollar_dollar) -> cont 2#;
	Token _ (TokenID happy_dollar_dollar) -> cont 3#;
	Token _ (TokenLit happy_dollar_dollar) -> cont 4#;
	Token _ (TokenOp "<") -> cont 5#;
	Token _ (TokenOp ">") -> cont 6#;
	Token _ (TokenOp "<=") -> cont 7#;
	Token _ (TokenOp ">=") -> cont 8#;
	Token _ (TokenOp "+") -> cont 9#;
	Token _ (TokenOp "-") -> cont 10#;
	Token _ (TokenOp "*") -> cont 11#;
	Token _ (TokenOp "/") -> cont 12#;
	Token _ (TokenOp "=") -> cont 13#;
	Token _ (TokenOp ":=") -> cont 14#;
	Token _ (TokenK  "(") -> cont 15#;
	Token _ (TokenK  ")") -> cont 16#;
	Token _ (TokenK "function") -> cont 17#;
	Token _ (TokenK "begin") -> cont 18#;
	Token _ (TokenK "end") -> cont 19#;
	Token _ (TokenK "true") -> cont 20#;
	Token _ (TokenK "false") -> cont 21#;
	Token _ (TokenK "sqrt") -> cont 22#;
	Token _ (TokenK "ln") -> cont 23#;
	Token _ (TokenK "sin") -> cont 24#;
	Token _ (TokenK "exp") -> cont 25#;
	Token _ (TokenK "cos") -> cont 26#;
	Token _ (TokenK "and") -> cont 27#;
	Token _ (TokenK "or") -> cont 28#;
	Token _ (TokenK "not") -> cont 29#;
	Token _ (TokenK "for") -> cont 30#;
	Token _ (TokenK "to") -> cont 31#;
	Token _ (TokenK "while") -> cont 32#;
	Token _ (TokenK "do") -> cont 33#;
	Token _ (TokenK "var") -> cont 34#;
	Token _ (TokenK ":") -> cont 35#;
	Token _ (TokenK "boolean") -> cont 36#;
	Token _ (TokenK "real") -> cont 37#;
	Token _ (TokenK "string") -> cont 38#;
	Token _ (TokenK ",") -> cont 39#;
	Token _ (TokenK ";") -> cont 40#;
	Token _ (TokenK "\"") -> cont 41#;
	Token _ (TokenK "ID_List") -> cont 42#;
	Token _ (TokenK "program") -> cont 43#;
	Token _ (TokenK "writeln") -> cont 44#;
	Token _ (TokenK "if") -> cont 45#;
	Token _ (TokenK "then") -> cont 46#;
	Token _ (TokenK "else") -> cont 47#;
	Token _ (TokenK "Continue") -> cont 48#;
	Token _ (TokenK "Break") -> cont 49#;
	_ -> happyError' (tk, [])
	})

happyError_ explist 50# tk = happyError' (tk, explist)
happyError_ explist _ tk = happyError' (tk, explist)

happyThen :: () => Parser a -> (a -> Parser b) -> Parser b
happyThen = (thenP)
happyReturn :: () => a -> Parser a
happyReturn = (returnP)
happyParse :: () => Happy_GHC_Exts.Int# -> Parser (HappyAbsSyn )

happyNewToken :: () => Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )

happyDoAction :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )

happyReduceArr :: () => Happy_Data_Array.Array Int (Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn ))

happyThen1 :: () => Parser a -> (a -> Parser b) -> Parser b
happyThen1 = happyThen
happyReturn1 :: () => a -> Parser a
happyReturn1 = happyReturn
happyError' :: () => ((Token), [String]) -> Parser a
happyError' tk = (\(tokens, explist) -> happyError) tk
happyParser = happySomeParser where
 happySomeParser = happyThen (happyParse 0#) (\x -> happyReturn (let {(HappyWrap4 x') = happyOut4 x} in x'))

happySeq = happyDontSeq



{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $













-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif



















data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
        = {- nothing -}
          case action of
                0#           -> {- nothing -}
                                     happyFail (happyExpListPerState ((Happy_GHC_Exts.I# (st)) :: Int)) i tk st
                -1#          -> {- nothing -}
                                     happyAccept i tk st
                n | LT(n,(0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}
                                                   (happyReduceArr Happy_Data_Array.! rule) i tk st
                                                   where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
                n                 -> {- nothing -}
                                     happyShift new_state i tk st
                                     where new_state = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where off    = happyAdjustOffset (indexShortOffAddr happyActOffsets st)
         off_i  = (off Happy_GHC_Exts.+# i)
         check  = if GTE(off_i,(0# :: Happy_GHC_Exts.Int#))
                  then EQ(indexShortOffAddr happyCheck off_i, i)
                  else False
         action
          | check     = indexShortOffAddr happyTable off_i
          | otherwise = indexShortOffAddr happyDefActions st




indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#




{-# INLINE happyLt #-}
happyLt x y = LT(x,y)


readArrayBit arr bit =
    Bits.testBit (Happy_GHC_Exts.I# (indexShortOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 4#))) (bit `mod` 16)
  where unbox_int (Happy_GHC_Exts.I# x) = x






data HappyAddr = HappyA# Happy_GHC_Exts.Addr#


-----------------------------------------------------------------------------
-- HappyState data type (not arrays)













-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@((HappyCons (st1@(action)) (_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st1)
             off_i = (off Happy_GHC_Exts.+# nt)
             new_state = indexShortOffAddr happyTable off_i




          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st)
         off_i = (off Happy_GHC_Exts.+# nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist 0# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (action) sts stk =
--      trace "entering error recovery" $
        happyDoAction 0# tk action sts ((Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
