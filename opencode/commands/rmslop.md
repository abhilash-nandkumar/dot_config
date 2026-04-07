---
description: Remove AI code slop
---
Ask me for approval before starting to make edits. Check the diff against main, and remove all AI generated slop introduced in this branch. 

This includes:

- Extra comments that a human wouldn't add or is inconsistent with the rest of the file
- Extra defensive checks or try/catch blocks that are abnormal for that area of the codebase (especially if called by trusted / validated codepaths)
- Casts to any to get around type issues
- Any other style that is inconsistent with the file
- Redundant helper functions and tests which are potentially 
- Remove reduntant tests and parts of code that are out of scope due to the current set of changes in this branch.

Report at the end with only a 1-3 sentence summary of what you changed.
