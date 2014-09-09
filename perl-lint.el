;;; perl-lint.el --- Emacs front end of Perl::Lint

;; Copyright (C) 2014 by Syohei YOSHIDA

;; Author: Syohei YOSHIDA <syohex@gmail.com>
;; URL: https://github.com/syohex/
;; Version: 0.01

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(defvar perl-lint--script
  (concat (if load-file-name
              (file-name-directory load-file-name)
            default-directory) "perl-lint.pl"))

;;;###autoload
(defun perl-lint ()
  (interactive)
  (let ((file (buffer-file-name)))
    (unless file
      (error "This buffer is not related to file."))
   (let ((cmd (format "perl %s %s" perl-lint--script (file-name-nondirectory file))))
     (compile cmd))))

(provide 'perl-lint)

;;; perl-lint.el ends here
