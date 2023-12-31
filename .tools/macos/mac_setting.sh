# Resorces
# https://mosen.github.io/profiledocs/index.html
#
#
#

# フルキーボードアクセルをオン
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# キーリピートの高速化
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 12

# マウスでタップしたときに、クリックとする
defaults write -g com.apple.mouse.tapBehavior -int 1

# トラックパッドでタップをクリックにする
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1

# トラックパッドでタップをクリックにする(Bluetooth)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1

# マウスの速度を速める
defaults write -g com.apple.mouse.scaling 3

# TrackPadの速度を速める
defaults write -g com.apple.trackpad.scaling 3

# Automatically hide or show the Dock
defaults write com.apple.dock autohide -bool true

# Delete Defaut Apps from Finder
defaults write com.apple.dock persistent-apps -array

# Disable “natural” (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# 種類ごとに並べる設定
defaults write com.apple.finder FXPreferredGroupBy -string Kind

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, 'Nlsv',`clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Input Sources > Select next source in Input menu : Cmd + Space
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 61 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>32</integer>
        <integer>49</integer>
        <integer>1048576</integer>
      </array>
    </dict>
  </dict>
"

# Spotlight > Show Spotlight search : None
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 64 "
  <dict><key>enabled</key><false/></dict>
"

# Show Spotlight window
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 65 "<dict><key>enabled</key><false/></dict>"

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# menubar だけダークモード
# defaults write -g NSRequiresAquaSystemAppearance -bool Yes
# 復帰コマンド defaults delete -g NSRequiresAquaSystemAppearance

# 隠しファイル表示
defaults write com.apple.finder AppleShowAllFiles TRUE
# 復帰コマンド defaults write com.apple.finder AppleShowAllFiles FALSE

# キーボードのFunctionキーをFキーとして利用する
defaults write -g com.apple.keyboard.fnState -int 1

# Spaceの順番を固定する。TRUEだと、利用状況に応じて自動で順番が入れ替わる。
defaults write com.apple.dock mru-spaces -bool false

# スクリーンショットの保存先を変更
defaults write com.apple.screencapture location ~/Downloads

# Dockのサイズを見えないほど小さく
defaults write com.apple.dock tilesize -int 8

# タップ音が鳴らないようにする
defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -int 0

# 特殊文字のホバーをキャンセル（連続入力を可能に）
defaults write -g ApplePressAndHoldEnabled -bool false

echo "再起動が必要です"

killall Finder
killall Dock
