#!/bin/bash
defaults write NSGlobalDomain AppleKeyboardUIMode 2
defaults write NSGlobalDomain KeyRepeat 1
defaults write NSGlobalDomain InitialKeyRepeat 12
defaults write -g com.apple.mouse.tapBehavior 1
defaults write -g com.apple.mouse.scaling 3
defaults write -g com.apple.trackpad.scaling 3
defaults write -g com.apple.keyboard.fnState 1
defaults write com.apple.AppleMultitouchTrackpad Clicking 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking 1
defaults write com.apple.dock autohide 1
defaults write com.apple.dock persistent-apps (
)
defaults write com.apple.dock tilesize 8
defaults write NSGlobalDomain com.apple.swipescrolldirection 0
defaults write com.apple.finder FXDefaultSearchScope SCcf
defaults write com.apple.finder FXPreferredGroupBy Kind
defaults write com.apple.finder FXEnableExtensionChangeWarning 0
defaults write com.apple.finder FXPreferredViewStyle clmv
defaults write com.apple.finder FXPreferredGroupBy Kind
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys {
    10 =     {
        enabled = 1;
        value =         {
            parameters =             (
                65535,
                96,
                8650752
            );
            type = standard;
        };
    };
    11 =     {
        enabled = 1;
        value =         {
            parameters =             (
                65535,
                97,
                8650752
            );
            type = standard;
        };
    };
    118 =     {
        enabled = 0;
        value =         {
            parameters =             (
                65535,
                18,
                262144
            );
            type = standard;
        };
    };
    12 =     {
        enabled = 1;
        value =         {
            parameters =             (
                65535,
                122,
                8650752
            );
            type = standard;
        };
    };
    13 =     {
        enabled = 1;
        value =         {
            parameters =             (
                65535,
                98,
                8650752
            );
            type = standard;
        };
    };
    15 =     {
        enabled = 0;
        value =         {
            parameters =             (
                56,
                28,
                1572864
            );
            type = standard;
        };
    };
    16 =     {
        enabled = 0;
    };
    160 =     {
        enabled = 0;
        value =         {
            parameters =             (
                65535,
                65535,
                0
            );
            type = standard;
        };
    };
    162 =     {
        enabled = 1;
        value =         {
            parameters =             (
                65535,
                96,
                9961472
            );
            type = standard;
        };
    };
    163 =     {
        enabled = 0;
        value =         {
            parameters =             (
                65535,
                65535,
                0
            );
            type = standard;
        };
    };
    164 =     {
        enabled = 0;
        value =         {
            parameters =             (
                65535,
                65535,
                0
            );
            type = standard;
        };
    };
    17 =     {
        enabled = 0;
        value =         {
            parameters =             (
                61,
                24,
                1572864
            );
            type = standard;
        };
    };
    175 =     {
        enabled = 1;
        value =         {
            parameters =             (
                65535,
                65535,
                0
            );
            type = standard;
        };
    };
    179 =     {
        enabled = 0;
        value =         {
            parameters =             (
                65535,
                65535,
                0
            );
            type = standard;
        };
    };
    18 =     {
        enabled = 0;
    };
    184 =     {
        enabled = 1;
        value =         {
            parameters =             (
                53,
                23,
                1179648
            );
            type = standard;
        };
    };
    19 =     {
        enabled = 0;
        value =         {
            parameters =             (
                45,
                27,
                1572864
            );
            type = standard;
        };
    };
    20 =     {
        enabled = 0;
    };
    21 =     {
        enabled = 0;
        value =         {
            parameters =             (
                56,
                28,
                1835008
            );
            type = standard;
        };
    };
    22 =     {
        enabled = 0;
    };
    23 =     {
        enabled = 0;
        value =         {
            parameters =             (
                92,
                42,
                1572864
            );
            type = standard;
        };
    };
    24 =     {
        enabled = 0;
    };
    25 =     {
        enabled = 0;
        value =         {
            parameters =             (
                46,
                47,
                1835008
            );
            type = standard;
        };
    };
    26 =     {
        enabled = 0;
        value =         {
            parameters =             (
                44,
                43,
                1835008
            );
            type = standard;
        };
    };
    27 =     {
        enabled = 1;
        value =         {
            parameters =             (
                65535,
                48,
                524288
            );
            type = standard;
        };
    };
    28 =     {
        enabled = 1;
        value =         {
            parameters =             (
                51,
                20,
                1179648
            );
            type = standard;
        };
    };
    29 =     {
        enabled = 1;
        value =         {
            parameters =             (
                51,
                20,
                1441792
            );
            type = standard;
        };
    };
    30 =     {
        enabled = 1;
        value =         {
            parameters =             (
                52,
                21,
                1179648
            );
            type = standard;
        };
    };
    31 =     {
        enabled = 1;
        value =         {
            parameters =             (
                52,
                21,
                1441792
            );
            type = standard;
        };
    };
    32 =     {
        enabled = 1;
        value =         {
            parameters =             (
                65535,
                126,
                8650752
            );
            type = standard;
        };
    };
    33 =     {
        enabled = 1;
        value =         {
            parameters =             (
                65535,
                125,
                8650752
            );
            type = standard;
        };
    };
    34 =     {
        enabled = 1;
        value =         {
            parameters =             (
                65535,
                126,
                8781824
            );
            type = standard;
        };
    };
    35 =     {
        enabled = 1;
        value =         {
            parameters =             (
                65535,
                125,
                8781824
            );
            type = standard;
        };
    };
    36 =     {
        enabled = 1;
        value =         {
            parameters =             (
                65535,
                103,
                8388608
            );
            type = standard;
        };
    };
    37 =     {
        enabled = 1;
        value =         {
            parameters =             (
                65535,
                103,
                8519680
            );
            type = standard;
        };
    };
    51 =     {
        enabled = 1;
        value =         {
            parameters =             (
                39,
                50,
                1572864
            );
            type = standard;
        };
    };
    52 =     {
        enabled = 1;
        value =         {
            parameters =             (
                100,
                2,
                1572864
            );
            type = standard;
        };
    };
    57 =     {
        enabled = 1;
        value =         {
            parameters =             (
                65535,
                100,
                8650752
            );
            type = standard;
        };
    };
    59 =     {
        enabled = 1;
        value =         {
            parameters =             (
                65535,
                96,
                9437184
            );
            type = standard;
        };
    };
    60 =     {
        enabled = 0;
        value =         {
            parameters =             (
                32,
                49,
                262144
            );
            type = standard;
        };
    };
    61 =     {
        enabled = 1;
        value =         {
            parameters =             (
                32,
                49,
                1048576
            );
            type = standard;
        };
    };
    64 =     {
        enabled = 0;
        value =         {
            parameters =             (
                32,
                49,
                1048576
            );
            type = standard;
        };
    };
    65 =     {
        enabled = 0;
        value =         {
            parameters =             (
                32,
                49,
                1572864
            );
            type = standard;
        };
    };
    7 =     {
        enabled = 1;
        value =         {
            parameters =             (
                65535,
                120,
                8650752
            );
            type = standard;
        };
    };
    79 =     {
        enabled = 1;
        value =         {
            parameters =             (
                65535,
                123,
                8650752
            );
            type = standard;
        };
    };
    8 =     {
        enabled = 1;
        value =         {
            parameters =             (
                65535,
                99,
                8650752
            );
            type = standard;
        };
    };
    80 =     {
        enabled = 1;
        value =         {
            parameters =             (
                65535,
                123,
                8781824
            );
            type = standard;
        };
    };
    81 =     {
        enabled = 1;
        value =         {
            parameters =             (
                65535,
                124,
                8650752
            );
            type = standard;
        };
    };
    82 =     {
        enabled = 1;
        value =         {
            parameters =             (
                65535,
                124,
                8781824
            );
            type = standard;
        };
    };
    9 =     {
        enabled = 1;
        value =         {
            parameters =             (
                65535,
                118,
                8650752
            );
            type = standard;
        };
    };
    98 =     {
        enabled = 1;
        value =         {
            parameters =             (
                47,
                44,
                1179648
            );
            type = standard;
        };
    };
}
defaults write NSGlobalDomain AppleShowAllExtensions 1
defaults write com.apple.dock mru-spaces 0
defaults write com.apple.screencapture location $HOME/Downloads
defaults write com.apple.dock tilesize 8
defaults write com.apple.AppleMultitouchTrackpad ActuationStrength 0
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder
killall Dock
killall SystemUIServer
