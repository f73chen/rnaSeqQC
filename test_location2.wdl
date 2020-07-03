workflow test_location {
    call find_tools
}

task find_tools {
    command <<<
        ls -l /data/HG38_ROOT/hg38_random.fa
        echo "@@@@@@@@@@@@@"
        ls -l /data/HG38_REFFLAT_ROOT/refflat.txt
        echo "@@@@@@@@@@@@@"
        ls -l /data/RNASEQQC_RIBOSOME_GRCH38_BWA_INDEX_ROOT
        echo "@@@@@@@@@@@@@"
    >>>
    output{
        String message = read_string(stdout())
    }
    runtime {
        docker: "g3chen/rnaseqqc@sha256:9e1796bc05a34d4bf184f3c0682bad098738daefa71120e68a5cd8f295b6b05c"
    }
}
