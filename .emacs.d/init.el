;; ショートカットを無効化
;; M-x で入力
;;(global-unset-key "\C-o")
;;(global-unset-key "\C-i")
;;(global-unset-key "\C-t")

;; OSのクリップボードと共有
(setq select-enable-clipboard t)


;; package管理
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

;; color theme
(load-theme 'wombat t)

;; シンボリックリンクの読み込みを許可
(setq vc-follow-symlinks t)
;; シンボリックリンク先のVCS内で更新が入った場合にバッファを自動更新
(setq auto-revert-check-vc-info t)

;; パッケージ設定
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;; 環境を日本語、UTF-8にする
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)

;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)

;; 括弧を自動で補完する
(electric-pair-mode 1)

;; tabにスペース４つを利用
(setq-default tab-width 4 indent-tabs-mode nil)

;; デフォルトの起動時のメッセージを表示しない
(setq inhibit-startup-message t)

;; 列の番号
(column-number-mode t)

;; 行番号の表示
(global-linum-mode t)

;; 1行ごとの改ページ
(setq scroll-conservatively 1)

;; 対応する括弧を光らせる
(show-paren-mode 1)

;; メニューバーの非表示
(menu-bar-mode -1)

;; ツールバーの非表示
(if window-system
    (tool-bar-mode -1))

;; リージョンのハイライト
(transient-mark-mode 1)

;; タイトルにフルパス表示
(setq frame-title-format "%f")

;;current directory 表示
(let ((ls (member 'mode-line-buffer-identification
                  mode-line-format)))
  (setcdr ls
    (cons '(:eval (concat " ("
            (abbreviate-file-name default-directory)
            ")"))
            (cdr ls))))

;; 時刻をモードラインに表示
(display-time-mode t)

;; 別のウィンドウ
(global-set-key "\C-t" 'other-window)

;; auto-complete（自動補完）
(require 'auto-complete-config)
(global-auto-complete-mode 0.5)

;; neotree（サイドバー）
(require 'neotree)
(global-set-key "\C-o" 'neotree-toggle)

;; quickrun.elのキーバインド
(require 'quickrun)
(global-set-key (kbd "C-i") 'quickrun)

;; quickrun.elでPythonをPython3に
(quickrun-add-command "python"
  '((:command . "python3")
    (:exec . "%c %s")
    (:compile-only . "pyflakes %s"))
  :mode 'python-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (quickrun neotree auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
