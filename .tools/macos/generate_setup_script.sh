#!/bin/bash

# 新しいシェルスクリプトファイルを作成
output_file="setup_new_mac.sh"
echo "#!/bin/bash" >$output_file

# 抽出したい設定のリスト
declare -a keys=(
	"NSGlobalDomain AppleKeyboardUIMode"                          # キーボードアクセスモード
	"NSGlobalDomain KeyRepeat"                                    # キーリピート速度
	"NSGlobalDomain InitialKeyRepeat"                             # キーリピート開始までの時間
	"-g com.apple.mouse.tapBehavior"                              # タップでクリックを有効にする
	"-g com.apple.mouse.scaling"                                  # マウスのスピード
	"-g com.apple.trackpad.scaling"                               # トラックパッドのスピード
	"-g com.apple.keyboard.fnState"                               # Functionキーを標準のFキーとして使用
	"com.apple.AppleMultitouchTrackpad Clicking"                  # トラックパッドのタップでクリック
	"com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking" # Bluetoothトラックパッドのタップでクリック
	"com.apple.dock autohide"                                     # Dockの自動隠し
	"com.apple.dock persistent-apps"                              # Dockに固定されたアプリ
	"com.apple.dock tilesize"                                     # Dockのサイズ
	"NSGlobalDomain com.apple.swipescrolldirection"               # スクロールの方向
	"com.apple.finder FXDefaultSearchScope"                       # Finder検索のスコープ
	"com.apple.finder FXPreferredGroupBy"                         # Finderのデフォルト表示方式
	"com.apple.finder FXEnableExtensionChangeWarning"             # 拡張子変更の警告
	"com.apple.finder FXPreferredViewStyle"                       # Finderのビュースタイル
	"com.apple.finder FXPreferredGroupBy"                         # Finderのデフォルトソート
	"com.apple.symbolichotkeys.plist AppleSymbolicHotKeys"        # シンボリックホットキー
	"NSGlobalDomain AppleShowAllExtensions"                       # すべての拡張子を表示
	"com.apple.dock mru-spaces"                                   # Spaceの順番を固定
	"com.apple.screencapture location"                            # スクリーンショットの保存先
	"com.apple.dock tilesize"                                     # Dockのサイズ
	"com.apple.AppleMultitouchTrackpad ActuationStrength"         # トラックパッドのタップ強度
	"com.apple.finder AppleShowAllFiles"                          # 隠しファイルを表示
	# ... 他の個人的な設定を追加
)

# 各設定を読み取り、新しいスクリプトに追加
for key in "${keys[@]}"; do
	# 現在の設定値を読み取る
	value=$(defaults read ${key})

	# ホームディレクトリを表す文字列があれば、$HOMEに置き換える
	# 例: /Users/username/Directory を $HOME/Directory に置き換える
	value=${value//\/Users\/$(whoami)/"\$HOME"}

	# または ~/ を $HOME/ に置き換える
	value=${value//\~/"\$HOME"}

	# シェルスクリプトファイルに書き込む
	echo "defaults write ${key} ${value}" >>$output_file
done

# FinderとDockを再起動するコマンドを追加
echo "killall Finder" >>$output_file
echo "killall Dock" >>$output_file
echo "killall SystemUIServer" >>$output_file

# 実行権限を付与
chmod +x $output_file

echo "Setup script has been created: $output_file"
