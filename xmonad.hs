import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig(additionalKeysP)
import System.IO

myManageHook = manageDocks <+> composeAll
    [ className =? "Gimp"      --> doFloat
    , className =? "Vncviewer" --> doFloat
    , className =? "Pidgin"    --> doFloat
    , className =? "trayer"    --> doIgnore
    ]

myTerminal :: String
myTerminal = "gnome-terminal"

myKeys =
        [ ("<Print>", spawn "scrot")
        , ("<Pause>", spawn "~/bin/toggleTouchpad")
        , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 10%+")
        , ("<XF86AudioLowerVolume>", spawn "amixer set Master 10%-")
        , ("<XF86AudioMute>", spawn "amixer set Master toggle")
        , ("M-p", spawn "dmenu_run")
        , ("M-d", spawn "extdisplaytoggle")
        ]
		++
		[(mask ++ "M-" ++ [key], screenWorkspace scr >>= flip whenJust (windows . action))
			| (key, scr)  <- zip "wer" [1,0,2] -- was [0..] *** change to match your screen order ***
			, (action, mask) <- [ (W.view, "") , (W.shift, "S-")]
		]

main = do
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook -- make sure to include myManageHook definition from above
                        <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , terminal = myTerminal
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeysP` myKeys
