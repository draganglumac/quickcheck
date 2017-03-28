{-# LANGUAGE TypeOperators, GADTs, CPP #-}
#ifndef NO_SAFE_HASKELL
{-# LANGUAGE Safe #-}
#endif
#if defined(__GLASGOW_HASKELL__) && __GLASGOW_HASKELL__ >= 708
{-# LANGUAGE PatternSynonyms, ViewPatterns #-}
#endif

#ifndef NO_GENERICS
{-# LANGUAGE DefaultSignatures, FlexibleContexts #-}
#endif

#ifndef NO_POLYKINDS
{-# LANGUAGE PolyKinds #-}
#endif

-- | Generation of random shrinkable, showable functions.
-- See the paper \"Shrinking and showing functions\" by Koen Claessen.
--
-- Example of use:
--
-- >>> :{
-- >>> let prop :: Fun String Integer -> Bool
-- >>>     prop (Fun _ f) = f "monkey" == f "banana" || f "banana" == f "elephant"
-- >>> :}
-- >>> quickCheck prop
-- *** Failed! Falsifiable (after 3 tests and 134 shrinks):
-- {"elephant"->1, "monkey"->1, _->0}
--
-- To generate random values of type @'Fun' a b@,
-- you must have an instance @'Function' a@.
-- If your type has a 'Show' instance, you can use 'functionShow' to write the instance; otherwise,
-- use 'functionMap' to give a bijection between your type and a type that is already an instance of 'Function'.
-- See the @'Function' [a]@ instance for an example of the latter.
module Test.QuickCheck.Function
  ( Fun(..)
  , Fun2
  , Fun3
  , appFun
  , apply
  , appFun2
  , appFun3
  , (:->)
  , Function(..)
  , functionMap
  , functionShow
  , functionIntegral
  , functionRealFrac
  , functionBoundedEnum
#if defined(__GLASGOW_HASKELL__) && __GLASGOW_HASKELL__ >= 708
  , pattern Fn
  , pattern Fn2
  , pattern Fn3
#endif
  )
 where

-- Autogenerated - please run full/update to regenerate
import Test.QuickCheck.Light.Function
