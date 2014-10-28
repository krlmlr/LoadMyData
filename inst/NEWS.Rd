\name{NEWS}
\title{News for Package 'LoadMyData'}
\section{Changes in LoadMyData version 0.0-2.2 (2014-10-28)}{
  \itemize{
    \item The \code{reader} function now returns a named list instead of assigning into the
      global envionment.
  }
}
\section{Changes in LoadMyData version 0.0-2.1 (2014-10-05)}{
  \itemize{
    \item Packages required for loading data sources are not attached to the search anymore, as this seems to be unnecessary to achieve proper functionality.
  }
}
\section{Changes in LoadMyData version 0.0-2 (2014-09-25)}{
  \itemize{
    \item Rename \code{xxx.reader} to \code{reader.dataformat.xxx} in code and file names
    \item Support methods for new S3 class \code{dataformat} which can also wrap
      connections.  Original class is inherited.
    \item Generic readers for compressed files (#1).
    \item More flexible overriding of the default extension.  Helpers \code{use_extension()}
      and \code{parent_extension()}.
    \item Remove \code{extension.dispatch.table} and related functionality
    \item All tests pass for the new generic interface.
  }
}
\section{Changes in LoadMyData version 0.0-1 (2014-09-24)}{
  \itemize{
    \item Forked from ProjectTemplate 0.5-1.3
      (https://github.com/johnmyleswhite/ProjectTemplate), renamed to LoadMyData
    \item Maintainer: Kirill Müller (krlmlr+r@mailbox.org)
    \item New help topic \code{supported.file.extensions} for showing supported extensions
    \item Removed code and data that does not belong to this project
    \item Removed \code{library()} calls from examples
    \item All tests pass
  }
}
