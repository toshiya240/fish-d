function d -d "change to a recently visited directory with fzf"
    # If we have just treat it as `cd` to the specified directory.
    if set -q argv[1]
        cd $argv
        if test -n "$D_AUTO_CMD"
            eval $D_AUTO_CMD
        end
        return
    end

    if set -q argv[2]
        echo (_ "d: Expected zero or one arguments") >&2
        return 1
    end

    set -l all_dirs $dirprev $dirnext
    if not set -q all_dirs[1]
        echo (_ 'No previous directories to select. You have to cd at least once.') >&2
        return 0
    end

    # Reverse the directories so the most recently visited is first in the list.
    # Also, eliminate duplicates; i.e., we only want the most recent visit to a
    # given directory in the selection list.
    set -l uniq_dirs
    for dir in $all_dirs[-1..1]
        if not contains $dir $uniq_dirs
            set uniq_dirs $uniq_dirs $dir
        end
    end

    set dir (printf "%s\n" $uniq_dirs | fzf --prompt=(prompt_pwd)"> ")
    if test -z "$dir"
        # Press Ctrl-C
        return 1
    end

    cd $dir
    if test -n "$D_AUTO_CMD"
        eval $D_AUTO_CMD
    end
end
