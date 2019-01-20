

function bookmark() {
    local base_bookmarks_path="${HOME}/Bookmarks"

    local bookmark_full_unicode='\uf02e'
    local bookmark_empty_unicode='\uf097'
    local folder_unicode='\uf07b'
    local arrow_unicode='\uf178'

    if [[ -z "$1" ]]; then 
        echo "${bookmark_empty_unicode} Specify a folder name in order to bookmark it."
        return
    fi

    if [[ ! -d "$1" ]]; then
        echo "${bookmark_empty_unicode} Only folders can be bookmarked."
        return
    fi

    if [[ -z "$2" ]]; then
        echo "${bookmark_empty_unicode} You need to specify a bookmark name."
        return
    fi

    if [[ -f "${base_bookmarks_path}/shell/$2" ]]; then
        echo "${bookmark_full_unicode} ${folder_unicode} The name $2 is already bookmarked."
        return
    fi

    echo "$1" > "${base_bookmarks_path}/shell/$2"
    echo "${bookmark_empty_unicode} ${arrow_unicode} ${bookmark_full_unicode}  ${folder_unicode}  Bookmarked $1 as $2."
}

function unbookmark() {
    local base_bookmarks_path="${HOME}/Bookmarks"

    if [[ ! -f "${base_bookmarks_path}/shell/$1" ]]; then
        echo "No bookmark named $1 exists."
        return
    fi

    rm "${base_bookmarks_path}/shell/$1"
}