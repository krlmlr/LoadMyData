v0.0-2.1 (2014-10-05)
===

* Packages required for loading data sources are not attached to the search anymore, as this seems to be unnecessary to achieve proper functionality.

v0.0-2 (2014-09-25)
===

* Rename `xxx.reader` to `reader.dataformat.xxx` in code and file names
* Support methods for new S3 class `dataformat` which can also wrap
  connections.  Original class is inherited.
* Generic readers for compressed files (#1).
* More flexible overriding of the default extension.  Helpers `use_extension()`
  and `parent_extension()`.
* Remove `extension.dispatch.table` and related functionality
* All tests pass for the new generic interface.

v0.0-1 (2014-09-24)
===

* Forked from ProjectTemplate 0.5-1.3
  (https://github.com/johnmyleswhite/ProjectTemplate), renamed to LoadMyData
* Maintainer: Kirill Müller (krlmlr+r@mailbox.org)
* New help topic `supported.file.extensions` for showing supported extensions
* Removed code and data that does not belong to this project
* Removed `library()` calls from examples
* All tests pass
