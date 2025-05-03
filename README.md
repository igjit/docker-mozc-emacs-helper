# mozc_emacs_helper in Docker

Minimal Docker-based wrapper for `mozc_emacs_helper`, designed to work with Emacs on any system.

## Build

```sh
docker build -t mozc_emacs_helper .
```

## Usage

You can create a simple wrapper script like `mozc_emacs_helper.sh`:

```sh
#!/bin/sh
exec docker run --rm -i mozc_emacs_helper
```

Make sure it's executable:

```sh
chmod +x mozc_emacs_helper.sh
```

You can test the helper like this:

```sh
printf '(0 CreateSession)\n(1 SendKey 1 97)' | ./mozc_emacs_helper.sh
```

If everything is set up correctly, you'll receive responses from the helper process.

## Emacs Configuration Example

```el
(require 'mozc)
(setq default-input-method "japanese-mozc")

; NOTE: replace /path/to with actual script location
(setq mozc-helper-program-name "/path/to/mozc_emacs_helper.sh")
(setq mozc-helper-process-timeout-sec 4)
```
