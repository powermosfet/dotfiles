import XMonad
import Data.Monoid
import System.Exit
import XMonad.Hooks.DynamicLog
import XMonad.Layout.Spacing
import XMonad.Util.SpawnOnce
import Graphics.X11.ExtraTypes.XF86  
import XMonad.Util.EZConfig
import XMonad.Hooks.ManageDocks (manageDocks, avoidStruts)
import XMonad.Util.Run          (spawnPipe)
import System.IO                (hPutStrLn)
import Control.Monad (when)
import Text.Printf (printf)
import System.Posix.Process (executeFile)
import System.Info (arch,os)
import System.Environment (getArgs)
import System.FilePath ((</>))
-- import XMonad.Hooks.StatusBar
-- import XMonad.Hooks.StatusBar.PP

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

myTerminal           = "kitty"
myBorderWidth        = 3
myModMask            = mod4Mask
myWorkspaces         = ["1:term","2:web","3:keepass","4","5","6","7","8","9"]
myNormalBorderColor  = "#555555"
myFocusedBorderColor = "#DD1188"

myLayout = tiled ||| Mirror tiled ||| Full
  where
    tiled   = spacingRaw True (Border 0 10 10 10) True (Border 10 10 10 10) True $ Tall nmaster delta ratio
    nmaster = 1
    ratio   = 1/2
    delta   = 3/100

myStartupHook = do
  spawnOnce "trayer --edge top --align right --widthtype request --expand true --SetDockType true --SetPartialStrut true --expand true --heighttype pixel --height 22 --monitor 0 --padding 1"
  spawnOnce "nextcloud"
  spawnOnce "blueman-applet"
  spawnOnce "nm-applet"

-- Command to launch the bar.
myBar = "xmobar /home/asmund/.dotfiles/xmonad/xmobarrc"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "[" "]" }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myConfig = def {
          terminal           = myTerminal
        , borderWidth        = myBorderWidth
        , modMask            = myModMask
        , workspaces         = myWorkspaces
        , normalBorderColor  = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor

        , startupHook        = myStartupHook
        , manageHook         = manageDocks <+> manageHook def
        , layoutHook         = avoidStruts $ layoutHook def
    }
    `additionalKeysP`
    [ ("<XF86MonBrightnessUp>",   spawn "brightnessctl s 20%+")
    , ("<XF86MonBrightnessDown>", spawn "brightnessctl s 20%-")
    , ("<XF86AudioRaiseVolume>",  spawn "amixer set Master 20+ unmute")
    , ("<XF86AudioLowerVolume>",  spawn "amixer set Master 20- unmute")
    , ("<XF86AudioMute>",         spawn "amixer set Master toggle")
    , ("M-p",                     spawn "rofi -show run")
    , ("M-z",                     spawn "systemctl suspend")
    , ("M1-<Space>",              spawn "xkb-switch -n")
    ]

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

