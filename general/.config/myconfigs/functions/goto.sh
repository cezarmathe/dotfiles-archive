

function goto() {
    local base_bookmarks_path="${HOME}/Bookmarks"

    local bookmark_full_unicode='\uf02e'
    local bookmark_empty_unicode='\uf097'
    local folder_unicode='\uf07b'
    
    if [[ -z "$1" ]]; then
        echo "${bookmark_full_unicode} Bookmarks"
        echo "${folder_unicode} Shell"
        ls -G "${HOME}/Bookmarks/shell"
        echo "${folder_unicode} VsCode workspaces"
        ls -G "${HOME}/Bookmarks/vscode"
        return
    fi

    local cd_dir=""

    if [[ -f "${base_bookmarks_path}/shell/$1" ]]; then
        cd_dir="$(cat ${base_bookmarks_path}/shell/$1)"
    elif [[ -f "${base_bookmarks_path}/vscode/$1.code-workspace" ]]; then
        cd_dir=$(jq -r '.folders[0].path' "${HOME}/Bookmarks/vscode/$1.code-workspace")
    fi

    if [[ ! -z "${cd_dir}" ]]; then
        cd ${cd_dir}
    fi
}