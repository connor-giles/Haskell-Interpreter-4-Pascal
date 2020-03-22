{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_Pascal (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/giles/.cabal/bin"
libdir     = "/home/giles/.cabal/lib/x86_64-linux-ghc-8.0.2/Pascal-0.1.0.0-vXAPocBt3G6egHX6nGOgh"
dynlibdir  = "/home/giles/.cabal/lib/x86_64-linux-ghc-8.0.2"
datadir    = "/home/giles/.cabal/share/x86_64-linux-ghc-8.0.2/Pascal-0.1.0.0"
libexecdir = "/home/giles/.cabal/libexec"
sysconfdir = "/home/giles/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Pascal_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Pascal_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "Pascal_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "Pascal_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Pascal_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Pascal_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
