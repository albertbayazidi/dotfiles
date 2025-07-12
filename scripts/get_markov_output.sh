get_server_output() {
    output="$1"
    destination="$2"
    scp albertba@markov.math.ntnu.no:git/master/prosjekt_oppgave/kode/"$output" "$destination" 
}

