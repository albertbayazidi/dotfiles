# examples of how to use code
# make_new          c_project           new_project 
# script          project type        new folder name
#
# current project types that are available: c_project/, typst_project/

make_new() {
    template="$1"
    destination="$2"
    cp -r ~/git/hobby/dotfiles/templates/"$template" "$destination"
}
