;; 日本語環境用
(set-language-environment "Japanese")
(setq default-buffer-file-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)

;; 起動時の画面を表示しない
(setq inhibit-splash-screen t)
;; 自動バックアップを抑制
(setq backup-inhibited t)
;; オートセーブファイルを自動削除
(setq delete-auto-save-files t)
;; インデントTAB文字を使わない（空白文字を使う）
(setq-default indent-tabs-mode nil)
;; C-kで改行文字も削除
(setq kill-whole-line t)
;; 保存時に自動で最終行に改行を追加
(setq require-final-newline t)
  ;; 暫定マーク時に色を表示しない
  ;; (setq transient-mark-mode nil)
  ;; iswitchbを使う（C-xbによるバッファ選択が進化）
  ;; (iswitchb-mode 1)
  ;; iswitchbの際に無視するバッファリスと
  ;;(setq iswitchb-buffer-ignore (append iswitchb-buffer-ignore '("*Messages*" "*scratch*" "*Completions*" "*Kill Ring*")))
;; 終了時の画面を保存する
;;(desktop-save-mode 1)
;; メニューバーを表示しない
(menu-bar-mode nil)
;; ツールバーを表示しない
(tool-bar-mode nil)
  ;; スクロールバーを表示しない
  (set-scroll-bar-mode nil)
;; 列数をモードラインに表示
(column-number-mode t)
;; 時間をモードラインに表示
(display-time-mode t)
;; 時間を24時間表記で表示
(setq display-time-24hr-format t)
  ;; 現在行の下に下線を表示
  ;;(global-hl-line-mode t)
;; partial-completionを使う
(partial-completion-mode t)
;; 保存時に自動で行末にある無駄な空白を削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; 保存時に自動で実行可能スクリプトならファイルを実行可能にする
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)
;; C-hでBackspace
(global-set-key "\C-h" 'delete-backward-char)
;; C-aで行の本当に先頭ではなく，行の非空白文字の先頭へ
(defun back-to-indentation-or-beginning ()
  (interactive)
  (if (= (point) (save-excursion (back-to-indentation) (point)))
      (beginning-of-line) (back-to-indentation)))
(global-set-key "\C-a" 'back-to-indentation-or-beginning)
;; C-xkで現在バッファを削除
(global-set-key "\C-xk" 'kill-this-buffer)
;; 色の設定
(if (null window-system)
    (progn
      (set-face-foreground 'highlight "yellow")
      (set-face-background 'highlight "unspecified-bg")
      (set-face-foreground 'isearch "unspecified-bg")
      (set-face-background 'isearch "cyan")
      (set-face-foreground 'isearch-lazy-highlight-face "black")
      (set-face-background 'isearch-lazy-highlight-face "gray")
      (set-face-foreground 'minibuffer-prompt "green")
      (set-face-foreground 'font-lock-string-face "yellow")
      (set-face-foreground 'font-lock-variable-name-face "blue")
      (set-face-bold-p 'font-lock-variable-name-face t)
      (set-face-foreground 'font-lock-keyword-face "cyan")
      (set-face-foreground 'font-lock-function-name-face "green")
      (set-face-foreground 'font-lock-comment-face "magenta")
      (setq hl-line-face 'underline)
      (set-face-bold-p 'font-lock-keyword-face nil))
)


;; autoinsert
;; テンプレートは~/.emacs.d/templateに置く
(setq auto-insert-directory "~/.emacs.d/template/")
(load "autoinsert" t)
(setq auto-insert-alist
      (append '(("\\.py" . "utf8.py")
                )
              auto-insert-alist ))
(add-hook 'find-file-hooks 'auto-insert)
