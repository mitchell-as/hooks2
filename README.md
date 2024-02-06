This project has two branches for a Perl@5.36.3 project.

The main branch installed JSON@auto.

The json-4.09 branch installed JSON@4.09 and then Tiny-Tidy@auto.

Attempting to merge json-4.09 into main will result in a `buildscript.as` and `.activestate/commit`
merge conflict.

Resolving the `buildscript.as` to JSON@auto and Tiny-Tidy@auto and `.activestate/commit` to whatever
will invoke the `.git/hooks/pre-commit` hook that checks for a change to `buildscript.as` and, if
there is one, runs `state commit` (which updates `.activestate/commit`), and updates
`.activestate/commit`, overwriting any user change to that file.