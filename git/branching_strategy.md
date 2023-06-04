### Branching Strategy
    Option 1: 
        Release branch branch is cut from the main branch at the start of the release.
        Any feature branch for this release is cut from and merged back to this release branch.
        Afte successful production, the release branch is merged back into the main branch.
        
        Pros: all releases do not interfer with each other.
        Cons: it may need significant merging effort to resolve all conflicits.
    Option 2: 
        Any feature branch for this release is cut from and merged back to the main branch.
        Release branch branch is cut from the main branch after dev testing is completed.
        No need to merge the release branch back into the main branch (since the main branch
        already has all changes).
        
        Pros: No big bang merging effort
        Cons: releases may interfer with each other. Build/Run problems in one release is propagated
        into other reelases.
        In some scenarios, this option does not work at all. For instance, in release 2 introduces a
        new Spring Bean which is instantiated conditionally (controlled by a external property). In
        This bean is out of scope for Release 1. But this bean is referenced (though not actually used)
        in Release 1. Since this bean will not be instantiated in Release 1, Spring framework will
        complain about unresolved dependency, causing server failing to start.
