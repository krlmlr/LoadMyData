* `dataformat` class can also wrap connections.  Original class is inherited.
* More flexible overriding of the default extension.  Helpers `use_extension()`
  and `parent_extension()`.
* Generic readers for compressed files (#1).
* All tests pass for the new generic interface.

v0.0-1.1 (2014-09-24)
===

* Rename `xxx.reader` to `reader.dataformat.xxx` in code and file names
* Support methods for new S3 class `dataformat`
* Remove `extension.dispatch.table` and related functionality
* All tests pass, but no full coverage yet

v0.0-1 (2014-09-24)
===

* Forked from ProjectTemplate 0.5-1.3
  (https://github.com/johnmyleswhite/ProjectTemplate), renamed to LoadMyData
* Maintainer: Kirill Müller (krlmlr+r@mailbox.org)
* New help topic `supported.file.extensions` for showing supported extensions
* Removed code and data that does not belong to this project
* Removed `library()` calls from examples
* All tests pass
