(setThemeAndTakeScreenshots)

(defun setThemeAndTakeScreenshots ()
  (let ((themes '((adwaita nil "native")
		  (afternoon t "https://github.com/osener/emacs-afternoon-theme" "afternoon-theme")
		  (alect-black t "https://github.com/alezost/alect-themes" "alect-themes")
		  (alect-black-alt t "https://github.com/alezost/alect-themes" "alect-themes")
		  (alect-dark t "https://github.com/alezost/alect-themes" "alect-themes")
		  (alect-dark-alt t "https://github.com/alezost/alect-themes" "alect-themes")
		  (alect-light nil "https://github.com/alezost/alect-themes" "alect-themes")
		  (alect-light-alt nil "https://github.com/alezost/alect-themes" "alect-themes")
		  (ample t "https://github.com/jordonbiondo/ample-theme" "ample-theme")
		  (ample-light nil "https://github.com/jordonbiondo/ample-theme" "ample-theme")
		  (ample-zen t "https://github.com/mjwall/ample-zen" "ample-zen-theme")
		  (anti-zenburn nil "https://github.com/m00natic/anti-zenburn-theme" "anti-zenburn-theme")
		  (badger t "https://github.com/ccann/badger-theme" "badger-theme")
		  (bubbleberry t "https://github.com/jasonm23/emacs-bubbleberry-theme" "bubbleberry-theme")
		  (busybee t "https://github.com/mswift42/busybee-theme" "busybee-theme")
		  (cherry-blossom t "https://github.com/byels/emacs-cherry-blossom-theme" "cherry-blossom-theme")
		  (clues t "https://github.com/emacsfodder/emacs-clues-theme" "clues-theme")
		  (cyberpunk t "https://github.com/n3mo/cyberpunk-theme.el" "cyberpunk-theme")
		  (dakrone t "https://github.com/dakrone/dakrone-theme" "dakrone-theme")
		  (darkburn t "https://github.com/gorauskas/darkburn-theme" "darkburn-theme")
		  (deeper-blue t "native")
		  (dichromacy nil "native")
		  (distinguished t "https://github.com/Lokaltog/distinguished-theme" "distinguished-theme")
		  (espresso nil  "https://github.com/dgutov/espresso-theme" "espresso-theme")
		  (firebelly t "https://github.com/startling/firebelly" "firebelly-theme")
		  (flatland t "https://github.com/gchp/flatland-emacs" "flatland-theme")
		  (flatui nil "https://github.com/Corsair/emacs-flatui-theme" "flatui-theme")	
		  (grandshell t "https://github.com/steckerhalter/grandshell-theme" "grandshell-theme")
		  (gruber-darker t "https://github.com/rexim/gruber-darker-theme" "gruber-darker-theme")
		  (gruvbox t "https://github.com/Greduan/emacs-theme-gruvbox" "gruvbox-theme")
		  (hemisu-dark t "https://github.com/andrzejsliwa/hemisu-theme" "hemisu-theme")
		  (hemisu-light nil "https://github.com/andrzejsliwa/hemisu-theme" "hemisu-theme")
		  (heroku t "https://github.com/jonathanchu/heroku-theme" "heroku-theme")
		  (leuven nil "https://github.com/fniessen/emacs-leuven-theme" "leuven-theme")
		  (light-blue nil "native")
		  (manoj-dark t "native")
		  (misterioso t "native")
		  (moe-dark t "https://github.com/kuanyui/moe-theme.el" "moe-theme")
		  (moe-light nil "https://github.com/kuanyui/moe-theme.el" "moe-theme")
		  (monokai t "https://github.com/oneKelvinSmith/monokai-emacs" "monokai-theme")
      (nova t "https://github.com/muirmanders/emacs-nova-theme" "nova-theme")
		  (sanityinc-tomorrow-blue t "https://github.com/purcell/color-theme-sanityinc-tomorrow" "color-theme-sanityinc-tomorrow")
		  (sanityinc-tomorrow-bright t "https://github.com/purcell/color-theme-sanityinc-tomorrow" "color-theme-sanityinc-tomorrow")
		  (sanityinc-tomorrow-day nil "https://github.com/purcell/color-theme-sanityinc-tomorrow"  "color-theme-sanityinc-tomorrow")
		  (sanityinc-tomorrow-eighties t "https://github.com/purcell/color-theme-sanityinc-tomorrow" "color-theme-sanityinc-tomorrow")
		  (sanityinc-tomorrow-night t "https://github.com/purcell/color-theme-sanityinc-tomorrow" "color-theme-sanityinc-tomorrow")
		  (solarized-dark t "https://github.com/bbatsov/solarized-emacs" "solarized-theme")
		  (solarized-light nil "https://github.com/bbatsov/solarized-emacs" "solarized-theme")
		  (soothe t "https://github.com/emacsfodder/emacs-soothe-theme" "soothe-theme")
      (spacemacs-dark t "https://github.com/nashamri/spacemacs-theme" "spacemacs-theme")
      (spacemacs-light nil "https://github.com/nashamri/spacemacs-theme" "spacemacs-theme")
		  (tango nil "native")
		  (tango-dark t "native")
		  (tangotango t "https://github.com/juba/color-theme-tangotango" "tangotango-theme")
		  (tango-plus nil "https://github.com/tmalsburg/tango-plus-theme" "tango-plus-theme")
		  (tsdh-dark t "native")
		  (tsdh-light nil "native")
		  (wheatgrass t "native")
		  (whiteboard nil "native")
		  (wombat t "native")
		  (zenburn t "https://github.com/bbatsov/zenburn-emacs" "zenburn-theme"))))

    (with-temp-buffer 
      (insert "var emacsThemesGallery = {};\n")
      (insert "emacsThemesGallery.themeProperties = {};\n")
      (insert "emacsThemesGallery.themeProperties.themes = [\n")
      (dolist (theme themes)
	(save-current-buffer
	  (takeThemeScreenshots (symbol-name (car theme)) (if (nth 1 theme) "dark" "light")))
	(insert (concat "{ name: '" (symbol-name (car theme))
			"', dark: " (if (nth 1 theme) "true" "false")
			", location: '" (nth 2 theme) "'"
                        ", melpaName: '" (nth 3 theme) "' },\n")))
      (delete-char -2)
      (insert "\n];")
      (write-region nil nil "../scripts/themeProperties.js"))))

(defun takeThemeScreenshots (themeName shade)
  "Creates screenshots for current theme"
  (let* ((screenShotDir (concat "../screenshots/" shade))
	 (screenShotThemeDir (concat screenShotDir "/" themeName "/"))
	 (sourceFilesAbsolute (--remove (s-ends-with? ".." it)  (directory-files "../language-templates" t)))
	 (scrotCommand (concat "scrot -q 100 -u " screenShotThemeDir)))
    (unless (file-exists-p screenShotDir)
      (make-directory screenShotDir))
    (unless (file-exists-p screenShotThemeDir)
      (make-directory screenShotThemeDir))
    (dolist (sourceFileAbsolute sourceFilesAbsolute)
      (let* ((sourceFileExtension (if (not (file-name-extension sourceFileAbsolute))
				      "dired" 
				    (file-name-extension sourceFileAbsolute)))
	     (screenShotName (concat sourceFileExtension ".png"))
	     (takeScreenshot (concat scrotCommand screenShotName))
	     (pathToScreenshot (concat screenShotThemeDir screenShotName)))
	(unless (file-exists-p pathToScreenshot)
	  (load-theme (car theme) t)
	  (find-file sourceFileAbsolute)
	  (sit-for 1.5)
	  (shell-command takeScreenshot)
	  (shell-command (concat "convert -crop 336x233+0+22 " pathToScreenshot " " pathToScreenshot))
	  (shell-command (concat "optipng " pathToScreenshot))
	  (sit-for 1.5)
	  (disable-theme (car theme)))))))
