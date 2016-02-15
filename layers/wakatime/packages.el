;;; packages.el --- wakatime layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Rand01ph <tan@rand01ph-pc>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `wakatime-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `wakatime/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `wakatime/pre-init-PACKAGE' and/or
;;   `wakatime/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst wakatime-packages
  '(
   wakatime-mode
   )
  "The list of Lisp packages required by the wakatime layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun wakatime/init-wakatime-mode()
  (use-package
    :defer
    :init

    ;;set wakatime api
    (setq wakatime-api-key "96f909e0-00a6-4e3c-b3fe-d7010bf8b5de")

    ;;set wakatime-cli-path
    (setq wakatime-cli-path "/home/tan/.pyenv/versions/miniconda-3.18.3/bin/wakatime")

    ;;set wakatime mode
    (if (file-exists-p wakatime-cli-path)
        (global-wakatime-mode))
    )
  )

;; List of packages to exclude.
(setq wakatime-excluded-packages '())

;;; packages.el ends here
