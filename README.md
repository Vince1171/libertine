Libertine
=========

An app managing support for legacy Ubuntu applications in a Snappy Personal
environment.

Legacy application support is performed through containers which provide a
sandboxed chroot-style environment that supports DEB packages and an X11 socket.
One or more of these environments can be configured, and each environment can
container one or more installed applications.

Logging
-------

On Ubuntu Touch, most Libertine logs are printed to the Upstart job folder, `~/.cache/upstart/`. They are contained in a file matching the pattern `application-legacy-[container-id]_[executable-name]_0.0-.log`.

You can enable more logging with the `LIBERTINE_DEBUG` environment variable. To set this under Upstart, run one of the following commands as the user starting Libertine:

```
# For INFO-level logging
initctl set-env LIBERTINE_DEBUG=1
# For DEBUG-level logging
initctl set-env LIBERTINE_DEBUG=2
```
