# examples of how to use code
#./search_pdfs.sh      "*.pdf"    residuals
#   script name        files     search term
#
# This will seach each pdf in the current direcorty for the search_term
#
#./search_pdfs.sh  "10.pdf 5.pdf" residuals -i
# 
# This will seach each pdf in the current direcorty for the search_term not case sensitive
# 
#./search_pdfs.sh  "[1-6].pdf" residuals -n
# This will seach each pdf in the current direcorty for the search_term give line number
#
#./search_pdfs.sh  "[1-6].pdf" residuals -A2
# This will seach each pdf in the current direcorty for the search_term will also write the 2 lines that comes After

search_multiple_pdf_files.sh(){ 
    search_folder=$1
    search_term=$2
    flags=$3

    green="\033[0;32m"
    clear="\033[0;0m"

    ls ${search_folder} | while read pdf_file; do
        echo -e "${green}${pdf_file}${clear}"
        pdftotext "${pdf_file}" - | rg "${search_term}" ${flags}
    done

}
