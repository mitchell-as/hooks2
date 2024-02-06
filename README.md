This project has two branches for a Perl@5.36.3 project.

The main branch installed JSON@auto.

The json-4.09 branch installed JSON@4.09 and then Tiny-Tidy@auto.

Attempting to merge json-4.09 into main will result in a `buildscript.as` and `.activestate/commit`
merge conflict.

Resolving the `buildscript.as` to JSON@auto and Tiny-Tidy@auto and `.activestate/commit` to whatever
will invoke the `.git/hooks/pre-commit` hook that checks for a change to `buildscript.as` and, if
there is one, runs `state commit` (which updates `.activestate/commit`), and updates
`.activestate/commit`, overwriting any user change to that file.

Here's an example terminal session:

1. Attempt the merge.

```
me@Activm MINGW64 ~/tmp/hooks2 (main)
$ git merge json-4.09
Auto-merging .activestate/commit
CONFLICT (content): Merge conflict in .activestate/commit
Auto-merging buildscript.as
CONFLICT (content): Merge conflict in buildscript.as
Automatic merge failed; fix conflicts and then commit the result.
```

2. Resolve conflicts and notify Git.

```
me@Activm MINGW64 ~/tmp/hooks2 (main|MERGING)
$ git add .activestate/commit buildscript.as
```

3. Continue the merge, which triggers the `pre-commit` hook to update `.activestate/commit` and then
finish the merge.

```
me@Activm MINGW64 ~/tmp/hooks2 (main|MERGING)
$ git merge --continue
running pre-commit git hook
buildscript.as changed, running 'state commit'
█ Commit Changes (Beta)

Beta Feature: This feature is still in beta and may be unstable.

Updating project to reflect build script changes...
Setting Up Runtime ... ✔ All dependencies have been installed and verified
Runtime updated for project mitchell-as/perl, located at C:\Users\me\tmp\hooks2.
For editors and other tooling use the executables at:
C:\Users\me\AppData\Local\activestate\cache\6ec46ecf\exec.

adding new commit id
hint: Waiting for your editor to close the file... unix2dos: converting file C:/Users/me/tmp/hooks2/.git/COMMIT_EDITMSG to DOS format...
dos2unix: converting file C:/Users/me/tmp/hooks2/.git/COMMIT_EDITMSG to Unix format...
[main 11ce976] Merge branch 'json-4.09'
```

4. Verify the updated buildscript and commit ID are valid and up to date.

```
me@Activm MINGW64 ~/tmp/hooks2 (main)
$ state commit
█ Commit Changes (Beta)

Beta Feature: This feature is still in beta and may be unstable.

No change to the buildscript was found.
```